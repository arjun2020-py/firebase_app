import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthServices {
  FirebaseAuth auth = FirebaseAuth.instance;
  Future<User?> siginupWithEmailAndPasswrod(
      String email, String password) async {
    try {
      UserCredential credential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);

      return credential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        print('This is email is allready in use');
      } else {
        print('An error is occured ${e.code}');
      }
    }
  }

  Future<User?> sigininWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential credential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found' || e.code == 'passwrod-is-wrong') {
        print('inavild username or passwrod');
      } else {
        print('An error is occured ${e.code}');
      }
    }
  }
}
