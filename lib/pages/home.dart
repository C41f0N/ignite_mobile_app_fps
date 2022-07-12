import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:ignite_mobile_app_fps/additional_code/theme.dart';
import 'package:flutter/services.dart';
import 'package:ignite_mobile_app_fps/firebase_code/delegation_database.dart';
import 'package:ignite_mobile_app_fps/main.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:overlay_support/overlay_support.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

// Add Function Parameter

class _MyHomePageState extends State<MyHomePage> {



  late final FirebaseMessaging _messaging;

  void HandleOnScreenNotification() async {
    _messaging = FirebaseMessaging.instance;

    NotificationSettings settings = await _messaging.requestPermission(
      alert: true,
      badge: true,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print("User granted the permission");

      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      showSimpleNotification(
        Text(message.notification!.title!),
        subtitle: Text(message.notification!.body!),
        background: const Color(0xFFFF0000),
        foreground: Colors.white,
        contentPadding: EdgeInsets.all(20),
        duration: Duration(seconds: 5),);

      });
    } else {
      print("Authorization Denied");
    }
  }

  @override
  void initState() {
    HandleOnScreenNotification();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    double _screenHeightConstant = queryData.size.height / 100;
    double _screenWidthConstant = queryData.size.width / 100;
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
          backgroundColor: const Color(0xFF840030),

          //Set Drawer Values
          // drawer: Drawer(
          //     child: Container(
          //       decoration: const BoxDecoration(
          //         color: const Color(0xFF57001E),
          //       ),
          //       child: ListView(
          //           children: [
          //             Container(
          //               height: _screenHeightConstant*0.65,
          //               color: const Color(0xFF840030),
          //             ),
          //              Column(
          //                children: [
          //                  Container(
          //                    child: Image(
          //                      image: AssetImage('assets/Ignitelogo.jpg'),
          //                      height: 10,
          //                      width: double.infinity,
          //                      fit: BoxFit.fitWidth,
          //                    ),
          //                  ),
          //                  Container(
          //                    height: 5,
          //                    color: const Color(0xFF840030),
          //                  ),
          //                ],
          //              ),
          //             const SizedBox(
          //               height: 10,
          //             ),
          //             const DrawerTile(name: "Tile 1"),
          //             const DrawerTile(name: "Tile 2"),
          //             const DrawerTile(name: "Tile 3"),
          //             const DrawerTile(name: "Tile 4"),
          //
          //
          //           ]
          //       ),
          //     )
          // ),


          appBar: AppBar(
            backgroundColor: mainAppbarColor,
            title: const AutoSizeText("IGNITE 8.0",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 25,
              ),
            ),
            centerTitle: true,
            elevation: 5,
            shadowColor: Colors.black,
            toolbarHeight: _screenHeightConstant*9,

          ),




          body: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      //'assets/HomeScreenBackground.png',
                      'assets/DelegationModeBackground.png',
                    )
                ),
            ),
            height: MediaQuery.of(context).size.height,

            child: Column(
                children: [
                  SizedBox(
                    height: _screenHeightConstant*3,
                  ),
                  Container(
                    height: 5,
                    color: const Color(0xFF870000),
                  ),
                  ImageSlideshow(
                    children: [
                      Image.asset(
                        'assets/DSC_0053.JPG',
                        fit: BoxFit.cover,
                      ),
                      Image.asset(
                        'assets/DSC_0073.JPG',
                        fit: BoxFit.cover,
                      ),
                      Image.asset(
                        'assets/DSC_0101.JPG',
                        fit: BoxFit.cover,
                      ),
                      Image.asset(
                        'assets/DSC_0104.JPG',
                        fit: BoxFit.cover,
                      ),
                    ],
                    width: double.infinity,
                    height: _screenHeightConstant*35,
                    indicatorBackgroundColor: Colors.grey[200],
                    indicatorColor: Colors.red[300],
                    isLoop: true,
                    autoPlayInterval: 18000,
                  ),
                  Container(
                    height: 5,
                    color: const Color(0xFF870000),
                  ),
                  SizedBox(
                    height: _screenHeightConstant*5,
                  ),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        DelegationModeButton(screenHeightConstant: _screenHeightConstant, screenWidthConstant: _screenWidthConstant),
                        SizedBox(
                          height: _screenHeightConstant*3.75,
                        ),
                        HomePageButton(title: "Round Tips", onClickPageRoute: '/round_tips', screenHeightConstant: _screenHeightConstant, screenWidthConstant: _screenWidthConstant),
                        SizedBox(
                          height: _screenHeightConstant*3.75,
                        ),
                        HomePageButton(title: "What is Ignite?", onClickPageRoute: '/what_is_ignite', screenHeightConstant: _screenHeightConstant, screenWidthConstant: _screenWidthConstant),
                      ]
                  )
                ]
            ),
          )
      ),
    );
  }
}
class HomePageButton extends StatelessWidget {

  final String title;
  final String onClickPageRoute;
  final double screenHeightConstant;
  final double screenWidthConstant;

  const HomePageButton({Key? key, required this.screenHeightConstant, required this.screenWidthConstant, required this.title, required this.onClickPageRoute}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenHeightConstant*10.5,
      width: screenWidthConstant*87.5,
      child: ElevatedButton(
        onPressed: (){
          Navigator.pushNamed(context, onClickPageRoute);
        },
        child: AutoSizeText(
          title,
          style: const TextStyle(
              fontWeight: FontWeight.normal,
              color: Colors.black,
              fontSize: 25
          ),
          textAlign: TextAlign.center,
        ),
        style: ElevatedButton.styleFrom(
            primary: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            elevation: 10
        ),
      ),
    );
  }
}

class DelegationModeButton extends StatelessWidget {
  final double screenHeightConstant;
  final double screenWidthConstant;

  const DelegationModeButton({Key? key, required this.screenHeightConstant, required this.screenWidthConstant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenHeightConstant*10.5,
      width: screenWidthConstant*87.5,
      child: ElevatedButton(
        onPressed: () {
          MediaQueryData queryData;
          queryData = MediaQuery.of(context);
          var storedDelNo = getGlobalDelNo();
          if (storedDelNo == ''){
            Navigator.pushNamed(context, "/delegation_login");
          } else {
            Navigator.pushNamed(context, "/delegation_mode");
          }
        },
        child: AutoSizeText(
          "Delegation Mode",
          style: const TextStyle(
              fontWeight: FontWeight.normal,
              color: Colors.black,
              fontSize: 25
          ),
          textAlign: TextAlign.center,
        ),
        style: ElevatedButton.styleFrom(
            primary: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            elevation: 10
        ),
      ),
    );
  }
}

class DrawerTile extends StatelessWidget {
  final String name;

  const DrawerTile({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: AutoSizeText(name),
      onTap: () {
        print("$name Pressed");
      },
      contentPadding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
    );
  }
}


