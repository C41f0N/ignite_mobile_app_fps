import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ignite_mobile_app_fps/additional_code/theme.dart';
import 'package:ignite_mobile_app_fps/firebase_code/delegation_database.dart';
import '../../main.dart';


class NewsRoomAndComputerLabBookedA extends StatefulWidget {
  const NewsRoomAndComputerLabBookedA({Key? key}) : super(key: key);

  @override
  _NewsRoomAndComputerLabBookedAState createState() => _NewsRoomAndComputerLabBookedAState();
}

class _NewsRoomAndComputerLabBookedAState extends State<NewsRoomAndComputerLabBookedA> {
  var _delGroup;

  void SetDelGroup() async {
  _delGroup = await GetDelGroup(getGlobalDelNo());
  }
  @override
  Widget build(BuildContext context) {
    SetDelGroup();
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    double _screenHeightConstant = queryData.size.height / 100;
    double _screenWidthConstant = queryData.size.width / 100;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainAppbarColor,
        title: const Text("News Room - Computer Lab",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 25,
          ),
        ),
        centerTitle: true,
        elevation: 10,
        shadowColor: Colors.black,
        toolbarHeight: _screenHeightConstant*9,
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("tvc_sets")
        .doc("news_room_and_computer_lab")
        .collection("Group_A")
        .where("delID",isEqualTo:getGlobalDelNo())
        .orderBy("sequence_index")
        .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if(!snapshot.hasData){
            return Center(
              child: CircularProgressIndicator(
                color: Colors.red,
              ),
            );
          }
          return ListView(
              children: snapshot.data!.docs.map((doc) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        title: Text(doc["slot_duration"]),
                        subtitle: Text("Cost: ${doc["cost"]}ICs"),
                      ),
                    ),
                  ],
                );
              }).toList()
            );
        },
      ),
    );
  }
}
