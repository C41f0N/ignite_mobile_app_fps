import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ignite_mobile_app_fps/additional_code/theme.dart';
import 'package:auto_size_text/auto_size_text.dart';



class NotificationsPage extends StatefulWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  _NewsUpdatesPageState createState() => _NewsUpdatesPageState();
}

class _NewsUpdatesPageState extends State<NotificationsPage> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    double _screenHeightConstant = queryData.size.height / 100;
    double _screenWidthConstant = queryData.size.width / 100;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainAppbarColor,
        title: const AutoSizeText("Notifications",
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
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('notifications').orderBy("timestamp", descending: true).snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if(!snapshot.hasData) {
            return Container(
              decoration: const BoxDecoration(
                color: Color(0xFF50001D),
              ),
              child: Center(
                child: CircularProgressIndicator( color: Colors.white,),
              ),
            );
          }

          return Container(
            decoration: const BoxDecoration(
              color: Color(0xFF50001D),
            ),
            child: ListView(
              children: snapshot.data!.docs.map((doc) {
                print(doc["title"]);
                return Padding(
                  padding: EdgeInsets.fromLTRB(_screenWidthConstant*2, _screenHeightConstant*2, _screenWidthConstant*2, 0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(_screenWidthConstant*5, _screenHeightConstant*2.6, _screenWidthConstant*5, _screenHeightConstant*0.13),
                            child: AutoSizeText(
                              doc["title"],
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                                fontWeight: FontWeight.w400
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(20, 5, 20, 20),
                            child: Text(
                              doc["body"],
                              style: TextStyle(color: Colors.black),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          );
        },
      )
    );
  }
}
