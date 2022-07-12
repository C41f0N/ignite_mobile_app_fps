import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ignite_mobile_app_fps/additional_code/theme.dart';
import 'package:auto_size_text/auto_size_text.dart';


class StockExchangeRound extends StatefulWidget {
  const StockExchangeRound({Key? key}) : super(key: key);

  @override
  _StockExchangeRoundState createState() => _StockExchangeRoundState();
}

class _StockExchangeRoundState extends State<StockExchangeRound> {
  @override
  Widget build(BuildContext context) {

    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    double _screenHeightConstant = queryData.size.height / 100;
    double _screenWidthConstant = queryData.size.width / 100;

    return Scaffold(
        appBar: AppBar(
          title: AutoSizeText('Stock Exchange', style: TextStyle(fontSize: 25)),
          centerTitle: true,
          backgroundColor: mainAppbarColor,
          elevation: 10,
          shadowColor: Colors.black,
          toolbarHeight: _screenHeightConstant*9,
        ),
        body: Container(
            decoration:const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      'assets/What_is_Ignite/Background.png',
                    )
                )
            ),
            child:Column(
              children: [
                Container(
                  height: _screenHeightConstant*5,
                ),
                Container(
                  height: _screenHeightConstant*0.6,
                  color: Colors.black,
                ),
                Container(
                  decoration:const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fitWidth,
                        image: AssetImage(
                          'assets/RoundTips/Stock_Exchange_Round.JPG',
                        )
                    ),
                  ),
                  height: _screenHeightConstant*35,
                ),
                Container(
                  height: _screenHeightConstant*0.6,
                  color: Colors.black,
                ),
                Container(
                  height: _screenHeightConstant*5,
                ),
                Card(
                  color: Colors.white,
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: Container(
                    height: _screenHeightConstant*35,
                    width: _screenWidthConstant*90,
                    child: Padding(
                      padding: EdgeInsets.all(_screenWidthConstant*8),
                      child: AutoSizeText(
                        '''●	Make quick, but effective decisions. 
●	Stay focused and alert at all times. 
●	Make mutually agreed decisions in cooperation with your team members. 
●	Stress can endanger your decision-making skills, avoid taking it unnecessarily. 
●	Make clear and sound decisions, based on the situations that you encounter. 
●	Be mindful and thoughtful of your time to invest and cash out. 
●	Make sure to have an idea of the profits for your investments. 
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
