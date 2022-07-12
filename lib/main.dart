import 'dart:io';
import 'package:flutter/material.dart';
import 'package:ignite_mobile_app_fps/pages/Booked%20Slots/bank_booked_A.dart';
import 'package:ignite_mobile_app_fps/pages/Booked%20Slots/bank_booked_B.dart';
import 'package:ignite_mobile_app_fps/pages/Booked%20Slots/classroom_booked_A.dart';
import 'package:ignite_mobile_app_fps/pages/Booked%20Slots/classroom_booked_B.dart';
import 'package:ignite_mobile_app_fps/pages/Booked%20Slots/fashion_ramp_booked_A.dart';
import 'package:ignite_mobile_app_fps/pages/Booked%20Slots/fashion_ramp_booked_B.dart';
import 'package:ignite_mobile_app_fps/pages/Booked%20Slots/green_screen_bookings_booked_A.dart';
import 'package:ignite_mobile_app_fps/pages/Booked%20Slots/green_screen_bookings_booked_B.dart';
import 'package:ignite_mobile_app_fps/pages/Booked%20Slots/hospital_booked_A.dart';
import 'package:ignite_mobile_app_fps/pages/Booked%20Slots/hospital_booked_B.dart';
import 'package:ignite_mobile_app_fps/pages/Booked%20Slots/news_room_and_computer_lab_booked_A.dart';
import 'package:ignite_mobile_app_fps/pages/Booked%20Slots/news_room_and_computer_lab_booked_B.dart';
import 'package:ignite_mobile_app_fps/pages/Booked%20Slots/restaurant_booked_A.dart';
import 'package:ignite_mobile_app_fps/pages/Booked%20Slots/restaurant_booked_B.dart';
import 'package:ignite_mobile_app_fps/pages/Booked%20Slots/science_lab_booked_A.dart';
import 'package:ignite_mobile_app_fps/pages/Booked%20Slots/science_lab_booked_B.dart';
import 'package:ignite_mobile_app_fps/pages/Booked%20Slots/sports_room_booked_A.dart';
import 'package:ignite_mobile_app_fps/pages/Booked%20Slots/sports_room_booked_B.dart';
import 'package:ignite_mobile_app_fps/pages/booked_slots.dart';
import 'package:ignite_mobile_app_fps/pages/bookings_slots/bank_A.dart';
import 'package:ignite_mobile_app_fps/pages/bookings_slots/bank_B.dart';
import 'package:ignite_mobile_app_fps/pages/bookings_slots/classroom_A.dart';
import 'package:ignite_mobile_app_fps/pages/bookings_slots/classroom_B.dart';
import 'package:ignite_mobile_app_fps/pages/bookings_slots/fashion_ramp_A.dart';
import 'package:ignite_mobile_app_fps/pages/bookings_slots/fashion_ramp_B.dart';
import 'package:ignite_mobile_app_fps/pages/bookings_slots/green_screen_bookings_B.dart';
import 'package:ignite_mobile_app_fps/pages/bookings_slots/hospital_A.dart';
import 'package:ignite_mobile_app_fps/pages/bookings_slots/hospital_B.dart';
import 'package:ignite_mobile_app_fps/pages/bookings_slots/news_room_and_computer_lab_A.dart';
import 'package:ignite_mobile_app_fps/pages/bookings_slots/news_room_and_computer_lab_B.dart';
import 'package:ignite_mobile_app_fps/pages/bookings_slots/restaurant_A.dart';
import 'package:ignite_mobile_app_fps/pages/bookings_slots/restaurant_B.dart';
import 'package:ignite_mobile_app_fps/pages/bookings_slots/science_lab_A.dart';
import 'package:ignite_mobile_app_fps/pages/bookings_slots/science_lab_B.dart';
import 'package:ignite_mobile_app_fps/pages/bookings_slots/sports_room_A.dart';
import 'package:ignite_mobile_app_fps/pages/bookings_slots/sports_room_B.dart';
import 'package:ignite_mobile_app_fps/pages/home.dart';
import 'package:ignite_mobile_app_fps/pages/delegation_login.dart';
import 'package:ignite_mobile_app_fps/pages/delegation_mode.dart';
import 'package:ignite_mobile_app_fps/pages/bookings.dart';
import 'package:ignite_mobile_app_fps/pages/pre_bookings_page.dart';
import 'package:ignite_mobile_app_fps/pages/restricted_page.dart';
import 'package:ignite_mobile_app_fps/pages/round_tips.dart';
import 'package:ignite_mobile_app_fps/pages/notifications.dart';
import 'package:ignite_mobile_app_fps/pages/what_is_ignite.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:overlay_support/overlay_support.dart';
import 'firebase_options.dart';
import 'package:ignite_mobile_app_fps/pages/ic_balance_page.dart';
import 'package:ignite_mobile_app_fps/pages/bookings_slots/green_screen_bookings_A.dart';
import 'package:ignite_mobile_app_fps/firebase_code/delegation_database.dart';
import 'package:ignite_mobile_app_fps/pages/welcome_page.dart';
import 'package:ignite_mobile_app_fps/pages/round_tips/tips_digital_poster_making.dart';
import 'package:ignite_mobile_app_fps/pages/round_tips/tips_flyer_designing.dart';
import 'package:ignite_mobile_app_fps/pages/round_tips/tips_pitch_to_investors.dart';
import 'package:ignite_mobile_app_fps/pages/round_tips/tips_pr_crisis.dart';
import 'package:ignite_mobile_app_fps/pages/round_tips/tips_stock_exchange_round.dart';
import 'package:ignite_mobile_app_fps/pages/round_tips/tips_tvc_filming.dart';

String? delNum = "";
bool IsHeadDel = false;
String delGroup = "";

void main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      name: 'IgniteMobileAppFPS',
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } on FirebaseException catch (e) {
    if(e.code == 'duplicate-app') {}
    else {
      throw e;
    }
  } catch (e) {rethrow;}

  delNum = await getGlobalDelNoFromFile();
  IsHeadDel = (await getHeadDelStatusFromFile())!;
  setDelGroup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OverlaySupport(
      child: MaterialApp(
        title: 'Ignite',
        initialRoute: '/delegation_login',
        routes: {
          '/welcome_page' : (context) => const WelcomePage(),
          '/home': (context) => const MyHomePage(),
          '/delegation_login': (context) => const DelegationLoginPage(),
          '/delegation_mode' : (context) => const DelegationModePage(),
          '/round_tips' : (context) => const RoundTipsPage(),
          '/bookings' : (context) => const BookingsPage(),
          '/pre_bookings_page' : (context) => const PreBookingsPage(),
          '/restricted_access' : (context) => const RestrictedPage(),
          '/notifications' : (context) => const NotificationsPage(),
          '/what_is_ignite' : (context) => const WhatIsIgnite(),
          '/ic_report_page' : (context) => const ICsReportPage(),
          '/bookings_green_screen_A' : (context) => const GreenScreenBookingsA(),
          '/bookings_green_screen_B' : (context) => const GreenScreenBookingsB(),
          '/bank_A' : (context) => const BankA(),
          '/bank_B' : (context) => const BankB(),
          '/classroom_A' : (context) => const ClassroomA(),
          '/classroom_B' : (context) => const ClassroomB(),
          '/fashion_ramp_A' : (context) => const FashionRampA(),
          '/fashion_ramp_B' : (context) => const FashionRampB(),
          '/hospital_A' : (context) => const HospitalA(),
          '/hospital_B' : (context) => const HospitalB(),
          '/news_room_and_computer_lab_A' : (context) => const NewsRoomAndComputerLabA(),
          '/news_room_and_computer_lab_B' : (context) => const NewsRoomAndComputerLabB(),
          '/sports_room_A' : (context) => const SportsRoomA(),
          '/sports_room_B' : (context) => const SportsRoomB(),
          '/restaurant_A' : (context) => const RestaurantA(),
          '/restaurant_B' : (context) => const RestaurantB(),
          '/science_lab_A' : (context) => const ScienceLabA(),
          '/science_lab_B' : (context) => const ScienceLabB(),
          '/bookings_green_screen_booked_A' : (context) => const GreenScreenBookingsBookedA(),
          '/bookings_green_screen_booked_B' : (context) => const GreenScreenBookingsBookedB(),
          '/bank_booked_A' : (context) => const BankBookedA(),
          '/bank_booked_B' : (context) => const BankBookedB(),
          '/classroom_booked_A' : (context) => const ClassroomBookedA(),
          '/classroom_booked_B' : (context) => const ClassroomBookedB(),
          '/fashion_ramp_booked_A' : (context) => const FashionRampBookedA(),
          '/fashion_ramp_booked_B' : (context) => const FashionRampBookedB(),
          '/hospital_booked_A' : (context) => const HospitalBookedA(),
          '/hospital_booked_B' : (context) => const HospitalBookedB(),
          '/news_room_and_computer_lab_booked_A' : (context) => const NewsRoomAndComputerLabBookedA(),
          '/news_room_and_computer_lab_booked_B' : (context) => const NewsRoomAndComputerLabBookedB(),
          '/sports_room_booked_A' : (context) => const SportsRoomBookedA(),
          '/sports_room_booked_B' : (context) => const SportsRoomBookedB(),
          '/restaurant_booked_A' : (context) => const RestaurantBookedA(),
          '/restaurant_booked_B' : (context) => const RestaurantBookedB(),
          '/science_lab_booked_A' : (context) => const ScienceLabBookedA(),
          '/science_lab_booked_B' : (context) => const ScienceLabBookedB(),
          '/round_tips/flyer_designing' : (context) => const FlyerDesigning(),
          '/round_tips/digital_poster_making' : (context) => const PosterMaking(),
          '/round_tips/tvc_filming' : (context) => const TVCFilming(),
          '/round_tips/stock_exchange_round' : (context) => const StockExchangeRound(),
          '/round_tips/pr_crisis' : (context) => const PRCrisis(),
          '/round_tips/pitch_to_investors' : (context) => const PitchToInvestors(),
          '/booked_slots_page' : (context) => const BookedSlotsPage(),
        },
      ),
    );
  }
}

String? getGlobalDelNo() {
  print("Got del num from global variable.");
  return delNum;
}

void setGlobalDelNo(delNumString) {
  print("Wrote del num $delNumString from global variable.");
  delNum = delNumString;
}

bool getHeadDelStatus() {
  print("Got del num from global variable.");
  return IsHeadDel;
}

void setHeadDelStatus(bool x) {
  IsHeadDel = x;
  print("Wrote del num $IsHeadDel from global variable.");
}

void closeApp() {
  exit(0);
}

Future<void> setDelGroup() async {
  delGroup = await GetDelGroup(getGlobalDelNo());
}

String getGlobalDelGroup() {
  return delGroup;
}