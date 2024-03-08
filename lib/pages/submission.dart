import 'package:flutter/material.dart';
import 'package:scouting_app_865_2024/util/gsheets.dart';
import 'package:scouting_app_865_2024/util/state.dart';

class SubmissionPage extends StatelessWidget {
  const SubmissionPage({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            Container(
                width: 200,
                child: ElevatedButton(
                    onPressed: () {
                      var succeeded = GSheetsUtil.addRow(ScoutingAppState.getData());
                    },
                    child: const Text("Send Data")))
          ])
        ]);
  }
}
