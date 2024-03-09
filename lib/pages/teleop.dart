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
        body: SingleChildScrollView(child: Column(
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
                  ]),
              //ground intake grid (everything below this point)
              const Text('Ground Intake (see home page for layout)'),
              const SizedBox(height: 8),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    GroundIntakeButton(
                        selected: ScoutingAppState.autoGroundIntake1,
                        onPressed: (newValue) => setState(() =>
                            ScoutingAppState.autoGroundIntake1 = newValue)),
                    const SizedBox(width: 8),
                    GroundIntakeButton(
                        selected: ScoutingAppState.autoGroundIntake2,
                        onPressed: (newValue) => setState(() =>
                            ScoutingAppState.autoGroundIntake2 = newValue)),
                    const SizedBox(width: 8),
                    GroundIntakeButton(
                        selected: ScoutingAppState.autoGroundIntake3,
                        onPressed: (newValue) => setState(() =>
                            ScoutingAppState.autoGroundIntake3 = newValue)),
                  ]),
              const SizedBox(height: 8),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    GroundIntakeButton(
                        selected: ScoutingAppState.autoGroundIntake4,
                        onPressed: (newValue) => setState(() =>
                            ScoutingAppState.autoGroundIntake4 = newValue)),
                    const SizedBox(width: 8),
                    GroundIntakeButton(
                        selected: ScoutingAppState.autoGroundIntake5,
                        onPressed: (newValue) => setState(() =>
                            ScoutingAppState.autoGroundIntake5 = newValue)),
                    const SizedBox(width: 8),
                    GroundIntakeButton(
                        selected: ScoutingAppState.autoGroundIntake6,
                        onPressed: (newValue) => setState(() =>
                            ScoutingAppState.autoGroundIntake6 = newValue)),
                  ]),
              const SizedBox(height: 8),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    GroundIntakeButton(
                        selected: ScoutingAppState.autoGroundIntake7,
                        onPressed: (newValue) => setState(() =>
                            ScoutingAppState.autoGroundIntake7 = newValue)),
                    const SizedBox(width: 8),
                    GroundIntakeButton(
                        selected: ScoutingAppState.autoGroundIntake8,
                        onPressed: (newValue) => setState(() =>
                            ScoutingAppState.autoGroundIntake8 = newValue)),
                    const SizedBox(width: 8),
                    GroundIntakeButton(
                        selected: ScoutingAppState.autoGroundIntake9,
                        onPressed: (newValue) => setState(() =>
                            ScoutingAppState.autoGroundIntake9 = newValue)),
                  ]),
              const SizedBox(height: 8),
              GroundIntakeButton(
                  selected: ScoutingAppState.autoGroundIntake10,
                  onPressed: (newValue) => setState(
                      () => ScoutingAppState.autoGroundIntake10 = newValue)),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: GroundIntakeButton(
                    selected: ScoutingAppState.autoGroundIntake11,
                    onPressed: (newValue) => setState(
                        () => ScoutingAppState.autoGroundIntake11 = newValue)),
              ),
            ])));
  }
}
