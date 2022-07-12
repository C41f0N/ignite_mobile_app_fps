import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ignite_mobile_app_fps/additional_code/theme.dart';
import 'package:auto_size_text/auto_size_text.dart';



class WhatIsIgnite extends StatefulWidget {
  const WhatIsIgnite({Key? key}) : super(key: key);

  @override
  _NewsUpdatesPageState createState() => _NewsUpdatesPageState();
}

class _NewsUpdatesPageState extends State<WhatIsIgnite> {
  @override
  Widget build(BuildContext context) {

    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    double _screenHeightConstant = queryData.size.height / 100;
    double _screenWidthConstant = queryData.size.width / 100;

    return Scaffold(
      appBar: AppBar(
        title: AutoSizeText('What Is Ignite?', style: TextStyle(fontSize: 25)),
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
                        'assets/What_is_Ignite/Image.jpg',
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
                    '''Entering its eighth year of existence, Ignite is a three-day entrepreneurial summit that gives the delegates an opportunity to understand the complexities of the corporate world. Witnessing real-life situations allows the delegates to realize the enormity of a responsibility, which requires them to save their product and reputation from various unforeseen events that jeopardise the success of their products.''',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                    textAlign: TextAlign.center,
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
