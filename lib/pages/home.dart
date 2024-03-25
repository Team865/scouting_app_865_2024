import 'package:flutter/material.dart';

import 'package:scouting_app_865_2024/util/state.dart';
import 'package:scouting_app_865_2024/components/checkmark_button.dart';
import 'package:scouting_app_865_2024/components/radio_buttons.dart';
import 'package:scouting_app_865_2024/util/themes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  // This widget is the root of your application.
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var fieldImage = Image.asset('images/field.png');
  bool flipped = false;

  void updateRobotPosition(newValue) {
    setState(() {
      ScoutingAppState.robotPosition = newValue!;
    });
  }

  void clear() {
    bool isConfirmed = false;
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: const Text('Confirm'),
              content: const Text(
                  'Are you sure you want to change the robot position? This will clear all data except your name.'),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, 'Cancel'),
                  child: const Text('Cancel'),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context, 'OK');
                      setState(() {
                        isConfirmed = true;
                      });

                      if (isConfirmed) {
                        ScoutingAppState.reset(true);
                      }
                    },
                    child: const Text('OK'))
              ]);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Home',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: lightTheme.colorScheme.primary,
        ),
        body: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
              //does not use the custom text field widget because that widget does not work
              const Text('Scouter Name'),
              SizedBox(
                  width: 300,
                  child: TextFormField(
                      controller: ScoutingAppState.nameController)),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text('Team Number'),
                        SizedBox(
                            width: 50,
                            child: TextFormField(
                                controller: ScoutingAppState.teamController,
                                keyboardType: TextInputType.number))
                      ]),
                  const SizedBox(width: 50),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text('Match Number'),
                        SizedBox(
                            width: 50,
                            child: TextFormField(
                                controller: ScoutingAppState.matchController,
                                keyboardType: TextInputType.number))
                      ]),
                ],
              ),

              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text('Robot Position'),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: RadioButton(
                    text1: 'Blue 1',
                    text2: 'Red 1',
                    text3: 'Blue 2',
                    text4: 'Red 2',
                    text5: 'Blue 3',
                    text6: 'Red 3',
                    buttonValue: ScoutingAppState.robotPosition,
                    changeState: updateRobotPosition),
              ),
              ElevatedButton(onPressed: clear, child: const Text("Clear data")),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                        width: 200,
                        child: CheckmarkButton(
                            isChecked: flipped,
                            changeState: (value) {
                              setState(() {
                                ScoutingAppState.processEasterEgg2();
                                if (value != null) {
                                  flipped = value;
                                }
                                if (flipped) {
                                  fieldImage =
                                      Image.asset("images/field_flipped.png");
                                } else {
                                  fieldImage = Image.asset("images/field.png");
                                }
                              });
                            },
                            checkboxTitle: 'Flip field',
                            checkboxSubtitle: ''))
                  ]),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: fieldImage,
              )
            ])));
  }
}
