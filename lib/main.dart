import 'package:flutter/material.dart';
import 'constants/routes.dart';
import 'views/note_view.dart';
import 'package:free_code_camp/views/register_view.dart';
import 'package:free_code_camp/views/verify_email_view.dart';
import 'views/login_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import '../firebase_options.dart';

void main() {
  runApp(MaterialApp(
    title: 'Free code camp',
    theme: ThemeData(
      backgroundColor: Colors.white,
    ),
    home: const HomePage(),
    routes: {
      loginRoute: (context) => const LoginView(),
      registerRoute: (context) => const RegisterView(),
      notesRoute: (context) => const NotesView(),
    },
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        ),
        // Context is where the UI is and snapshot the
        // snapshot the state of the object
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              final user = FirebaseAuth.instance.currentUser;
              final emailVerified = user?.emailVerified ?? false;


              if (user != null && !emailVerified) {
                return const VerifyEmailView();
              } else if (user == null) {
                return const LoginView();
              }

              return const NotesView();

            default:
              return const CircularProgressIndicator();
          }
        });
  }
}

