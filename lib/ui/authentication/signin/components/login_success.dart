import 'package:ecommerce/ui/shared/default_btn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginSuccess extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login Success')),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.08),
            Image.asset('assets/images/success.png'),
            SizedBox(height: MediaQuery.of(context).size.height * 0.09),
            Text('Login Success'),
            SizedBox(height: MediaQuery.of(context).size.height * 0.09),
            DefaultButton(text: 'Back to home', press: () {})
          ],
        ),
      ),
    );
  }
}
