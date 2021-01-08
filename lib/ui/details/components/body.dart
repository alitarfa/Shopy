import 'package:ecommerce/entities/Product.dart';
import 'package:ecommerce/utils/constants.dart';
import 'package:ecommerce/utils/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  final Product product;

  Body(this.product);

  @override
  State<StatefulWidget> createState() => _BodyState(product);
}

class _BodyState extends State<Body> {
  final Product product;
  int selectedImage = 0;

  _BodyState(this.product);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: getProportionateScreenWidth(238),
          child: AspectRatio(
            aspectRatio: 1,
            child: Image.asset(product.images[selectedImage]),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(product.images.length,
              (index) => listProductsImage(product.images[index], index)),
        )
      ],
    );
  }

  Widget listProductsImage(var image, var index) {
    return GestureDetector(
      onTap: () => {
        setState(() {
          selectedImage = index;
        })
      },
      child: Container(
        margin: EdgeInsets.all(4),
        padding: EdgeInsets.all(getProportionateScreenWidth(8)),
        width: getProportionateScreenWidth(48),
        height: getProportionateScreenWidth(48),
        decoration: BoxDecoration(
            border: Border.all(
                color: selectedImage == index
                    ? kPrimaryColor
                    : Colors.transparent),
            borderRadius: BorderRadius.circular(10),
            color: Colors.white),
        child: Image.asset(image),
      ),
    );
  }
}

class ProductDetailsArguments {
  final Product product;

  ProductDetailsArguments({@required this.product});
}
