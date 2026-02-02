import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_bloc_social_media/data/models/user_model.dart';
import 'package:firebase_bloc_social_media/data/repositories/auth_reprository.dart';

class FirebaseAuthService extends AuthReprository {
  FirebaseAuth authService = FirebaseAuth.instance;

  @override
  Future<UserCredential?> loginInEmailAndPass(UserModel user) async {
    try {
      UserCredential userData = await authService.signInWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );
      return userData;
    } on FirebaseAuthException catch (_) {
      return null;
    }
  }

  @override
  Future<UserCredential?> registerEmailAndPass(UserModel user) async {
    try {
      UserCredential userData = await authService
          .createUserWithEmailAndPassword(
            email: user.email,
            password: user.password,
          );
      return userData;
    } on FirebaseAuthException catch (_) {
      return null;
    }
  }

  @override
  Future<bool> signOut() async {
    try {
      authService.signOut();
      return true;
    } on FirebaseAuthException catch (_) {
      return false;
    }
  }

  @override
  User? checkCurrentUser()  {
    final currentUser = authService.currentUser;

    if (currentUser != null) {
      return currentUser;
    }
    return null;
  }
}
