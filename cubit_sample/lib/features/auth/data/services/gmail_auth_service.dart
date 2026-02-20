import 'package:cubit_sample/features/auth/data/models/auth_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseGmailAuth  {
  final firebaseGmailAuth = FirebaseAuth.instance;

  //Login
  Future<AuthModel?> loginWithEmailPass(AuthModel authModel) async {
    try {
      UserCredential userCredential = await firebaseGmailAuth
          .signInWithEmailAndPassword(
            email: authModel.email,
            password: authModel.pass,
          );

      if (userCredential.user == null) {
        return null;
      }

      return authModel;
    } on Exception catch (_) {
      return null;
    }
  }

  //Register
  Future<AuthModel?> registerWithEmailPass(AuthModel authModel) async {
    try {
      UserCredential userCredential = await firebaseGmailAuth
          .createUserWithEmailAndPassword(
            email: authModel.email,
            password: authModel.pass,
          );
      if (userCredential.user == null) {
        return null;
      }

      return authModel;
    } on Exception catch (_) {
      return null;
    }
  }

  //log out
  Future<bool> logOutUser() async {
    try {
      await firebaseGmailAuth.signOut();
      return true;
    } on Exception catch (_) {
      return false;
    }
  }

  //check login status
  bool checkLoginStatus() {
    final currentUser = firebaseGmailAuth.currentUser;

    if (currentUser != null) {
      //logged in
      return true;
    }
    //not logged in
    return false;
  }
}
