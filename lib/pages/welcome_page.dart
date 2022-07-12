import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:slide_to_act/slide_to_act.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    double _screenHeightConstant = queryData.size.height / 100;
    double _screenWidthConstant = queryData.size.width / 100;

    return Scaffold(
      backgroundColor: Colors.black87,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: _screenHeightConstant * 4,
          ),
          Container(
            alignment: Alignment.center,
              child: Image(
                image: AssetImage(
                  'assets/IgniteLogoWhite.png'
                ),
                fit: BoxFit.cover,
                height: _screenHeightConstant*40,
              ),
          ),
          SizedBox(
            height: _screenHeightConstant * 25
          ),
          Padding(
            padding: EdgeInsets.all(_screenWidthConstant*10),
            child: SlideAction(
              innerColor: Colors.black,
              outerColor: Color(0xFFF1F1F1),
              borderRadius: 30,
              text: "       Swipe to Access",
              sliderButtonIcon: Icon(Icons.lock, color: Colors.white,),
              submittedIcon: Icon(Icons.check, color: Colors.black,),
              onSubmit: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, "/home");
              },
            ),
          ),
          SizedBox(
              height: _screenHeightConstant * 6
          ),
          Container(
            child: Text(
              "Ignite Mobile App © Sarim Ahmed",
              style: TextStyle(
                color: Colors.white38,
                fontSize: 13,
              )
            ),
            alignment: Alignment.center,
          )
        ],
      ),
    );
  }
}
