import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ignite_mobile_app_fps/additional_code/theme.dart';
import 'package:auto_size_text/auto_size_text.dart';


class PRCrisis extends StatefulWidget {
  const PRCrisis({Key? key}) : super(key: key);

  @override
  _PRCrisisState createState() => _PRCrisisState();
}

class _PRCrisisState extends State<PRCrisis> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    double _screenHeightConstant = queryData.size.height / 100;
    double _screenWidthConstant = queryData.size.width / 100;

    return Scaffold(
        appBar: AppBar(
          title: AutoSizeText(
              'Public-Relation Crisis', style: TextStyle(fontSize: 25)),
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
                      'assets/What_is_Ignite/Image.jpg',
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
                          'assets/RoundTips/Public_Relation_Crisis.JPG',
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
                        '''●	Be accepting of the change that occurs in your circumstances and monitor the situation closely. 
●	Move forward with a calm and level head, plan a strategy. 
●	Have knowledge of where your team is most vulnerable. 
●	Learn to be adaptive and adjusting. 
●	Prepare yourself to face any situation. 
●	Create a habit of trust and good communication among your team members. 
●	Properly understand the crisis that you encounter before moving forward.
●	Always be prepared for any negative backlash and criticism.
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
