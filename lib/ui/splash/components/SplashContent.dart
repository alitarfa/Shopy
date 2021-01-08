import 'package:ecommerce/utils/constants.dart';
import 'package:ecommerce/utils/size_config.dart';
import 'package:flutter/cupertino.dart';

class SplashContent extends StatelessWidget {
  final String image, text;

  const SplashContent({Key key, this.image, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        Text(
          "Shop it",
          style: TextStyle(
            fontSize: getProportionateScreenWidth(36.0),
            color: kPrimaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        Spacer(),
        Image.asset(
          image,
          height: getProportionateScreenHeight(265),
          width: getProportionateScreenWidth(235),
        ),
        Spacer(
          flex: 2,
        ),
      ],
    );
  }
}
