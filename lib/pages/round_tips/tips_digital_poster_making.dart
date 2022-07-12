import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ignite_mobile_app_fps/additional_code/theme.dart';
import 'package:auto_size_text/auto_size_text.dart';


class PosterMaking extends StatefulWidget {
  const PosterMaking({Key? key}) : super(key: key);

  @override
  _PosterMakingState createState() => _PosterMakingState();
}

class _PosterMakingState extends State<PosterMaking> {
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    double _screenHeightConstant = queryData.size.height / 100;
    double _screenWidthConstant = queryData.size.width / 100;

    return Scaffold(
        appBar: AppBar(
          title: AutoSizeText(
              'Poster Making', style: TextStyle(fontSize: 25)),
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
                          'assets/RoundTips/Digital_Poster_Making.JPG'
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
                        '''●	Identify and determine the objective for your design. 
●	Understand the requirements of your target audience. 
●	Highlight your ideas in a distinct manner. 
●	Use attractive fonts to create a visual appeal. 
●	Make use of high quality images to enhance your aesthetic. 
●	Use engaging icons and visuals that uplift your poster. 
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