import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:scouting_app_865_2024/themes/light_theme.dart';
import 'package:scouting_app_865_2024/widgets/score_counter.dart';
import 'package:scouting_app_865_2024/state.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child:MaterialApp(
        title: '',
        theme: lightTheme,
        home: const MainApp()
      )
    );
  }
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {

    return Builder(builder: (context) {
      return LayoutBuilder(builder: (context, constraints) {
        return SafeArea(
          child: Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                /*
                FOR TESTING ONLY
                
                ScoreCounter(
                  scoreCounter: context.watch<MyAppState>().scoreCounter1,
                    changeValue: context.watch<MyAppState>().changeValue1,
                  scoreCounterController: context.watch<MyAppState>().scoreCounterController1
                )
                */
              ],
            )
          )
        );
      });
    });
  }
}
