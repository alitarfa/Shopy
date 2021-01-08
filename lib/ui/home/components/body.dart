import 'package:ecommerce/entities/Product.dart';
import 'package:ecommerce/ui/details/components/body.dart';
import 'package:ecommerce/utils/constants.dart';
import 'package:ecommerce/utils/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Body extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<Map<String, dynamic>> listCategory = [
    {"icon": "", "title": ""},
    {"icon": "", "title": ""},
    {"icon": "", "title": ""},
    {"icon": "", "title": ""},
    {"icon": "", "title": ""},
    {"icon": "", "title": ""},
    {"icon": "", "title": ""},
    {"icon": "", "title": ""},
    {"icon": "", "title": ""},
    {"icon": "", "title": ""},
    {"icon": "", "title": ""},
    {"icon": "", "title": ""},
  ];

  List<String> specialOfferList = ["", "", "", ""];
  List<Product> popularProducts = demoProducts;

  @override
  Widget build(BuildContext context) {
    new SizeConfig().init(context);
    return SafeArea(
        child: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: getProportionateScreenHeight(20)),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                searchBarBuilder(),
                circleButtonBuilder("assets/icons/Cart Icon.svg", () {}, "3"),
                circleButtonBuilder("assets/icons/Bell.svg", () {}, "3"),
              ],
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(20)),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: EdgeInsets.all(getProportionateScreenHeight(8)),
              child: Row(
                children: List.generate(
                    listCategory.length, (index) => Categories("", "", null)),
              ),
            ),
          ),
          specialOffers("Special for you"),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: EdgeInsets.only(
                  left: getProportionateScreenWidth(4),
                  right: getProportionateScreenWidth(4)),
              child: Row(
                children: List.generate(
                    specialOfferList.length, (index) => scrollSpecialOffer()),
              ),
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(20)),
          specialOffers("Popular Products"),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: EdgeInsets.only(
                  left: getProportionateScreenWidth(4),
                  right: getProportionateScreenWidth(4)),
              child: Row(
                children: List.generate(popularProducts.length,
                    (index) => PopularProducts(popularProducts[index])),
              ),
            ),
          ),
        ],
      ),
    ));
  }

  Widget searchBarBuilder() {
    return Container(
        decoration: BoxDecoration(
            color: kSecondaryColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(15)),
        child: TextField(
          decoration: InputDecoration(
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              hintText: "Search Product",
              prefixIcon: Icon(Icons.search),
              contentPadding: EdgeInsets.symmetric(
                  vertical: getProportionateScreenHeight(16),
                  horizontal: getProportionateScreenWidth(20))),
        ),
        width: MediaQuery.of(context).size.width * 0.6);
  }

  Widget circleButtonBuilder(var icon, GestureTapCallback press, var data) {
    return InkWell(
      onTap: press,
      borderRadius: BorderRadius.circular(50),
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(getProportionateScreenHeight(12)),
            width: getProportionateScreenWidth(46),
            height: getProportionateScreenHeight(46),
            decoration: BoxDecoration(
                color: kSecondaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(50)),
            child: SvgPicture.asset(icon),
          ),
          Positioned(
            right: 0,
            top: 0,
            child: Container(
              width: getProportionateScreenWidth(14),
              height: getProportionateScreenHeight(14),
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(50)),
              child: Text(
                data,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: getProportionateScreenWidth(10)),
                textAlign: TextAlign.center,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget specialOffers(var title) {
    return Padding(
      padding: EdgeInsets.all(getProportionateScreenWidth(16)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style: TextStyle(fontSize: getProportionateScreenWidth(18))),
          Text("See more")
        ],
      ),
    );
  }

  Widget scrollSpecialOffer() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(4)),
      child: SizedBox(
        width: getProportionateScreenWidth(230),
        height: getProportionateScreenHeight(98),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(
            children: [
              Image.asset(
                "assets/images/Image Banner 2.png",
                fit: BoxFit.cover,
              ),
              Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                      Color(0XFF343434).withOpacity(0.4),
                      Color(0XFF343434).withOpacity(0.15)
                    ])),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: getProportionateScreenWidth(10),
                    horizontal: getProportionateScreenWidth(15)),
                child: Text.rich(
                    TextSpan(style: TextStyle(color: Colors.white), children: [
                  TextSpan(
                      text: "Smartphone",
                      style:
                          TextStyle(fontSize: getProportionateScreenWidth(18)))
                ])),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget PopularProducts(Product product) {
    return Container(
      margin: EdgeInsets.only(
          left: getProportionateScreenWidth(4),
          right: getProportionateScreenWidth(4)),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: () {
          Navigator.pushNamed(context, "/product-details",
              arguments: ProductDetailsArguments(product: product));
        },
        child: SizedBox(
          width: getProportionateScreenWidth(140),
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 1.02,
                child: Container(
                  padding: EdgeInsets.all(getProportionateScreenHeight(15)),
                  decoration: BoxDecoration(
                      color: Color(0XFFFFECDF).withOpacity(0.4),
                      borderRadius: BorderRadius.circular(15)),
                  child: Image.asset(product.images[0]),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Text("Short", style: TextStyle(color: Colors.black), maxLines: 2),
              Text("10,99",
                  style: TextStyle(
                      fontSize: getProportionateScreenWidth(18),
                      fontWeight: FontWeight.w600,
                      color: kPrimaryColor),
                  maxLines: 2)
            ],
          ),
        ),
      ),
    );
  }
}

class Categories extends StatelessWidget {
  String icon;
  String title;
  GestureTapCallback press;

  Categories(this.icon, this.title, this.press);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Container(
        margin: EdgeInsets.all(getProportionateScreenWidth(4)),
        child: SizedBox(
          width: getProportionateScreenHeight(55),
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: Container(
                  padding: EdgeInsets.all(getProportionateScreenHeight(15)),
                  decoration: BoxDecoration(
                      color: Color(0XFFFFECDF),
                      borderRadius: BorderRadius.circular(15)),
                  child: SvgPicture.asset("assets/icons/Gift Icon.svg"),
                ),
              ),
              SizedBox(height: getProportionateScreenHeight(4)),
              Text(
                "IT Stuff",
                style: TextStyle(fontSize: getProportionateScreenHeight(12)),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
