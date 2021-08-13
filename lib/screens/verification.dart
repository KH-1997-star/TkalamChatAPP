import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:tchating/consts/const.dart';
import 'package:tchating/services/auth_service.dart';

class VerificationCode extends StatefulWidget {
  @override
  _VerificationCodeState createState() => _VerificationCodeState();
}

class _VerificationCodeState extends State<VerificationCode> {
  Map data = {};
  AuthService _authService = AuthService();

  TextEditingController _pinCodeController = TextEditingController();
  @override
  void dispose() {
    _pinCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Vérifier le ${data['phoneNumber']}',
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
                detect + data['phoneNumber'],
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
                onChanged: (val) {
                  print(val);
                },
                onCompleted: (code) {
                  _authService.signInPhone(data['verifId'], code);
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
