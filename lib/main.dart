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
    home: const LoginView(),
  ));
}
