import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future createAccount(String number, code, id) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: '+216' + number,
      verificationCompleted: (PhoneAuthCredential phoneCard) async {
        await _auth.signInWithCredential(phoneCard);
      },
      verificationFailed: (FirebaseAuthException authException) {
        String error = '';
        error = 'le $number est invalid';

        return error;
      },
      codeSent: (String verificationId, int resendToken) {
        print('code : $resendToken');
        id = verificationId;
      },
      timeout: Duration(seconds: 30),
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  Future signInPhone(verifId, smsCode) async {
    try {
      await _auth.signInWithCredential(
        PhoneAuthProvider.credential(verificationId: verifId, smsCode: smsCode),
      );
    } catch (e) {
      print(e);
    }
  }
}
