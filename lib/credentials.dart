//import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:midterm/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';


/*
Future<UserCredential> signInWithGoogle() async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth =
      await googleUser?.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  // Once signed in, return the UserCredential
  return await FirebaseAuth.instance.signInWithCredential(credential);
}
*/


/*
assets:
    - assets/images/
    - assets/images/fbook icon.png
    - assets/images/google icon.png

    validate: ^1.7.0
  firebase_auth: ^3.1.1
  google_sign_in: ^4.5.1

*/