import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tchating/screens/create_account.dart';
import 'package:tchating/screens/loading.dart';
import 'package:tchating/screens/verification.dart';
import 'package:tchating/screens/welcome_page.dart';
import 'package:sizer/sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            appBarTheme: AppBarTheme(
                backgroundColor: Colors.grey[50],
                iconTheme: IconThemeData(
                  color: Colors.blue[700],
                )),
            primarySwatch: Colors.blue,
            scaffoldBackgroundColor: Colors.grey[50],
          ),
          initialRoute: '/',
          routes: {
            '/': (context) => Loading(),
            '/welcome_page': (context) => WelcomePage(),
            '/create_account': (context) => CreatAccount(),
            '/verification': (context) => VerificationCode(),
          },
        );
      },
    );
  }
}
