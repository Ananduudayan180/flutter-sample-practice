import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cubit_sample/features/auth/data/models/auth_model.dart';
import 'package:cubit_sample/features/auth/data/repository/auth_repo.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepo authRepo;
  AuthCubit({required this.authRepo}) : super(AuthInitial());

  //GMAIL - OPERATIONS
  //Login
  Future<void> login(String email, String pass) async {
    emit(AuthLoading());
    final authModel = AuthModel(name: null, email: email, pass: pass);

    final user = await authRepo.loginWithEmailPass(authModel);

    if (user != null) {
      emit(AuthLoaded());
    } else {
      emit(AuthError('login failed'));
    }
  }

  //Register
  Future<void> register(String name, String email, String pass) async {
    emit(AuthLoading());
    final authModel = AuthModel(name: name, email: email, pass: pass);

    final user = await authRepo.registerWithEmailPass(authModel);

    if (user != null) {
      emit(AuthLoaded());
    } else {
      emit(AuthError('Register failed'));
    }
  }

  //log out
  Future<void> logOut() async {
    final bool isLoggedOut = await authRepo.logOutUser();
    if (isLoggedOut) {
      emit(AuthInitial());
    } else {
      emit(AuthError('log out failed'));
    }
  }

  //check login status
  void checkLoginStatus() {
    final bool isLogged = authRepo.checkLoginStatus();
    if (isLogged) {
      emit(AuthLoaded());
    } else {
      emit(AuthInitial());
    }
  }

  //PHONE NUM - OPERATIONS
  Future<void> sendOtp(String phoneNumber) async {
    emit(AuthLoading());
    await authRepo.sendOtp(phoneNumber);
    emit(AuthLoaded());
   
  }
}
