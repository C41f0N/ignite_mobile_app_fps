import 'package:flutter/material.dart';
import 'package:ignite_mobile_app_fps/additional_code/theme.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:ignite_mobile_app_fps/firebase_code/delegation_database.dart';
import 'package:ignite_mobile_app_fps/main.dart';



class PreBookingsPage extends StatefulWidget {
  const PreBookingsPage({Key? key}) : super(key: key);

  @override
  _PreBookingsPageState createState() => _PreBookingsPageState();
}

class _PreBookingsPageState extends State<PreBookingsPage> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    double _screenHeightConstant = queryData.size.height / 100;
    double _screenWidthConstant = queryData.size.width / 100;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainAppbarColor,
        title: const AutoSizeText("Bookings",
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
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  'assets/DelegationModeBackground.png',
                )
            )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: SizedBox(
                height: _screenHeightConstant*35,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),

                    )
                  ),
                  child: AutoSizeText(
                    "Booked Slots",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, "/booked_slots_page");
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: SizedBox(
                height: _screenHeightConstant*35,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),

                      )
                  ),
                  child: AutoSizeText(  
                    "Book New Slots",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                    ),
                  ),
                  onPressed: () async {
                    if (getHeadDelStatus()){
                      var group = await GetDelGroup(getGlobalDelNo());
                      var check = await CheckPermission('bookings_group_${group}_open');
                      if (check) {
                        Navigator.pushNamed(context, "/bookings");
                      } else {
                        final snackBar = SnackBar(
                          content: Text('Bookings Not Yet Open for Group ${group}.'),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    } else {
                      final snackBar = SnackBar(
                        content: const Text('Only Head Delegates Can Make Bookings.'),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      //Navigator.pushNamed(context, "/restricted_access");
                    }
                  },
                ),
              ),
            ),
          ],
        )
      ),
    );
  }
}
