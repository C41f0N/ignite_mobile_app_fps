import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ignite_mobile_app_fps/additional_code/theme.dart';
import 'package:auto_size_text/auto_size_text.dart';


class TVCFilming extends StatefulWidget {
  const TVCFilming({Key? key}) : super(key: key);

  @override
  _TVCFilmingState createState() => _TVCFilmingState();
}

class _TVCFilmingState extends State<TVCFilming> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    double _screenHeightConstant = queryData.size.height / 100;
    double _screenWidthConstant = queryData.size.width / 100;

    return Scaffold(
        appBar: AppBar(
          title: AutoSizeText(
              'TVC Filming', style: TextStyle(fontSize: 25)),
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
                          'assets/RoundTips/TVC_Filming.JPG',
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
                        '''●	Be innovative and creative. Make use of video-editing applications and other animations. 
●	Use characters of interest and intrigue. 
●	Capture the pinpoint of your brand. 
●	Use testimonies from customers to give real set ideas. 
●	Be realistic in demonstrating your product. 
●	Develop a signature theme. 
●	Keep yourself updated with the trends
●	Give the audience a reason to watch and take interest in your advert. 
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
