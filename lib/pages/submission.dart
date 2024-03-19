import 'package:flutter/material.dart';
import 'package:scouting_app_865_2024/util/gsheets.dart';
import 'package:scouting_app_865_2024/util/state.dart';
import 'package:scouting_app_865_2024/util/themes.dart';

class SubmissionPage extends StatefulWidget {
  const SubmissionPage({super.key});

  @override
  State<SubmissionPage> createState() => _SubmissionState();
}

class _SubmissionState extends State<SubmissionPage> {
  void sendData() {
    bool isConfirmed = false;
    String easterEgg = ScoutingAppState.foundEasterEgg ? " (you found the easter egg!)" : "";
    showDialog(
        context: context,
        builder: (BuildContext context) {
          if (ScoutingAppState.dataInvalid()) {
            return AlertDialog(
                title: const Text('Missing fields'),
                content: Text("You're missing something, make sure you filled every field$easterEgg"),
                actions: <Widget>[
                  TextButton(
                      onPressed: () => Navigator.pop(context, 'OK'),
                      child: const Text('OK'))
                ]);
          } else {
            return AlertDialog(
                title: const Text('Confirm'),
                content: Text('Are you sure you want to send the data$easterEgg?'),
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
                          GSheetsUtil.addRow(ScoutingAppState.getData());
                        }
                      },
                      child: const Text('OK'))
                ]);
          }
        });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Submission',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: lightTheme.colorScheme.primary,
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Comments'),
            SizedBox(
                width: 350,
                child: TextFormField(
                    controller: ScoutingAppState.commentsController,
                    keyboardType: TextInputType.text)),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: ElevatedButton(
                    onPressed: () {
                      sendData();
                    },
                    child: const Text("Send Data")),
              ),
            ),
          ]),
    );
  }
}
