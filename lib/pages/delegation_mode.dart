import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ignite_mobile_app_fps/additional_code/theme.dart';
import 'package:ignite_mobile_app_fps/firebase_code/delegation_database.dart';
import 'package:ignite_mobile_app_fps/main.dart';
import 'package:auto_size_text/auto_size_text.dart';


class DelegationModePage extends StatefulWidget {
  const DelegationModePage({Key? key}) : super(key: key);

  @override
  _DelegationModePageState createState() => _DelegationModePageState();


}

class _DelegationModePageState extends State<DelegationModePage> {

  @override
  Widget build(BuildContext context) {

    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    double _screenHeightConstant = queryData.size.height / 100;
    double _screenWidthConstant = queryData.size.width / 100;
    var delNum = getGlobalDelNo();


    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.black,


          appBar: AppBar(
            backgroundColor: mainAppbarColor,
            title: const AutoSizeText("Delegation Mode",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 25,
              ),
            ),
            centerTitle: true,
            elevation: 10,
            shadowColor: Colors.black,
            toolbarHeight: _screenHeightConstant*9,
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  logout();
                  Navigator.pop(context, '/delegation_mode');
                },
                child: const AutoSizeText(
                  'Log out',
                  style: TextStyle(
                    color: Colors.white
                  ),
                ),

              )
            ]

          ),




          body: Container(
            decoration:const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      'assets/DelegationModeBackground.png',
                    )
                )
            ),

            child: Column(
                children: [
                  //Welcome Delegation Box
                  Container(
                    width: _screenWidthConstant*100,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    height: _screenHeightConstant*35,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children:  [
                        SizedBox(
                          height: _screenHeightConstant*5,
                        ),
                        Image.asset('assets/delPhoto.png', height: _screenHeightConstant*20,),
                        SizedBox(
                          height: _screenHeightConstant*2,
                        ),
                        AutoSizeText(
                          "Welcome, Delegation $delNum.",
                          style: TextStyle(
                            fontSize: 25,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 5,
                    color: const Color(0xff611111),
                  ),
                  SizedBox(
                    height: _screenHeightConstant*7.8,
                  ),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        HomePageButton(title: "ICs Balance", onClickPageRoute: '/ic_report_page', screenHeightConstant: _screenHeightConstant, screenWidthConstant: _screenWidthConstant),
                        SizedBox(
                          height: _screenHeightConstant*4,
                        ),
                        HomePageButton(title: "Notifications", onClickPageRoute: '/notifications', screenHeightConstant: _screenHeightConstant, screenWidthConstant: _screenWidthConstant),
                        SizedBox(
                          height: _screenHeightConstant*4,
                        ),
                        HomePageButton(title: "Bookings", onClickPageRoute: '/pre_bookings_page', screenHeightConstant: _screenHeightConstant, screenWidthConstant: _screenWidthConstant),
                      ]
                  )
                ]
            ),
          )
      ),
    );
  }
}

// Add Function Parameter
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

