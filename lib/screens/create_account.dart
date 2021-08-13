import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import 'package:tchating/consts/const.dart';
import 'package:tchating/screens/verification.dart';

class CreatAccount extends StatelessWidget {
  @override
  Map locateData = {};
  String phoneNumber = '', code = '', id = '';
  Widget build(BuildContext context) {
    locateData = ModalRoute.of(context).settings.arguments;
    print(locateData['country']);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Saisissez votre numéro de téléphone',
          style: TextStyle(
            color: Colors.blue[700],
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: null,
            icon: Icon(
              Icons.drag_indicator_sharp,
            ),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(
          top: 20,
          left: 20,
          right: 20,
          bottom: 10,
        ),
        child: ListView(
          children: [
            Column(
              children: [
                Text(
                  telverif,
                  style: TextStyle(
                    letterSpacing: 0.2,
                    height: 1.5,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                IntlPhoneField(
                  initialCountryCode: locateData['countrycode'],
                  autofocus: true,
                  onChanged: (val) {
                    phoneNumber = val.number;
                    code = val.countryCode;
                    print(code + phoneNumber);
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Des frais d\'opérateur pour les SMS peuvent s\'appliquer',
                  style: TextStyle(color: Colors.grey[600]),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 2,
                ),
                SizedBox(
                  width: 100,
                  height: 45,
                  child: TextButton(
                    onPressed: () async {
                      //await authService.createAccount(phoneNumber, code, id);
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => VerificationCode(
                                phonrNumber: code + phoneNumber,
                              )));
                    },
                    child: Text(
                      'SUIVANT',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        Colors.blue[400],
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
