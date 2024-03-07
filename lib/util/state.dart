import 'package:flutter/material.dart';

import 'package:scouting_app_865_2024/main.dart';
import 'package:scouting_app_865_2024/pages/auto.dart';
import 'package:scouting_app_865_2024/pages/endgame.dart';
import 'package:scouting_app_865_2024/pages/home.dart';
import 'package:scouting_app_865_2024/pages/submission.dart';
import 'package:scouting_app_865_2024/pages/teleop.dart';

class ScoutingAppState extends State<ScoutingApp> {
  int pageIndex = 0;

  //home
  static String robotPosition = '';

  //auto
  static int autoAmpScored = 0;
  static int autoSpeakerScored = 0;
  static bool? autoMobility = false;
  static bool autoGroundIntake1 = false;
  static bool autoGroundIntake2 = false;
  static bool autoGroundIntake3 = false;
  static bool autoGroundIntake4 = false;
  static bool autoGroundIntake5 = false;
  static bool autoGroundIntake6 = false;
  static bool autoGroundIntake7 = false;
  static bool autoGroundIntake8 = false;
  static bool autoGroundIntake9 = false;
  static bool autoGroundIntake10 = false;
  static bool autoGroundIntake11 = false;

  //endgame
  static bool climb = false;
  static bool park = false;
  static bool trap = false;

  //text editing controllers
  static var autoAmpController = TextEditingController(text: '0');
  static var autoSpeakerController = TextEditingController(text: '0');
  static var nameController = TextEditingController();
  static var matchController = TextEditingController();
  static var teamController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: NavigationBar(
            selectedIndex: pageIndex,
            onDestinationSelected: (int index) {
              setState(() {
                pageIndex = index;
              });
            },
            destinations: const [
              NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
              NavigationDestination(
                  icon: Icon(Icons.videogame_asset_off), label: 'Auto'),
              NavigationDestination(
                  icon: Icon(Icons.videogame_asset), label: 'Teleop'),
              NavigationDestination(
                  icon: Icon(Icons.access_time), label: 'Endgame'),
              NavigationDestination(
                  icon: Icon(Icons.qr_code), label: 'Submission')
            ]),
        body: <Widget>[
          const HomePage(),
          const AutoPage(),
          const TeleopPage(),
          const EndgamePage(),
          const SubmissionPage()
        ][pageIndex]);
  }

  static int boolToInt(bool value) {
    return value ? 1 : 0;
  }

  static List<dynamic> getData() {
    List<dynamic> data = [
      robotPosition,
      autoAmpScored,
      autoSpeakerScored,
      autoMobility,
      // TODO: make this less ugly
      boolToInt(autoGroundIntake1) +
      boolToInt(autoGroundIntake2) +
      boolToInt(autoGroundIntake3) +
      boolToInt(autoGroundIntake4) +
      boolToInt(autoGroundIntake5) +
      boolToInt(autoGroundIntake6) +
      boolToInt(autoGroundIntake7) +
      boolToInt(autoGroundIntake8) +
      boolToInt(autoGroundIntake9) +
      boolToInt(autoGroundIntake10) +
      boolToInt(autoGroundIntake11),
      autoGroundIntake1,
      autoGroundIntake2,
      autoGroundIntake3,
      autoGroundIntake4,
      autoGroundIntake5,
      autoGroundIntake6,
      autoGroundIntake7,
      autoGroundIntake8,
      autoGroundIntake9,
      autoGroundIntake10,
      autoGroundIntake11,
      climb,
      park,
      trap,
      autoAmpController.text,
      autoSpeakerController.text,
      nameController.text,
      matchController.text,
      teamController.text,
    ];
    return data;
  }
}

/*
class MyAppState extends ChangeNotifier {
  /*
  FOR TESTING ONLY
  note: in this code, typing in the text field does not change the score counter value, only the text value

  int scoreCounter1 = 0;
  final scoreCounterController1 = TextEditingController();
  changeValue1(int increment) {
    scoreCounter1 += increment;
    scoreCounterController1.text = '$scoreCounter1';
    notifyListeners();
  //variables

  //auto
  static int autoAmpScored = 0;
  static int autoSpeakerScored = 0;
  static bool? autoMobility = false;
  static bool autoGroundIntake1 = false;
  static bool autoGroundIntake2 = false;
  static bool autoGroundIntake3 = false;
  static bool autoGroundIntake4 = false;
  static bool autoGroundIntake5 = false;
  static bool autoGroundIntake6 = false;
  static bool autoGroundIntake7 = false;
  static bool autoGroundIntake8 = false;
  static bool autoGroundIntake9 = false;
  static bool autoGroundIntake10 = false;
  static bool autoGroundIntake11 = false;

  //endgame
  static bool climb = false;
  static bool park = false;
  static bool trap = false;

  //text editing controllers
  static var autoAmpController = TextEditingController();
  static var autoSpeakerController = TextEditingController();

  //functions
  static incrementAutoAmp(int incValue) {
    autoAmpScored += incValue;
    autoAmpController.text = '$autoAmpScored';
    UpdateShouldNotify;
  }

  static incrementAutoSpeaker(int incValue) {
    autoSpeakerScored += incValue;
    autoSpeakerController.text = '$autoSpeakerScored';
    UpdateShouldNotify;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: NavigationBar(
            selectedIndex: pageIndex,
            onDestinationSelected: (int index) {
              setState(() {
                pageIndex = index;
              });
            },
            destinations: const [
              NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
              NavigationDestination(
                  icon: Icon(Icons.videogame_asset_off), label: 'Auto'),
              NavigationDestination(
                  icon: Icon(Icons.videogame_asset), label: 'Teleop'),
              NavigationDestination(
                  icon: Icon(Icons.access_time), label: 'Endgame'),
              NavigationDestination(
                  icon: Icon(Icons.qr_code), label: 'Submission')
            ]),
        body: <Widget>[
          const HomePage(),
          const AutoPage(),
          const TeleopPage(),
          EndgamePage(),
          const SubmissionPage()
        ][pageIndex]);
  }
}*/*/
