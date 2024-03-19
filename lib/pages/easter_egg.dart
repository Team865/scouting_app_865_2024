import 'package:flutter/material.dart';
import 'package:scouting_app_865_2024/util/gsheets.dart';
import 'package:scouting_app_865_2024/util/state.dart';
import 'package:scouting_app_865_2024/util/themes.dart';

class EasterEggPage extends StatefulWidget {
  const EasterEggPage({super.key});

  @override
  State<EasterEggPage> createState() => _EasterEggState();
}

class _EasterEggState extends State<EasterEggPage> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "EasterEgg (only for leadership, don't mess with this page)",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: lightTheme.colorScheme.primary,
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
            child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 30.0),
                    child: Text(
                        "Nothing needed here yet, but this page exists as an easter egg I guess"),
                  ),
                ),
                Center(
                    child: Column(
                  children: <Widget>[
                    Row(children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                        child: Image.asset(
                            "images/tej2o1-01_d-joe_franzen-easter-egg-1.webp",
                            width: 400,
                            height: 400),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                        child: Image.asset(
                            "images/tej2o1-01_d-joe_franzen-easter-egg-2.webp",
                            width: 400,
                            height: 400),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                        child: Image.asset(
                            "images/tej2o1-01_d-joe_franzen-easter-egg-3.webp",
                            width: 400,
                            height: 400),
                      ),
                    ]),
                    Row(children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                        child: Image.asset(
                            "images/tej2o1-01_d-joe_franzen-easter-egg-4.webp",
                            width: 400,
                            height: 400),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                        child: Image.asset(
                            "images/tej2o1-01_d-joe_franzen-easter-egg-5.jpg",
                            width: 400,
                            height: 400),
                      ),
                    ])
                  ],
                )),
              ]),
        )));
  }
}
