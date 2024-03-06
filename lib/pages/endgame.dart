import 'package:flutter/material.dart';

import 'package:scouting_app_865_2024/components/score_counter.dart';
import 'package:scouting_app_865_2024/state.dart';
import 'package:scouting_app_865_2024/components/checkmark-button.dart';

class EndgamePage extends StatefulWidget {
  @override
  State<EndgamePage> createState() => _EndgamePageState();
}

class _EndgamePageState extends State<EndgamePage> {
  ScoutingAppState state =
      ScoutingAppState(); // Creating an instance of the state

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Endgame Page'),
      ),
      body: Column(
        children: [
          CheckboxListTile(
            title: Text('Climb'),
            value: ScoutingAppState.climb,
            onChanged: (bool? value) {
              setState(() {
                ScoutingAppState.climb = value!;
              });
            },
          ),
          CheckboxListTile(
            title: Text('Park'),
            value: ScoutingAppState.park,
            onChanged: (bool? value) {
              setState(() {
                ScoutingAppState.park = value!;
              });
            },
          ),
          CheckboxListTile(
            title: Text('Trap'),
            value: ScoutingAppState.trap,
            onChanged: (bool? value) {
              setState(() {
                ScoutingAppState.trap = value!;
              });
            },
          ),
        ],
      ),
    );
  }
}
