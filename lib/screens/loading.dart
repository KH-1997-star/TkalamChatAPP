

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tchating/services/locate_user.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  UserLoc userLoc = UserLoc();
  void getLoc() async {
    await userLoc.getLoc();
    Navigator.pushReplacementNamed(context, '/welcome_page', arguments: {
      'country': userLoc.country,
      'countrycode': userLoc.countryCode,
    });
  }

  void initState() {
    // TODO: implement initState

    super.initState();
    getLoc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: SpinKitWave(
          color: Colors.white,
          size: 150,
        ),
      ),
    );
  }
}
