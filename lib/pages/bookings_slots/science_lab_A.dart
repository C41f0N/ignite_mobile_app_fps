import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ignite_mobile_app_fps/additional_code/theme.dart';
import 'package:ignite_mobile_app_fps/firebase_code/delegation_database.dart';
import '../../main.dart';


class ScienceLabA extends StatefulWidget {
  const ScienceLabA({Key? key}) : super(key: key);

  @override
  _ScienceLabAState createState() => _ScienceLabAState();
}

class _ScienceLabAState extends State<ScienceLabA> {
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
        title: const Text("Science Lab",
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
        .doc("science_lab")
        .collection("Group_A")
        .where("delID",isEqualTo:"00")
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
                        onTap: (){
                          showDialog(
                              context: context,
                              builder:(_) => AlertDialog(
                                title: Text("Are you sure you want to buy the ${doc['slot_duration']} slot?"),
                                actions: [
                                  TextButton(
                                    onPressed: () async {
                                      Navigator.pop(context, 'Yes');
                                      bool valid  = await buyTVCSlot("Science Lab", "science_lab", doc['slot_duration'], doc['cost']);
                                      if (valid) {
                                        final snackBar = SnackBar(
                                          content: const Text('Slot Booked!'),
                                        );
                                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                      } else {
                                        final snackBar = SnackBar(
                                          content: const Text('Slot Not Booked!, Insufficient ICs or Bookings Closed'),
                                        );
                                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                      }
                                    },
                                    child: const Text('Yes', style: TextStyle(color: Colors.red),),
                                  ),
                                  TextButton(
                                  onPressed: () => Navigator.pop(context, 'No'),
                                    child: const Text('No', style: TextStyle(color: Colors.blue),),
                                  ),
                                ],
                              ),
                          );
                        },
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
