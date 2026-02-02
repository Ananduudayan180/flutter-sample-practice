import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_bloc_social_media/data/models/user_model.dart';

abstract class AuthReprository {
  Future<UserCredential?> loginInEmailAndPass(UserModel user);
  Future<UserCredential?> registerEmailAndPass(UserModel user);
  Future<bool> signOut();
  User? checkCurrentUser();
}
