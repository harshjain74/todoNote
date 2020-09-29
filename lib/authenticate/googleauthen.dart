import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:todeay/screens/tasks_screen.dart';

class SignIn {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  Future<User> handleSignin(BuildContext context) async {
    User user;
    bool isSignedin = await googleSignIn.isSignedIn();
    try {
      if (isSignedin) {
        user = auth.currentUser;
        print('user h bhaiya');
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => TaskScreen(user, googleSignIn, auth)));
      } else {
        GoogleSignInAccount googleUser = await googleSignIn.signIn();

        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;
        // get the credentials to (access / id token)
        // to sign in via Firebase Authentication
        final AuthCredential credential = GoogleAuthProvider.credential(
            accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

        user = (await auth.signInWithCredential(credential)).user;
      }
    } catch (e) {
      print(e);
    }
    return user;
  }

  void onGoogleSignIn(BuildContext context) async {
    await Firebase.initializeApp();
    await handleSignin(context).whenComplete(() {
      print('loggin');
    });
    User usr = auth.currentUser;
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (context) => TaskScreen(usr, googleSignIn, auth)),
        (route) => false);
  }
}
