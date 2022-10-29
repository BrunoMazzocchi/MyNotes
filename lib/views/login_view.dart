import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:free_code_camp/views/register_view.dart';
import '../firebase_options.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    // TODO: implement initState
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      systemOverlayStyle:
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    backgroundColor: Colors.blue,
    title: const Text('Login'),
    ),
    body:  Column(
      children: [
        TextField(
          controller: _email,
          enableSuggestions: true,
          autocorrect: true,
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(
            hintText: 'Enter your email',
          ),
        ),
        TextField(
          controller: _password,
          obscureText: true,
          enableSuggestions: false,
          autocorrect: false,
          decoration: const InputDecoration(hintText: 'Enter your password'),
        ),
        TextButton(
          onPressed: () async {
            final email = _email.text;
            final password = _password.text;
            final userCredential = await FirebaseAuth.instance
                .signInWithEmailAndPassword(email: email, password: password);
          },
          child: const Text('Login'),
        ),
        TextButton(
            onPressed: () {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil('/register/', (route) => false);
            },
            child: const Text('If not registered click here!'))
      ],
    ));
  }
}
