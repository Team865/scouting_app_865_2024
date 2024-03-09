import 'package:flutter/material.dart';

import 'package:scouting_app_865_2024/main.dart';
import 'package:scouting_app_865_2024/pages/auto.dart';
import 'package:scouting_app_865_2024/pages/endgame.dart';
import 'package:scouting_app_865_2024/pages/home.dart';
import 'package:scouting_app_865_2024/pages/submission.dart';
import 'package:scouting_app_865_2024/pages/teleop.dart';

class ScoutingAppState extends State<ScoutingApp> {
  int pageIndex = 0;

  //text editing controllers
  static var nameController = TextEditingController();
  static var matchController = TextEditingController();
  static var teamController = TextEditingController();
  static var commentsController = TextEditingController();

  //home
  static String robotPosition = '';

  //auto
  static int autoAmpScored = 0;
  static int autoSpeakerScored = 0;
  static bool autoMobility = false;
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

  //teleop
  static int teleopAmpScored = 0;
  static int teleopSpeakerScored = 0;
  static bool teleopDefense = false;
  static bool teleopGroundIntake1 = false;
  static bool teleopGroundIntake2 = false;
  static bool teleopGroundIntake3 = false;
  static bool teleopGroundIntake4 = false;
  static bool teleopGroundIntake5 = false;
  static bool teleopGroundIntake6 = false;
  static bool teleopGroundIntake7 = false;
  static bool teleopGroundIntake8 = false;
  static bool teleopGroundIntake9 = false;
  static bool teleopGroundIntake10 = false;
  static bool teleopGroundIntake11 = false;
  static bool techFoul = false;
  static bool foul = false;
  //endgame
  static bool climb = false;
  static bool park = false;
  static bool trap = false;

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

  static int boolsToInt(List<bool> values) {
    int intValue = 0;
    values.forEach((value) => intValue += boolToInt(value));
    return intValue;
  }

  static String sterilize(String value) {
    return value.replaceAll(RegExp(r"[=\(\)\\;\{\}]"),
        "_"); // no valid string a person would enter should need these
  }

  static void reset(bool keepName) {
    if (!keepName) {
      nameController.clear();
    }

    matchController.clear();
    teamController.clear();
    commentsController.clear();

    robotPosition = '';

    autoAmpScored = 0;
    autoSpeakerScored = 0;
    autoMobility = false;
    autoGroundIntake1 = false;
    autoGroundIntake2 = false;
    autoGroundIntake3 = false;
    autoGroundIntake4 = false;
    autoGroundIntake5 = false;
    autoGroundIntake6 = false;
    autoGroundIntake7 = false;
    autoGroundIntake8 = false;
    autoGroundIntake9 = false;
    autoGroundIntake10 = false;
    autoGroundIntake11 = false;

    teleopAmpScored = 0;
    teleopSpeakerScored = 0;
    teleopDefense = false;
    teleopGroundIntake1 = false;
    teleopGroundIntake2 = false;
    teleopGroundIntake3 = false;
    teleopGroundIntake4 = false;
    teleopGroundIntake5 = false;
    teleopGroundIntake6 = false;
    teleopGroundIntake7 = false;
    teleopGroundIntake8 = false;
    teleopGroundIntake9 = false;
    teleopGroundIntake10 = false;
    teleopGroundIntake11 = false;
    techFoul = false;
    foul = false;

    climb = false;
    park = false;
    trap = false;
  }

  static List<dynamic> getData() {
    List<dynamic> data = [
      nameController,
      matchController,
      teamController,
      commentsController,
      robotPosition,
      autoAmpScored,
      autoSpeakerScored,
      autoMobility,
      boolsToInt([
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
        autoGroundIntake11
      ]),
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
      teleopAmpScored,
      teleopSpeakerScored,
      teleopDefense,
      boolsToInt([
        teleopGroundIntake1,
        teleopGroundIntake2,
        teleopGroundIntake3,
        teleopGroundIntake4,
        teleopGroundIntake5,
        teleopGroundIntake6,
        teleopGroundIntake7,
        teleopGroundIntake8,
        teleopGroundIntake9,
        teleopGroundIntake10,
        teleopGroundIntake11
      ]),
      teleopGroundIntake1,
      teleopGroundIntake2,
      teleopGroundIntake3,
      teleopGroundIntake4,
      teleopGroundIntake5,
      teleopGroundIntake6,
      teleopGroundIntake7,
      teleopGroundIntake8,
      teleopGroundIntake9,
      teleopGroundIntake10,
      teleopGroundIntake11,
      techFoul,
      foul,
      climb,
      park,
      trap,
    ];

    // make all text fields strings and sterilize them
    int index;
    while ((index =
            data.indexWhere((element) => element is TextEditingController)) !=
        -1) {
      if (data[index] is TextEditingController) {
        data[index] = sterilize((data[index] as TextEditingController).text);
      } else {
        data[index] = sterilize(data[index].toString());
      }
    }

    print("Sending data ${data}");

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
