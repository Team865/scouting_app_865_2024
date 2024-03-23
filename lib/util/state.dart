import 'package:flutter/material.dart';

import 'package:scouting_app_865_2024/main.dart';
import 'package:scouting_app_865_2024/pages/easter_egg.dart';
import 'package:scouting_app_865_2024/pages/easter_egg_2.dart';
import 'package:scouting_app_865_2024/pages/auto.dart';
import 'package:scouting_app_865_2024/pages/endgame.dart';
import 'package:scouting_app_865_2024/pages/home.dart';
import 'package:scouting_app_865_2024/pages/submission.dart';
import 'package:scouting_app_865_2024/pages/teleop.dart';

class ScoutingAppState extends State<ScoutingApp> {
  static int pageIndex = 0;
  static int navIndex = 0;

  static int easterEggCount = 0;
  static int easterEgg2Count = 0;

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
  static bool techFoul = false;
  static bool foul = false;
  //endgame
  static bool climb = false;
  static bool park = false;
  static bool trap = false;

  static int foundEasterEggs = 0;

  static const List<Widget> PAGES = [
    const HomePage(),
    const AutoPage(),
    const TeleopPage(),
    const EndgamePage(),
    const SubmissionPage(),
    const EasterEgg2Page(),
    const EasterEggPage(),
  ];

  // number of page switches to trigger easter egg
  static const int EASTER_EGG_TRIGGER_COUNT = 86; // rounded from 86.5 because 865 is too many

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: NavigationBar(
            selectedIndex: navIndex,
            onDestinationSelected: (int index) {
              setState(() {
                // trigger by switching pages 60 times, anyone who doesn't reload much will probably get by end of comp
                // get out by going to page other than home, visually indicated by setting navIndex to home
                easterEggCount++;
                if (easterEggCount >= EASTER_EGG_TRIGGER_COUNT) {
                  foundEasterEggs++;
                  pageIndex = PAGES.length - 1;
                  navIndex = 0;
                  if (easterEggCount > EASTER_EGG_TRIGGER_COUNT && index != 0) {
                    easterEggCount = 0;
                  } else {
                    return;
                  }
                }

                navIndex = pageIndex = index;
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
                  icon: Icon(Icons.qr_code), label: 'Submission'),
            ]),
        body: PAGES[pageIndex]);
  }

  static int boolToInt(bool value) {
    return value ? 1 : 0;
  }

  static int boolsToInt(List<bool> values) {
    int intValue = 0;
    for (bool value in values) {
      intValue += boolToInt(value);
    }
    return intValue;
  }

  static String sterilize(String value) {
    // no valid string a person would enter should need these
    return value.replaceAll(RegExp(r"[=\(\)\\;\{\}]"), "_");
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
      techFoul,
      foul,
      climb,
      park,
      trap,
      foundEasterEggs
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

    // ignore: avoid_print
    print("Sending data $data");

    return data;
  }

  static bool dataInvalid() {
    if (nameController.text == "test") {
      return false;
    } else {
      return nameController.text.isEmpty ||
          matchController.text.isEmpty ||
          teamController.text.isEmpty ||
          robotPosition.isEmpty;
    }
  }
}
