import 'package:firebase_auth/firebase_auth.dart';

class FirebaseUtils {

      static getFirebaseInstance() {
        return FirebaseAuth.instance;
      }

      User getUser() {
        return FirebaseAuth.instance.currentUser;
      }
}