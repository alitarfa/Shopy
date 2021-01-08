import 'package:ecommerce/ui/authentication/forgotpassword/Body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forgot Password', textAlign: TextAlign.center),
      ),
      body: Body(),
    );
  }
}
