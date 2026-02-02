import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_bloc_social_media/data/models/user_model.dart';
import 'package:firebase_bloc_social_media/data/repositories/auth_reprository.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthReprository authRepo;

  AuthCubit({required this.authRepo}) : super(AuthInitial());

  //logout
  Future<void> loginUser(UserModel user) async {
    emit(AuthLoading());

    UserCredential? userData = await authRepo.loginInEmailAndPass(user);

    if (userData != null) {
      emit(AuthLoaded());
    } else {
      emit(AuthError(errorMsg: 'Login failed'));
      emit(AuthInitial());
    }
  }

  //register
  Future<void> registerUser(UserModel user) async {
    emit(AuthLoading());

    UserCredential? userData = await authRepo.registerEmailAndPass(user);

    if (userData != null) {
      emit(AuthLoaded());
    } else {
      emit(AuthError(errorMsg: 'Register failed'));
      emit(AuthInitial());
    }
  }

  //logout
  Future<void> logOut() async {
    emit(AuthLoading());
    bool loginStatus = await authRepo.signOut();

    if (loginStatus == true) {
      (emit(AuthInitial()));
    } else {
      emit(AuthError(errorMsg: 'Sign out failed'));
    }
  }

//check user is available
  void checkCurrentUser() {
    User? currentUser = authRepo.checkCurrentUser();
    if (currentUser != null) {
      emit(AuthLoaded());
    } else {
      emit(AuthInitial());
    }
  }
}
