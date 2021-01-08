import 'package:ecommerce/ui/authentication/forgotpassword/forgotPassword.dart';
import 'package:ecommerce/ui/authentication/signin/components/login_success.dart';
import 'package:ecommerce/ui/authentication/signin/signIn.dart';
import 'package:ecommerce/ui/authentication/signup/signUp.dart';
import 'package:ecommerce/ui/details/details.dart';
import 'package:ecommerce/ui/home/home.dart';
import 'package:ecommerce/ui/splash/splash.dart';
import 'package:ecommerce/ui/them/thems.dart';
import 'package:ecommerce/utils/constants.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          inputDecorationTheme: inputDecorationTheme(),
          scaffoldBackgroundColor: Colors.white,
          fontFamily: "Multi",
          appBarTheme: AppBarTheme(
              color: Colors.white,
              elevation: 0,
              brightness: Brightness.light,
              iconTheme: IconThemeData(color: Colors.black),
              textTheme: TextTheme(
                  headline6:
                      TextStyle(color: Color(0xfF8B8B8B), fontSize: 18))),
          textTheme: TextTheme(
              bodyText1: TextStyle(color: kTextColor),
              bodyText2: TextStyle(color: kTextColor)),
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => Home(),
          '/login': (context) => SignIn(),
          '/forgot-password': (context) => ForgotPassword(),
          '/login-success': (context) => LoginSuccess(),
          '/register': (context) => SignUp(),
          '/product-details': (context) => Details(),
        });
  }
}
