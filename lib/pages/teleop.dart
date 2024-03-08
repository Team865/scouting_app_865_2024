import 'package:flutter/material.dart';

import 'package:scouting_app_865_2024/components/score_counter.dart';
import 'package:scouting_app_865_2024/util/state.dart';
import 'package:scouting_app_865_2024/components/checkmark_button.dart';
import 'package:scouting_app_865_2024/components/ground_intake_button.dart';

class TeleopPage extends StatefulWidget {
  const TeleopPage({super.key});

  // This widget is the root of your application.
  @override
  State<TeleopPage> createState() => _TeleopPageState();
}

class _TeleopPageState extends State<TeleopPage> {
  void changeTeleopDefense(bool? newValue) {
    setState(() {
      ScoutingAppState.teleopDefense = newValue;
    });
  }

  void incrementTeleopAmp(int incValue) {
    setState(() {
      ScoutingAppState.teleopAmpScored += incValue;
      int teleopAmpScored = ScoutingAppState.teleopAmpScored;
      ScoutingAppState.teleopAmpController.text = '$teleopAmpScored';
    });
  }

  void incrementTeleopSpeaker(int incValue) {
    setState(() {
      ScoutingAppState.teleopSpeakerScored += incValue;
      int teleopSpeakerScored = ScoutingAppState.teleopSpeakerScored;
      ScoutingAppState.teleopSpeakerController.text = '$teleopSpeakerScored';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text('Amp:'),
        const SizedBox(height: 8),
        ScoreCounter(
            scoreCounter: ScoutingAppState.teleopAmpScored,
            changeValue: incrementTeleopAmp,
            scoreCounterController: ScoutingAppState.teleopAmpController),
        const SizedBox(height: 8),
        const Text('Speaker'),
        const SizedBox(height: 8),
        ScoreCounter(
            scoreCounter: ScoutingAppState.teleopSpeakerScored,
            changeValue: incrementTeleopSpeaker,
            scoreCounterController: ScoutingAppState.teleopSpeakerController),
        const SizedBox(height: 8),
        const Text('Fouls'),
        const SizedBox(height: 8),
        ScoreCounter(
            scoreCounter: ScoutingAppState.teleopSpeakerScored,
            changeValue: incrementTeleopSpeaker,
            scoreCounterController: ScoutingAppState.teleopSpeakerController),
        const SizedBox(height: 8),
        ElevatedButton(
          //when pressed, updates the value for the teleop amp and speaker variables to match the text
          //used when the number is changed by typing rather then with the buttons
          //this would also be useful to add for other uses of the score counter widget
          child: const Text('Sync typed entries for teleop'),
          onPressed: () {
            ScoutingAppState.teleopAmpScored =
                int.parse(ScoutingAppState.teleopAmpController.text);
            ScoutingAppState.teleopSpeakerScored =
                int.parse(ScoutingAppState.teleopSpeakerController.text);
          },
        ),
        const SizedBox(height: 8),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          Container(
              width: 200,
              child: CheckmarkButton(
                  isChecked: ScoutingAppState.teleopDefense,
                  changeState: changeTeleopDefense,
                  checkboxTitle: 'Defense',
                  checkboxSubtitle: '')),
          const SizedBox(height: 8)
        ]),
        //ground intake grid (everything below this point)
        const Text('Ground Intake'),
        const SizedBox(height: 8),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          GroundIntakeButton(
              selected: ScoutingAppState.teleopGroundIntake1,
              onPressed: (newValue) => setState(
                  () => ScoutingAppState.teleopGroundIntake1 = newValue)),
          const SizedBox(width: 8),
          GroundIntakeButton(
              selected: ScoutingAppState.teleopGroundIntake2,
              onPressed: (newValue) => setState(
                  () => ScoutingAppState.teleopGroundIntake2 = newValue)),
          const SizedBox(width: 8),
          GroundIntakeButton(
              selected: ScoutingAppState.teleopGroundIntake3,
              onPressed: (newValue) => setState(
                  () => ScoutingAppState.teleopGroundIntake3 = newValue)),
        ]),
        const SizedBox(height: 8),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          GroundIntakeButton(
              selected: ScoutingAppState.teleopGroundIntake4,
              onPressed: (newValue) => setState(
                  () => ScoutingAppState.teleopGroundIntake4 = newValue)),
          const SizedBox(width: 8),
          GroundIntakeButton(
              selected: ScoutingAppState.teleopGroundIntake5,
              onPressed: (newValue) => setState(
                  () => ScoutingAppState.teleopGroundIntake5 = newValue)),
          const SizedBox(width: 8),
          GroundIntakeButton(
              selected: ScoutingAppState.teleopGroundIntake6,
              onPressed: (newValue) => setState(
                  () => ScoutingAppState.teleopGroundIntake6 = newValue)),
        ]),
        const SizedBox(height: 8),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          GroundIntakeButton(
              selected: ScoutingAppState.teleopGroundIntake7,
              onPressed: (newValue) => setState(
                  () => ScoutingAppState.teleopGroundIntake7 = newValue)),
          const SizedBox(width: 8),
          GroundIntakeButton(
              selected: ScoutingAppState.teleopGroundIntake8,
              onPressed: (newValue) => setState(
                  () => ScoutingAppState.teleopGroundIntake8 = newValue)),
          const SizedBox(width: 8),
          GroundIntakeButton(
              selected: ScoutingAppState.teleopGroundIntake9,
              onPressed: (newValue) => setState(
                  () => ScoutingAppState.teleopGroundIntake9 = newValue)),
        ]),
        const SizedBox(height: 8),
        GroundIntakeButton(
            selected: ScoutingAppState.teleopGroundIntake10,
            onPressed: (newValue) => setState(
                () => ScoutingAppState.teleopGroundIntake10 = newValue)),
        const SizedBox(height: 8),
        GroundIntakeButton(
            selected: ScoutingAppState.teleopGroundIntake11,
            onPressed: (newValue) => setState(
                () => ScoutingAppState.teleopGroundIntake11 = newValue)),
      ],
    );
  }
}
