import 'package:flutter/material.dart';

import 'package:scouting_app_865_2024/components/score_counter.dart';
import 'package:scouting_app_865_2024/util/state.dart';
import 'package:scouting_app_865_2024/components/checkmark_button.dart';
import 'package:scouting_app_865_2024/components/ground_intake_button.dart';
import 'package:scouting_app_865_2024/util/themes.dart';

class AutoPage extends StatefulWidget {
  const AutoPage({super.key});

  // This widget is the root of your application.
  @override
  State<AutoPage> createState() => _AutoPageState();
}

class _AutoPageState extends State<AutoPage> {
  void changeAutoMobility(bool? newValue) {
    setState(() {
      ScoutingAppState.autoMobility = newValue!;
    });
  }

  void incrementAutoAmp(int incValue) {
    setState(() {
      if (ScoutingAppState.autoAmpScored <= 0 && incValue < 0) {
        ScoutingAppState.autoAmpScored = 0;
        return;
      }
      ScoutingAppState.autoAmpScored += incValue;
    });
  }

  void incrementAutoSpeaker(int incValue) {
    setState(() {
      if (ScoutingAppState.autoSpeakerScored <= 0 && incValue < 0) {
        ScoutingAppState.autoSpeakerScored = 0;
        return;
      }
      ScoutingAppState.autoSpeakerScored += incValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Auto',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: lightTheme.colorScheme.primary,
        ),
        body: SingleChildScrollView(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Amp'),
            const SizedBox(height: 8),
            ScoreCounter(
                scoreCounter: ScoutingAppState.autoAmpScored,
                changeValue: incrementAutoAmp),
            const SizedBox(height: 8),
            const Text('Speaker'),
            const SizedBox(height: 8),
            ScoreCounter(
                scoreCounter: ScoutingAppState.autoSpeakerScored,
                changeValue: incrementAutoSpeaker),
            const SizedBox(height: 8),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              Container(
                  width: 200,
                  child: CheckmarkButton(
                      isChecked: ScoutingAppState.autoMobility,
                      changeState: changeAutoMobility,
                      checkboxTitle: 'Mobility',
                      checkboxSubtitle: '')),
              const SizedBox(height: 8)
            ]),
            //ground intake grid (everything below this point)
            const Text('Ground Intake (see home page for layout)'),
            const SizedBox(height: 8),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              GroundIntakeButton(
                  selected: ScoutingAppState.autoGroundIntake1,
                  onPressed: (newValue) => setState(
                      () => ScoutingAppState.autoGroundIntake1 = newValue)),
              const SizedBox(width: 8),
              GroundIntakeButton(
                  selected: ScoutingAppState.autoGroundIntake2,
                  onPressed: (newValue) => setState(
                      () => ScoutingAppState.autoGroundIntake2 = newValue)),
              const SizedBox(width: 8),
              GroundIntakeButton(
                  selected: ScoutingAppState.autoGroundIntake3,
                  onPressed: (newValue) => setState(
                      () => ScoutingAppState.autoGroundIntake3 = newValue)),
            ]),
            const SizedBox(height: 8),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              GroundIntakeButton(
                  selected: ScoutingAppState.autoGroundIntake4,
                  onPressed: (newValue) => setState(
                      () => ScoutingAppState.autoGroundIntake4 = newValue)),
              const SizedBox(width: 8),
              GroundIntakeButton(
                  selected: ScoutingAppState.autoGroundIntake5,
                  onPressed: (newValue) => setState(
                      () => ScoutingAppState.autoGroundIntake5 = newValue)),
              const SizedBox(width: 8),
              GroundIntakeButton(
                  selected: ScoutingAppState.autoGroundIntake6,
                  onPressed: (newValue) => setState(
                      () => ScoutingAppState.autoGroundIntake6 = newValue)),
            ]),
            const SizedBox(height: 8),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              GroundIntakeButton(
                  selected: ScoutingAppState.autoGroundIntake7,
                  onPressed: (newValue) => setState(
                      () => ScoutingAppState.autoGroundIntake7 = newValue)),
              const SizedBox(width: 8),
              GroundIntakeButton(
                  selected: ScoutingAppState.autoGroundIntake8,
                  onPressed: (newValue) => setState(
                      () => ScoutingAppState.autoGroundIntake8 = newValue)),
              const SizedBox(width: 8),
              GroundIntakeButton(
                  selected: ScoutingAppState.autoGroundIntake9,
                  onPressed: (newValue) => setState(
                      () => ScoutingAppState.autoGroundIntake9 = newValue)),
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
          ],
        )));
  }
}
