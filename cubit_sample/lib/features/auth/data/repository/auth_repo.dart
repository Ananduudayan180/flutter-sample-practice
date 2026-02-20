import 'package:cubit_sample/features/auth/data/models/auth_model.dart';

abstract class AuthRepo {
  //Gmail account
  Future<AuthModel?> loginWithEmailPass(AuthModel authModel);
  Future<AuthModel?> registerWithEmailPass(AuthModel authModel);
  Future<bool> logOutUser();
  bool checkLoginStatus();

  //Phone num account
  Future<void> sendOtp(String phoneNumber);
  Future<bool> verifyOtp(String smsCode);
}
