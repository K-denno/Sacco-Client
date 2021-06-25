
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:github_sign_in/github_sign_in.dart';
import 'package:flutter_config/flutter_config.dart';

class FirebaseUtils {

      static getFirebaseInstance() {
        return FirebaseAuth.instance;
      }

      User getUser() {
        return FirebaseAuth.instance.currentUser;
      }

      static Future<UserCredential> sgnInWithGoogle() async {
        //Trigger the auth
        final GoogleSignInAccount googleUser
          = await GoogleSignIn().signIn();
        final GoogleSignInAuthentication gAuth
          = await googleUser.authentication;

        // Create a new credential
        final GoogleAuthCredential credential
           = GoogleAuthProvider.credential(
              accessToken: gAuth.accessToken,
              idToken: gAuth.idToken,
            );
        return await FirebaseUtils.getFirebaseInstance()
          .signInWithCredential(credential);
      }

      static Future<UserCredential> signInWithGithub(BuildContext context) async {
        //Trigger the auth
        // Create a GitHubSignIn instance
        final GitHubSignIn gitHubSignIn = GitHubSignIn(
          clientId: FlutterConfig.get('GITHUB_CLIENT_ID'),
          clientSecret: FlutterConfig.get('GITHUB_CLIENT_SECRET'),
          redirectUrl: 'https://my-project.firebaseapp.com/__/auth/handler');

        // Trigger the sign-in flow
        final result = await gitHubSignIn.signIn(context);

        // Create a credential from the access token
        final AuthCredential githubAuthCredential =
          GithubAuthProvider.credential(result.token);

        // Once signed in, return the UserCredential
        return await FirebaseUtils.getFirebaseInstance()
          .signInWithCredential(githubAuthCredential);
      }
}