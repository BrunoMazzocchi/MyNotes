import 'package:firebase_auth/firebase_auth.dart' show User;
import 'package:flutter/cupertino.dart';

// It won't change since is immutable
@immutable
class AuthUser {
  final bool isEmailVerified;
  const AuthUser(this.isEmailVerified);

  // Gets the user email from firebase
  factory AuthUser.fromFirebase(User user) => AuthUser(user.emailVerified);
}
