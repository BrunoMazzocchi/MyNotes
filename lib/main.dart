import 'package:flutter/material.dart';
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
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text('Home page'),
        ),
        body: FutureBuilder(
            future: Firebase.initializeApp(
              options: DefaultFirebaseOptions.currentPlatform,
            ),
            // Context is where the UI is and snapshot the
            // snapshot the state of the object
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.done:
                  return const Text('Done');

                default:
                  return const Text('Loading...');
              }
            }));
  }
}
