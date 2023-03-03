// ignore_for_file: file_names

import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginUtil {
  // ignore: constant_identifier_names
  static const String TAG = "LoginUtil";
  // ignore: unused_field
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  Future<User?> signInWithGoogle() async{
    log("$TAG, singInWithGoogle() init...");
    
    final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
    log("$TAG, signInWithGoogle() googleUser email ->  ${googleSignInAccount?.email}");

    GoogleSignInAuthentication authentication = await googleSignInAccount!.authentication;

    AuthCredential authCredential = GoogleAuthProvider.credential(
      accessToken: authentication.accessToken,
      idToken: authentication.idToken);

    UserCredential credential  = await _auth.signInWithCredential(authCredential);

    User? user = credential.user;

    return isCurrentSignIn(user);

  }
  
  Future<User?> isCurrentSignIn(User? user) async {
    
  }


}