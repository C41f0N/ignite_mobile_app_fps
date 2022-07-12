import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ignite_mobile_app_fps/additional_code/theme.dart';
import 'package:auto_size_text/auto_size_text.dart';


class PitchToInvestors extends StatefulWidget {
  const PitchToInvestors({Key? key}) : super(key: key);

  @override
  _PitchToInvestorsState createState() => _PitchToInvestorsState();
}

class _PitchToInvestorsState extends State<PitchToInvestors> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    double _screenHeightConstant = queryData.size.height / 100;
    double _screenWidthConstant = queryData.size.width / 100;

    return Scaffold(
        appBar: AppBar(
          title: AutoSizeText(
              'Pitch To Investors', style: TextStyle(fontSize: 25)),
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
                          'assets/RoundTips/Pitch_To_Investors.JPG',
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
                        '''●	Figure out and elaborate on all the selling points for your product. 
●	Talk about the market which you would like to distribute your product or service to.
●	Be confident and firm in your tone. 
●	Practice your pitch thoroughly.
●	Be straightforward and convincing. You will only be given a limited amount of time to present your pitch. 
●	All members should be involved, in order to demonstrate team effort. 
●	Prepare to answer any questions that the investors may throw your way. 
●	Talk through a story, introduce a problem and suggest your product as an effective solution.
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
