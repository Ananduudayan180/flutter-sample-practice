import 'package:firebase_auth/firebase_auth.dart';

class FirebasePhoneAuth {
  final firebasePhoneAuth = FirebaseAuth.instance;

  String? _verificationId;
  Future<void> sendOtp(String phoneNumber) async {
    await firebasePhoneAuth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await firebasePhoneAuth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException error) {
        throw Exception(error.message);
      },
      codeSent: (String verificationId, int? resendToken) {
        _verificationId = verificationId;
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        _verificationId = verificationId;
      },
    );
  }

  Future<bool> verifyOtp(String smsCode) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationId!,
        smsCode: smsCode,
      );

      await firebasePhoneAuth.signInWithCredential(credential);

      return true;
    } on Exception catch (_) {
      return false;
    }
  }
}
