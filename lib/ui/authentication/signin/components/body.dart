import 'package:ecommerce/ui/shared/default_btn.dart';
import 'package:ecommerce/utils/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SizedBox(
      width: double.infinity,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.04),
              Text(
                'Welcome Back',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: getProportionateScreenWidth(28),
                    fontWeight: FontWeight.bold),
              ),
              Text(
                'Sign in with your email \n or continue with social media',
                textAlign: TextAlign.center,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.08),
              SignForm()
            ],
          ),
        ),
      ),
    ));
  }
}

class SignForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  final Set<String> errors = {};

  String email, password;
  static bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            buildEmailField(),
            SizedBox(height: getProportionateScreenHeight(30)),
            buildPasswordField(),
            SizedBox(height: getProportionateScreenHeight(20)),
            Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(8)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Checkbox(
                        value: rememberMe,
                        onChanged: (bool value) {
                          setState(() {
                            rememberMe = !rememberMe;
                          });
                        }),
                    Text("Remember me"),
                    Spacer(),
                    GestureDetector(
                      onTap: () =>
                          ///Navigator.pushNamed(context, '/forgot-password'),
                          Navigator.pushNamed(context, '/register'),
                      child: Text("Forgot Password",
                          style:
                              TextStyle(decoration: TextDecoration.underline)),
                    )
                  ],
                )),
            SizedBox(height: getProportionateScreenHeight(20)),
            errorPlaceHolder(),
            SizedBox(height: getProportionateScreenHeight(20)),
            DefaultButton(
                text: "Login",
                press: () {
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                    // change the delete errors
                    Navigator.pushNamed(context, '/login-success');
                  }
                }),
            SizedBox(height: MediaQuery.of(context).size.height * 0.08),
            socialMediaLogin({
              "assets/icons/facebook-2.svg",
              "assets/icons/google-icon.svg"
            }),
            SizedBox(height: MediaQuery.of(context).size.height * 0.08),
          ],
        ));
  }

  // components
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
