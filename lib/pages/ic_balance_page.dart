import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ignite_mobile_app_fps/additional_code/theme.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:ignite_mobile_app_fps/firebase_code/delegation_database.dart';
import 'package:ignite_mobile_app_fps/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';




class ICsReportPage extends StatefulWidget {
  const ICsReportPage({Key? key}) : super(key: key);

  @override
  _ICsReportPageState createState() => _ICsReportPageState();
}

class _ICsReportPageState extends State<ICsReportPage> {
  


  @override
  Widget build(BuildContext context) {

    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    double _screenHeightConstant = queryData.size.height / 100;
    double _screenWidthConstant = queryData.size.width / 100;


    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: mainAppbarColor,
          title: const AutoSizeText("ICs Balance",
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
        body: Container(
          color: Color(0xFF310017),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(
                    _screenWidthConstant * 5, 0, _screenWidthConstant * 5, 0),
                height: _screenHeightConstant * 35,
                width: _screenWidthConstant * 85,
                color: Colors.white,
                child: Center(
                  child: Column(children: [
                    SizedBox(
                      height: _screenHeightConstant * 6,
                    ),
                    const AutoSizeText(
                      "Current ICs:",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(
                      height: _screenHeightConstant * 1.5,
                    ),
                    StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance.collection(
                            "delegations_ics_balance")
                            .where('Delegation_Number', isEqualTo: getGlobalDelNo())
                            .limit(1)
                            .snapshots(),
                        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (!snapshot.hasData) {return AutoSizeText(
                            "Loading..",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 50
                            ),
                          );}
                          return AutoSizeText(
                            "${snapshot.data!.docs.first["Account_Balance"]}",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 130
                            ),
                          );
                        }
                    ),
                  ]),
                ),
              ),
              Container(
                height: 5,
                color: const Color(0xFFB10042),
              ),
              StreamBuilder(
                  stream: FirebaseFirestore.instance.collection("ic_transactions")
                      .where("Delegation_ID",isEqualTo:getGlobalDelNo())
                      .orderBy("transaction_time", descending: true)
                      .limit(5)
                      .snapshots(),
                builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if(!snapshot.hasData) {
                    return Padding(
                      padding: EdgeInsets.fromLTRB(8, _screenHeightConstant*20, 8, 0),
                      child: Center(
                        child: CircularProgressIndicator(color: Colors.white,)
                      ),
                    );
                  }
                  return Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: snapshot.data!.docs.map((doc) {
                        return TransactionBlock(
                            screenHeightConstant: _screenHeightConstant,
                            screenWidthConstant: _screenWidthConstant,
                            transactionAmount: doc["Amount"],
                            transactionDescription: doc["Description"],
                        );
                      }).toList(),
                    ),
                  );
              },
              )
            ],
          ),
        )
      ),
    );
  }
}

class TransactionBlock extends StatelessWidget {

  final double screenHeightConstant;
  final double screenWidthConstant;
  final transactionAmount;
  final transactionDescription;

  const TransactionBlock({Key? key, required this.screenHeightConstant, required this.screenWidthConstant, required this.transactionAmount, required this.transactionDescription}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(screenWidthConstant*2, screenHeightConstant*2, screenWidthConstant*2, 0),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
            ),
            child: Center(
                child: Padding(
                  padding: EdgeInsets.all(screenHeightConstant*2.7),
                  child: AutoSizeText(
                      "$transactionDescription: $transactionAmount ICs",
                    style: TextStyle(
                      fontWeight: FontWeight.w500
                    ),
                  ),
                )
            ),
            color: Colors.grey[100],
          ),
        ),
      ],
    );
  }
}
