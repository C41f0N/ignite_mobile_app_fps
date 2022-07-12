import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ignite_mobile_app_fps/additional_code/theme.dart';
import 'package:auto_size_text/auto_size_text.dart';


class RoundTipsPage extends StatefulWidget {
  const RoundTipsPage({Key? key}) : super(key: key);

  @override
  _NewsUpdatesPageState createState() => _NewsUpdatesPageState();
}

class _NewsUpdatesPageState extends State<RoundTipsPage> {
  @override
  Widget build(BuildContext context) {

    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    double _screenHeightConstant = queryData.size.height / 100;
    double _screenWidthConstant = queryData.size.width / 100;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainAppbarColor,
        title: const AutoSizeText("Round Tips",
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
            'assets/DelegationModeBackground.png',
          )
      ),
    ),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            SizedBox(height: _screenHeightConstant*1.5,),
            RoundTipsButton(screenHeightConstant: _screenHeightConstant, screenWidthConstant: _screenWidthConstant, title: "Flyer Designing", onClickPageRoute: "/round_tips/flyer_designing"),
            RoundTipsButton(screenHeightConstant: _screenHeightConstant, screenWidthConstant: _screenWidthConstant, title: "Digital Poster Making", onClickPageRoute: "/round_tips/digital_poster_making"),
            RoundTipsButton(screenHeightConstant: _screenHeightConstant, screenWidthConstant: _screenWidthConstant, title: "TVC Filming", onClickPageRoute: "/round_tips/tvc_filming"),
            RoundTipsButton(screenHeightConstant: _screenHeightConstant, screenWidthConstant: _screenWidthConstant, title: "Stock Exchange Round", onClickPageRoute: "/round_tips/stock_exchange_round"),
            RoundTipsButton(screenHeightConstant: _screenHeightConstant, screenWidthConstant: _screenWidthConstant, title: "Public-Relation Crisis", onClickPageRoute: "/round_tips/pr_crisis"),
            RoundTipsButton(screenHeightConstant: _screenHeightConstant, screenWidthConstant: _screenWidthConstant, title: "Pitch to Investors", onClickPageRoute: "/round_tips/pitch_to_investors"),
          ],
        ),
      )
    );
  }
}

class RoundTipsButton extends StatelessWidget {

  final String title;
  final String onClickPageRoute;
  final double screenHeightConstant;
  final double screenWidthConstant;

  const RoundTipsButton({Key? key, required this.screenHeightConstant, required this.screenWidthConstant, required this.title, required this.onClickPageRoute}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(screenWidthConstant*4, screenHeightConstant*2, screenWidthConstant*4, screenHeightConstant*2),
      child: SizedBox(
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
                borderRadius: BorderRadius.circular(30),
              ),
              elevation: 0
          ),
        ),
      ),
    );
  }
}
