import 'package:flutter/material.dart';

import 'package:scouting_app_865_2024/components/score_counter.dart';
import 'package:scouting_app_865_2024/util/state.dart';
import 'package:scouting_app_865_2024/components/checkmark_button.dart';
import 'package:scouting_app_865_2024/components/ground_intake_button.dart';
import 'package:scouting_app_865_2024/util/themes.dart';

class TeleopPage extends StatefulWidget {
  const TeleopPage({super.key});

  // This widget is the root of your application.
  @override
  State<TeleopPage> createState() => _TeleopPageState();
}

class _TeleopPageState extends State<TeleopPage> {
  void changeTeleopDefense(bool? newValue) {
    setState(() {
      ScoutingAppState.teleopDefense = newValue!;
    });
  }

  void incrementTeleopAmp(int incValue) {
    setState(() {
      if (ScoutingAppState.teleopAmpScored <= 0 && incValue < 0) {
        ScoutingAppState.teleopAmpScored = 0;
        return;
      }
      ScoutingAppState.teleopAmpScored += incValue;
    });
  }

  void incrementTeleopSpeaker(int incValue) {
    setState(() {
      if (ScoutingAppState.teleopSpeakerScored <= 0 && incValue < 0) {
        ScoutingAppState.teleopSpeakerScored = 0;
        return;
      }
      ScoutingAppState.teleopSpeakerScored += incValue;
    });
  }

  void changeTechFoul(bool? newValue) {
    setState(() {
      ScoutingAppState.techFoul = newValue!;
    });
  }

  void changeFoul(bool? newValue) {
    setState(() {
      ScoutingAppState.foul = newValue!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
              'Teleop',
              style: TextStyle(color: Colors.white),
            ),
            centerTitle: true,
            backgroundColor: lightTheme.colorScheme.primary),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('Amp'),
              const SizedBox(height: 8),
              ScoreCounter(
                scoreCounter: ScoutingAppState.teleopAmpScored,
                changeValue: incrementTeleopAmp,
              ),
              const SizedBox(height: 8),
              const Text('Speaker'),
              const SizedBox(height: 8),
              ScoreCounter(
                scoreCounter: ScoutingAppState.teleopSpeakerScored,
                changeValue: incrementTeleopSpeaker,
              ),
              const SizedBox(height: 8),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                        width: 200,
                        child: CheckmarkButton(
                            isChecked: ScoutingAppState.teleopDefense,
                            changeState: changeTeleopDefense,
                            checkboxTitle: 'Defense',
                            checkboxSubtitle: '')),
                    const SizedBox(height: 8)
                  ]),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                        width: 200,
                        child: CheckmarkButton(
                            isChecked: ScoutingAppState.techFoul,
                            changeState: changeTechFoul,
                            checkboxTitle: 'Tech foul',
                            checkboxSubtitle: '')),
                    const SizedBox(height: 8)
                  ]),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                        width: 200,
                        child: CheckmarkButton(
                            isChecked: ScoutingAppState.foul,
                            changeState: changeFoul,
                            checkboxTitle: 'Foul',
                            checkboxSubtitle: '')),
                    const SizedBox(height: 8)
                  ]),
            ]));
  }
}
