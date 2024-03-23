import 'package:flutter/material.dart';
import 'package:scouting_app_865_2024/util/gsheets.dart';
import 'package:scouting_app_865_2024/util/state.dart';
import 'package:scouting_app_865_2024/util/themes.dart';

class EasterEgg2Page extends StatefulWidget {
  const EasterEgg2Page({super.key});

  @override
  State<EasterEgg2Page> createState() => _EasterEgg2State();
}

class _EasterEgg2State extends State<EasterEgg2Page> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Easter Egg 2",
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
                Center(
                    child: Column(
                  children: <Widget>[
                    Row(children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                        child: Image.asset(
                            "images/wang.jpg",
                            width: 400,
                            height: 400),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                        child: Image.asset(
                            "images/hibbert.jpg",
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
