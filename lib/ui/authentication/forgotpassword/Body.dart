import 'package:ecommerce/ui/shared/default_btn.dart';
import 'package:ecommerce/utils/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Body extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String email = "";
  Set<String> errors = {};

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.04),
            Text('Forgot Password'),
            Text('Please enter your email and we will send \n '
                'you a link to return to your account'),
            SizedBox(height: MediaQuery.of(context).size.height * 0.2),
            buildEmailInputForm(),
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            DefaultButton(text: 'Continue', press: () {})
          ],
        ),
      ),
    );
  }

  Widget buildEmailInputForm() {
    return Form(
        child: TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      validator: (value) {
        if (value.isEmpty) {
          errors.add('Please enter your email');
        }
        return null;
      },
      onChanged: (value) {
        if (value.isNotEmpty) {
          errors.remove('Please enter your email');
        }
      },
      decoration: InputDecoration(
        suffixIcon: buildIcon("assets/icons/Mail.svg"),
        labelText: "Email",
        hintText: "Enter your email",
      ),
    ));
  }

  Padding buildIcon(String path) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        0,
        getProportionateScreenWidth(20),
        getProportionateScreenWidth(20),
        getProportionateScreenWidth(20),
      ),
      child: SvgPicture.asset(
        path,
        height: getProportionateScreenWidth(18),
      ),
    );
  }
}
