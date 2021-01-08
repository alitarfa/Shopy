import 'package:ecommerce/ui/splash/components/SplashContent.dart';
import 'package:ecommerce/utils/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BodyWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    String image = "assets/images/splash.png";
    String text = "Welcom to E commerce application";

    List<Map<String, String>> splashData = [
      {
        "text": "Welcome to Tokoto, Let’s shop!",
        "image": "assets/images/splash.png"
      },
      {
        "text":
            "We help people conect with store \naround United State of America",
        "image": "assets/images/splash_2.png"
      },
      {
        "text": "We show the easy way to shop. \nJust stay at home with us",
        "image": "assets/images/splash_3.png"
      },
    ];

    return new _BodyState(splashData);
  }
}

class _BodyState extends State<BodyWidget> {
  final List<Map<String, String>> splashData;
  int currentPage = 0;
  PageController _controller = new PageController();

  _BodyState(this.splashData);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
        child: SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Expanded(
              flex: 3,
              child: PageView.builder(
                controller: _controller,
                itemCount: splashData.length,
                itemBuilder: (context, index) => SplashContent(
                  image: splashData[index]['image'],
                  text: splashData[index]['text'],
                ),
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
              )),
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20)),
              child: Column(
                children: <Widget>[
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                          splashData.length, (index) => buildDots(index))),
                  Spacer(
                    flex: 3,
                  ),
                  RaisedButton(
                    color: Colors.amber,
                    padding: const EdgeInsets.all(8.0),
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                      /*if (currentPage + 1 < splashData.length) {
                        _controller.jumpToPage(currentPage + 1);
                      } else {

                      }*/
                    },
                    child: Text('Next', style: TextStyle(fontSize: 20)),
                  ),
                  Spacer(),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }

  Container buildDots(int index) {
    return Container(
      width: 10,
      height: 10,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
          color: index == currentPage ? Colors.amber : Colors.grey,
          borderRadius: BorderRadius.circular(50)),
    );
  }
}
