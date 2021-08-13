import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:tchating/consts/const.dart';

class VerificationCode extends StatefulWidget {
  final String phonrNumber;
  String verificationCode = '';
  VerificationCode({this.phonrNumber});
  @override
  _VerificationCodeState createState() => _VerificationCodeState();
}

class _VerificationCodeState extends State<VerificationCode> {
  FirebaseAuth _auth = FirebaseAuth.instance;

  TextEditingController _pinCodeController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    createAccount(widget.phonrNumber);
  }

  void dispose() {
    _pinCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Vérifier le ${widget.phonrNumber}',
          style: TextStyle(
            color: Colors.blue[700],
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(
          vertical: 60,
          horizontal: 40,
        ),
        children: [
          Column(
            children: [
              Text(
                detect + widget.phonrNumber,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              PinCodeTextField(
                appContext: (context),
                keyboardType: TextInputType.number,
                controller: _pinCodeController,
                autoFocus: true,
                pinTheme: PinTheme(
                  inactiveColor: Colors.black,
                ),
                length: 6,
                obscureText: true,
                backgroundColor: Colors.transparent,
                onChanged: (val) {},
                onCompleted: (code) async {
                  await signInPhone(widget.verificationCode, code);
                  Navigator.pushNamed(context, '/menu');
                },
              )
            ],
          )
        ],
      ),
    );
  }

  Future createAccount(String number) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: number,
      verificationCompleted: (PhoneAuthCredential phoneCrad) async {
        await _auth.signInWithCredential(phoneCrad).then((value) {
          print(value);
        });
      },
      verificationFailed: (FirebaseAuthException authException) {
        print(authException.message);
      },
      codeSent: (String verificationId, int resendToken) {
        setState(() {
          widget.verificationCode = verificationId;
        });
      },
      timeout: Duration(seconds: 60),
      codeAutoRetrievalTimeout: (String verificationId) {
        setState(() {
          widget.verificationCode = verificationId;
        });
      },
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
