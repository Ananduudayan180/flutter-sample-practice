import 'package:cubit_sample/features/auth/data/models/auth_model.dart';
import 'package:cubit_sample/features/auth/data/repository/auth_repo.dart';
import 'package:cubit_sample/features/auth/data/services/gmail_auth_service.dart';
import 'package:cubit_sample/features/auth/data/services/phone_auth_service.dart';

class AuthRepositoryImpl implements AuthRepo {
  final FirebaseGmailAuth gmailService;
  final FirebasePhoneAuth phoneService;

  AuthRepositoryImpl({required this.gmailService, required this.phoneService});

  //for Gmail
  @override
  checkLoginStatus() => gmailService.checkLoginStatus();

  @override
  logOutUser() => gmailService.logOutUser();

  @override
  loginWithEmailPass(AuthModel authModel) =>
      gmailService.loginWithEmailPass(authModel);

  @override
  registerWithEmailPass(AuthModel authModel) =>
      gmailService.registerWithEmailPass(authModel);

  //for Phone
  @override
  sendOtp(String phoneNumber) => phoneService.sendOtp(phoneNumber);

  @override
  verifyOtp(String smsCode) => phoneService.verifyOtp(smsCode);
}
