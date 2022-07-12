import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ignite_mobile_app_fps/additional_code/theme.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:ignite_mobile_app_fps/firebase_code/delegation_database.dart';
import 'package:ignite_mobile_app_fps/main.dart';

class BookedSlotsPage extends StatefulWidget {
  const BookedSlotsPage({Key? key}) : super(key: key);

  @override
  _NewsUpdatesPageState createState() => _NewsUpdatesPageState();
}

class _NewsUpdatesPageState extends State<BookedSlotsPage> {
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
          elevation: 10,
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
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              SizedBox(
                height: 15,
              ),
              RoomDisplayCard(imageAssetsRoute: 'assets/TVC_Sets_Images/fashion.JPG', roomName: "Fashion Ramp", slotsPageRoute: '/fashion_ramp_booked', screenHeightConstant: _screenHeightConstant, screenWidthConstant: _screenWidthConstant),
              RoomDisplayCard(imageAssetsRoute: 'assets/TVC_Sets_Images/bank.JPG', roomName: "Bank", slotsPageRoute: '/bank_booked', screenHeightConstant: _screenHeightConstant, screenWidthConstant: _screenWidthConstant),
              RoomDisplayCard(imageAssetsRoute: 'assets/TVC_Sets_Images/classroom.JPG', roomName: "Classroom", slotsPageRoute: '/classroom_booked', screenHeightConstant: _screenHeightConstant, screenWidthConstant: _screenWidthConstant),
              RoomDisplayCard(imageAssetsRoute: 'assets/TVC_Sets_Images/hospital.JPG', roomName: "Hospital", slotsPageRoute: '/hospital_booked', screenHeightConstant: _screenHeightConstant, screenWidthConstant: _screenWidthConstant),
              RoomDisplayCard(imageAssetsRoute: 'assets/TVC_Sets_Images/computerlab.JPG', roomName: "News Room - Computer Lab", slotsPageRoute: '/news_room_and_computer_lab_booked', screenHeightConstant: _screenHeightConstant, screenWidthConstant: _screenWidthConstant),
              RoomDisplayCard(imageAssetsRoute: 'assets/TVC_Sets_Images/restaurant.JPG', roomName: "Restaurant", slotsPageRoute: '/restaurant_booked', screenHeightConstant: _screenHeightConstant, screenWidthConstant: _screenWidthConstant),
              RoomDisplayCard(imageAssetsRoute: 'assets/TVC_Sets_Images/science_lab.JPG', roomName: "Science Lab", slotsPageRoute: '/science_lab_booked', screenHeightConstant: _screenHeightConstant, screenWidthConstant: _screenWidthConstant),
              RoomDisplayCard(imageAssetsRoute: 'assets/TVC_Sets_Images/sports_room.JPG', roomName: "Sports Room", slotsPageRoute: '/sports_room_booked', screenHeightConstant: _screenHeightConstant, screenWidthConstant: _screenWidthConstant),
              RoomDisplayCard(imageAssetsRoute: 'assets/TVC_Sets_Images/green_screen.JPG', roomName: "Green Screen Room", slotsPageRoute: '/bookings_green_screen_booked', screenHeightConstant: _screenHeightConstant, screenWidthConstant: _screenWidthConstant),
            ],
          ),
        ));
  }
}

class RoomDisplayCard extends StatelessWidget {

  final imageAssetsRoute;
  final roomName;
  final slotsPageRoute;
  final screenHeightConstant;
  final screenWidthConstant;

  const RoomDisplayCard({Key? key, required this.imageAssetsRoute, required this.roomName, required this.slotsPageRoute, required this.screenHeightConstant, required this.screenWidthConstant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(screenHeightConstant*1.5),
      child: Card(
          color: Colors.white,
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30)),
          child: Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Image(
                    image: AssetImage(imageAssetsRoute),
                    fit: BoxFit.fill,
                    height: screenHeightConstant*45,
                    width: (screenHeightConstant*45),
                  ),
                  AutoSizeText(
                    roomName,
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              TextButton(
                  onPressed: () async {
                    var nowGroup = await GetDelGroup(getGlobalDelNo());
                    print("Now Group is $nowGroup");
                    if(nowGroup == "A") {
                      print("Group detected A");
                      Navigator.pushNamed(context, "${slotsPageRoute}_A");
                    } else if(nowGroup == "B") {
                      Navigator.pushNamed(context, "${slotsPageRoute}_B");
                      print("Group detected A");
                    }
                  },
                  child: AutoSizeText(
                    "See Booked Slots",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  )
              ),
              SizedBox(
                height: 5,
              ),
            ],
          )),
    );
  }
}
