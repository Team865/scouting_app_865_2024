import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:scouting_app_865_2024/components/checkmark_button.dart';
import 'package:scouting_app_865_2024/util/gsheets.dart';
import 'package:scouting_app_865_2024/util/state.dart';
import 'package:scouting_app_865_2024/util/themes.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class SubmissionPage extends StatefulWidget {
  const SubmissionPage({super.key});

  @override
  State<SubmissionPage> createState() => _SubmissionState();
}

class _SubmissionState extends State<SubmissionPage> {
  final qrData = ValueNotifier("");
  final showScanner = ValueNotifier(false);

  void sendData(List<dynamic> data) {
    bool isConfirmed = false;
    int easterEggs = data[data.length -
        ScoutingAppState.numberOfEasterEggs -
        1]; // TODO: bounds checking
    String easterEgg =
        easterEggs > 0 ? " (you found $easterEggs easter egg(s)!)" : "";
    showDialog(
        context: context,
        builder: (BuildContext context) {
          if (ScoutingAppState.dataInvalid(data)) {
            return AlertDialog(
                title: const Text('Missing fields'),
                content: Text(
                    "You're missing something, make sure you filled every field$easterEgg"),
                actions: <Widget>[
                  TextButton(
                      onPressed: () => Navigator.pop(context, 'OK'),
                      child: const Text('OK'))
                ]);
          } else {
            return AlertDialog(
                title: const Text('Confirm'),
                content:
                    Text('Are you sure you want to send the data$easterEgg?'),
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
                          GSheetsUtil.addRow(data);
                        }
                      },
                      child: const Text('OK'))
                ]);
          }
        });
  }

  void updateQrCode() {
    qrData.value = json.encode(ScoutingAppState.getData());
    debugPrint("${qrData.value}");
  }

  List<dynamic> parseData(String value) {
    var data = json.decode(value);
    debugPrint("$data");
    if (data is List) {
      return data;
    } else {
      return [];
    }
  }

  Widget getQrCode() {
    return ValueListenableBuilder(
        valueListenable: qrData,
        builder: (context, value, child) {
          if (!ScoutingAppState.dataInvalid(ScoutingAppState.getData())) {
            return QrImageView(
                data: qrData.value,
                version: QrVersions.auto,
                size: 300,
                gapless: false,
                backgroundColor: const Color.fromARGB(255, 255, 255, 255));
          } else {
            return const Text("Press Update QR code when you're done (and any time you change the data)");
          }
        });
  }

  Widget getQrScanner() {
    return SizedBox(
        width: 300,
        height: 300,
        child: MobileScanner(
            controller: MobileScannerController(
              detectionSpeed: DetectionSpeed.noDuplicates,
            ),
            onDetect: (capture) {
              final data = parseData(capture.barcodes[0]
                  .rawValue!); // TODO: if this is an issue, actually iterate to find first thing with signature
              if (data.length > 0) {
                // TODO: make sure it's the right length
                sendData(data);
              }
              showScanner.value = false;
            }));
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
        body: SingleChildScrollView(
          child: Column(
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
                          sendData(ScoutingAppState.getData());
                        },
                        child: const Text("Send Data")),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: ElevatedButton(
                        onPressed: () {
                          updateQrCode();
                        },
                        child: const Text("Update QR code")),
                  ),
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  SizedBox(
                      width: 200,
                      child: CheckmarkButton(
                          isChecked: showScanner.value,
                          changeState: (value) {
                            setState(() {
                              if (value != null) {
                                showScanner.value = value;
                              }
                            });
                          },
                          checkboxTitle: "QR scanner",
                          checkboxSubtitle: ""))
                ]),
                ValueListenableBuilder(
                    valueListenable: showScanner,
                    builder: (context, value, child) {
                      return Center(
                        child: showScanner.value ? getQrScanner() : getQrCode(),
                      );
                    }),
              ]),
        ));
  }
}
