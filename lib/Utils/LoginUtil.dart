// ignore_for_file: file_names

import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginUtil {
  // ignore: constant_identifier_names
  static const String TAG = "LoginUtil";
  // ignore: unused_field
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  // final FacebookAuth facebookAuth = FacebookAuth();
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
    if (user != null) {
      assert(!user.isAnonymous);
      assert(await user.getIdToken() != null);

      final User? currentUser = _auth.currentUser;
      assert(user.uid == currentUser?.uid);

      log('$TAG, signWithGoogle succeeded: $user');

      return user;
    }

    return null;
  }

  Future<void> signOutGoogle() async{
    await googleSignIn.signOut();

    log("$TAG user Signed Out, Google.");
  }


  Future<UserCredential> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login(
      permissions: ['email', 'public_profile','user_birthday']
    );

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.token);

    final userData = await FacebookAuth.instance.getUserData();
    var userMail = userData["email"];

    // Once signed in, return the UserCredential
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }


}