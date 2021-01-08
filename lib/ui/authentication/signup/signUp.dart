import 'package:ecommerce/ui/authentication/signup/components/body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Register Account')),
      body: Body(),
    );
  }
}
