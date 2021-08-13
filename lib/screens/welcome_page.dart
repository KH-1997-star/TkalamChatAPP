import 'package:flutter/material.dart';
import 'package:footer/footer.dart';
import 'package:sizer/sizer.dart';
import 'package:footer/footer_view.dart';
import 'package:tchating/consts/const.dart';

class WelcomePage extends StatelessWidget {
  Map locationData = {};

  @override
  Widget build(BuildContext context) {
    locationData = ModalRoute.of(context).settings.arguments;
    print(locationData);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          top: 60,
          left: 20,
          right: 20,
          bottom: 10,
        ),
        child: FooterView(
          children: [
            Column(
              children: [
                Text(
                  'Bienvenue sur TkalamApp',
                  style: TextStyle(
                    color: Colors.blue[700],
                    fontSize: 6.w,
                    letterSpacing: 1,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 130,
                ),
                Image.asset(
                  'images/chat.png',
                  height: 180,
                  width: 200,
                ),
                SizedBox(
                  height: 150,
                ),
                Text(
                  confid,
                  style: TextStyle(
                    height: 1.5,
                    letterSpacing: 0.2,
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                SizedBox(
                  width: 250,
                  height: 35,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                        context,
                        '/create_account',
                        arguments: {
                          'country': locationData['country'],
                          'countrycode': locationData['countrycode']
                        },
                      );
                    },
                    child: Text(
                      'ACCEPTER ET CONTINUER',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          Colors.blue[400],
                        ),
                        elevation: MaterialStateProperty.all(
                          2,
                        )),
                  ),
                ),
              ],
            ),
          ],
          footer: Footer(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'from',
                  style: TextStyle(
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(
                  height: 7,
                ),
                Text(
                  'KHK Startup',
                  style: TextStyle(
                    color: Colors.blue[400],
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            backgroundColor: Colors.grey[50],
          ),
          flex: 0.9.h.toInt(),
        ),
      ),
    );
  }
}
