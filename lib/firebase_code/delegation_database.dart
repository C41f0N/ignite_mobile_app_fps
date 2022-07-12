import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:path_provider/path_provider.dart';
import 'package:ignite_mobile_app_fps/main.dart';



// Functions to manage and remember logins:

Future<bool> verifyInfo(delNo, delPass) async {
  bool _valid = true;
  String? pass;
  String? headpass;
  var delInt = int.parse(delNo);
  if (delInt == 1) {delNo = "01";}
  if (delInt == 2) {delNo = "02";}
  if (delInt == 3) {delNo = "03";}
  if (delInt == 4) {delNo = "04";}
  if (delInt == 5) {delNo = "05";}
  if (delInt == 6) {delNo = "06";}
  if (delInt == 7) {delNo = "07";}
  if (delInt == 8) {delNo = "08";}
  if (delInt == 9) {delNo = "09";}
  if (delInt == 10) {delNo = "10";}

  await FirebaseFirestore.instance
      .collection('delegations_list')
      .where('Delegation_Number', isEqualTo: delNo)
      .get()
      .then((value) {
    value.docs.forEach((docs) {
      if (docs.exists) {
        pass = docs["Password"];
        headpass = docs["Head_Del_Password"];
      } else {
        _valid = false;
      }
      });
      });
  if (pass != delPass && headpass != delPass && _valid == true){
    _valid = false;
  } else if (delPass == headpass) {

    await setHeadDelStatusToFile(true);
    print("Done writing to file");
    print("Onto writing to variable...");
    setHeadDelStatus(true);
    _valid = true;
    print("Validated As Head Del");
  }
  return _valid;
}

Future<String> get _localPath async {
  final directory = await getApplicationDocumentsDirectory();

  return directory.path;
}

Future<File> get localDelNumFile async {
  final path = await _localPath;
  return File('$path/id_holder.txt');
}

Future<File> get localHeadDelStatusFile async {
  final path = await _localPath;
  return File('$path/head_Del_Status.txt');
}


void setGlobalDelNoToFile(String delNo) async {
  if (delNo != "") {
    var intDelNo = int.parse(delNo);
    if (intDelNo == 1) {
      delNo = "01";
    }
    if (intDelNo == 2) {
      delNo = "02";
    }
    if (intDelNo == 3) {
      delNo = "03";
    }
    if (intDelNo == 4) {
      delNo = "04";
    }
    if (intDelNo == 5) {
      delNo = "05";
    }
    if (intDelNo == 6) {
      delNo = "06";
    }
    if (intDelNo == 7) {
      delNo = "07";
    }
    if (intDelNo == 8) {
      delNo = "08";
    }
    if (intDelNo == 9) {
      delNo = "09";
    }
  }

  final file = await localDelNumFile;

  // Write the file
  print("writing $delNo to file");
  try {
    file.writeAsString(delNo);
  } catch(e) {
    new File('$_localPath/id_holder.txt').create(recursive: true);
    file.writeAsString(delNo);
  }

}
Future<String?> getGlobalDelNoFromFile() async {
  //return delNumGlobal;
  /*File f = new File("/id_holder.txt");
  var x = f.readAsStringSync();

  print("file read $x.");
  return f.readAsStringSync();*/

  final file = await localDelNumFile;
  var contents = "";



  // Read the file
  try {
    contents = await file.readAsString();
    print("$contents read from file.");

  } catch (e) {
    new File('$_localPath/id_holder.txt').create(recursive: true);
    print("No file found");

    var contents =  "";
  }
  return contents;
}

Future<bool?> getHeadDelStatusFromFile()async {
  final file = await localHeadDelStatusFile;
  var contents = "";



  // Read the file
  try {
    contents = await file.readAsString();
    print("$contents read from file.");

  } catch (e) {
    new File('$_localPath/head_del_status.txt').create(recursive: true);
    print("No file found");

    var contents =  "";
  }
  if (contents == "") {
    return false;
  } else if (contents == "1") {
    return true;
  }
  ;
}
Future<void> setHeadDelStatusToFile(bool IsHeadDel) async {

  final file = await localHeadDelStatusFile;

  // Write the file
  print("writing $IsHeadDel to file");
  try {
    if (IsHeadDel == true) {
      print("writing 1 to file");
      await file.writeAsString("1");
      print("Done writing to file.");
    } else if (IsHeadDel == false) {
      print("emptying the file");
      await file.writeAsString("");
    }
  } catch(e) {
    print(e);
    print("Creating A File");
    new File('$_localPath/head_del_status.txt').create(recursive: true);
    file.writeAsString("");
  }
  print("Procedure setHeadDelToFile Ended");

}

void logout() async {
  final file = await localDelNumFile;

  // Write the file
  setGlobalDelNoToFile("");
  unsubscribeToDelNotifications();
  print("Emptied the file");
  setGlobalDelNo("");
  print("Emptied the variable.");
  setHeadDelStatusToFile(false);
  setHeadDelStatus(false);
}


void subscribeToDelNotifications() async {
  await FirebaseMessaging.instance.subscribeToTopic('delegations');
}

void unsubscribeToDelNotifications() async {
  await FirebaseMessaging.instance.unsubscribeFromTopic('delegations');
}

Future<int> getDelICs(delNo) async {
  var ICs = 0;
  await FirebaseFirestore.instance
      .collection('delegations_ics_balance')
      .where('Delegation_Number', isEqualTo: delNo)
      .get()
      .then((value) {
    value.docs.forEach((docs) {
      if (docs.exists) {
        ICs = docs["Account_Balance"];
      }
    });
  });
  return ICs;
}

Future<bool> buyTVCSlot(setName, setReferenceInFirestore, slotTimings, cost) async {
  var delegationGroup = await GetDelGroup(getGlobalDelNo());
  //making transaction
  bool valid = await AddTransaction(getGlobalDelNo(), "Bought $setName slot.", -cost);
  bool bookingsOpen = await CheckPermission('bookings_group_${delegationGroup}_open');
  if (bookingsOpen) {
  if (valid) {
    //updating the slot ownership and details
    await FirebaseFirestore.instance
        .collection('tvc_sets')
        .doc(setReferenceInFirestore)
        .collection('Group_$delegationGroup')
        .doc(slotTimings)
        .update({
      'delID': getGlobalDelNo(),
      'timestamp': DateTime.now(),
    });
    return true;
  } else {
    return false;
  } } else {
    return false;
  }
}


Future<bool> AddTransaction(delNum, description, amount) async {

  //Updating Delegation's ICs
  var ICdocs = await FirebaseFirestore.instance
      .collection('delegations_ics_balance')
      .where('Delegation_Number', isEqualTo: getGlobalDelNo())
      .limit(1)
      .get();
  var id = ICdocs.docs.first.id;
  var ICs = ICdocs.docs.first["Account_Balance"];

  //Subtracting Cost...
  ICs = ICs + amount;
  if(ICs < 0 ) {

    return false;
  } else {
    FirebaseFirestore.instance.collection('delegations_ics_balance')
        .doc('$id')
        .update({
      'Account_Balance': ICs
    });
    //Registering a Transaction
    FirebaseFirestore.instance.collection('ic_transactions')
        .doc()
        .set({
      'Amount': amount,
      'Delegation_ID': getGlobalDelNo(),
      'Description': description,
      'transaction_time': DateTime.now(),
    });
    return true;
  }

  

}

Future<String> GetDelGroup(delNum) async {
  var fetchedDoc = await FirebaseFirestore.instance
      .collection('delegation_group_division')
      .doc(delNum!)
      .get();
  print(fetchedDoc['Group']);
  return (fetchedDoc['Group']!);
}

Future<bool> CheckPermission(permission) async {
  var fetchedDoc = await FirebaseFirestore.instance
  .collection('permissions')
      .doc(permission)
      .get();
  return fetchedDoc['IsAllowed'];
}