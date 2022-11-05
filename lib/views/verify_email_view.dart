import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:free_code_camp/constants/routes.dart';
import 'package:free_code_camp/services/auth/auth_service.dart';

class VerifyEmailView extends StatefulWidget {
  const VerifyEmailView({Key? key}) : super(key: key);

  @override
  State<VerifyEmailView> createState() => _VerifyEmailViewState();
}

class _VerifyEmailViewState extends State<VerifyEmailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          systemOverlayStyle:
              const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
          backgroundColor: Colors.blue,
          title: const Text('Email verification'),
        ),
        body: Column(children: [
          const Text("We've sent a verification email"),
          const Text(
              "If you haven't receive the verification email yet, please "
              "press the button below"),
          TextButton(
              onPressed: () async {
                final user = AuthService.firebase().currentUser;
                AuthService.firebase().sendEmailVerification();
              },
              child: const Text('Send email verification')),
          TextButton(
            onPressed: () async {
              await AuthService.firebase().logOut();
              Navigator.of(context).pushNamedAndRemoveUntil(
                registerRoute,
                (route) => false,
              );
            },
            child: const Text('Go back'),
          )
        ]));
  }
}
