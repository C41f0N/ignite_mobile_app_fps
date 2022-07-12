import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ignite_mobile_app_fps/additional_code/theme.dart';
import 'package:auto_size_text/auto_size_text.dart';



class FlyerDesigning extends StatefulWidget {
  const FlyerDesigning({Key? key}) : super(key: key);

  @override
  _FlyerDesigningState createState() => _FlyerDesigningState();
}

class _FlyerDesigningState extends State<FlyerDesigning> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    double _screenHeightConstant = queryData.size.height / 100;
    double _screenWidthConstant = queryData.size.width / 100;

    return Scaffold(
        appBar: AppBar(
          title: AutoSizeText(
              'Flyer Designing', style: TextStyle(fontSize: 25)),
          centerTitle: true,
          backgroundColor: mainAppbarColor,
          elevation: 10,
          shadowColor: Colors.black,
          toolbarHeight: _screenHeightConstant * 9,
        ),
        body: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      'assets/What_is_Ignite/Background.png',
                    )
                )
            ),
            child: Column(
              children: [
                Container(
                  height: _screenHeightConstant * 5,
                ),
                Container(
                  height: _screenHeightConstant * 0.6,
                  color: Colors.black,
                ),
                Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fitWidth,
                        image: AssetImage(
                          'assets/RoundTips/Flyer_Designing.JPG',
                        )
                    ),
                  ),
                  height: _screenHeightConstant * 35,
                ),
                Container(
                  height: _screenHeightConstant * 0.6,
                  color: Colors.black,
                ),
                Container(
                  height: _screenHeightConstant * 5,
                ),
                Card(
                  color: Colors.white,
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: Container(
                    height: _screenHeightConstant * 35,
                    width: _screenWidthConstant * 90,
                    child: Padding(
                      padding: EdgeInsets.all(_screenWidthConstant * 8),
                      child: AutoSizeText(
                        '''●	Make use of bold and intriguing headlines to instantly grab the viewers’ attention. 
●	Be precise and direct while crafting your message. 
●	Do not miss out on your brand identity elements (logo, tagline, website URL, etc.) 
●	Leave negative space to avoid overcrowding on your flyer. 
●	Flyers are read from the top-down, starting with the most important information up top.
●	Proofread for accuracy of information and elements. 
''',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                )
              ],
            )
        )
    );
  }
}