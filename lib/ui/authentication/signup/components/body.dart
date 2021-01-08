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
  final Set<String> errors = {};
  final _formKey = GlobalKey<FormState>();

  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.08),
              Text('Register Account',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: getProportionateScreenWidth(28),
                      fontWeight: FontWeight.bold)),
              Text('Complete your details \n or continue with social media', textAlign: TextAlign.center,),
              SizedBox(height: MediaQuery.of(context).size.height * 0.08),
              registerForm(),
              DefaultButton(text: 'Register', press: () {}),
              SizedBox(height: MediaQuery.of(context).size.height * 0.08),
              socialMediaLogin({
                "assets/icons/facebook-2.svg",
                "assets/icons/google-icon.svg"
              }),
              SizedBox(height: MediaQuery.of(context).size.height * 0.08),
            ],
          ),
        ),
      ),
    );
  }

  Widget registerForm() {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            buildEmailField(),
            SizedBox(height: MediaQuery.of(context).size.height * 0.04),
            buildPasswordField(),
            errorPlaceHolder(),
            SizedBox(height: MediaQuery.of(context).size.height * 0.08),
          ],
        ));
  }

  TextFormField buildEmailField() {
    return TextFormField(
      onSaved: (newValue) => email = newValue,
      keyboardType: TextInputType.emailAddress,
      onChanged: (value) {
        if (value.isNotEmpty) {
          setState(() {
            errors.remove("Please enter your email");
          });
        }
      },
      validator: (value) {
        if (value.isEmpty) {
          setState(() {
            errors.add("Please enter your email");
          });
        }
        return null;
      },
      decoration: InputDecoration(
        suffixIcon: buildIcon("assets/icons/Mail.svg"),
        labelText: "Email",
        hintText: "Enter your email",
      ),
    );
  }

  TextFormField buildPasswordField() {
    return TextFormField(
        onSaved: (newValue) => password = newValue,
        onChanged: (value) {
          if (value.isNotEmpty) {
            setState(() {
              errors.remove('Please enter your password');
            });
          }
        },
        validator: (value) {
          if (value.isEmpty) {
            setState(() {
              errors.add('Please enter your password');
            });
          }
          return null;
        },
        keyboardType: TextInputType.text,
        obscureText: true,
        decoration: InputDecoration(
            suffixIcon: buildIcon("assets/icons/Lock.svg"),
            labelText: "Password",
            hintText: "Enter your password"));
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

  Widget errorPlaceHolder() {
    return Column(
        children: errors.map((error) => Row(children: [Text(error)])).toList());
  }

  Widget socialMediaLogin(Set<String> assets) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: assets
            .map((e) => Container(
                  child: SvgPicture.asset(e),
                  width: getProportionateScreenWidth(40),
                  height: getProportionateScreenHeight(40),
                  padding: EdgeInsets.all(getProportionateScreenHeight(12)),
                  decoration: BoxDecoration(
                      color: Colors.black12, shape: BoxShape.circle),
                ))
            .toList());
  }
}
