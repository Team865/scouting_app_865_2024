import 'package:flutter/material.dart';
import 'package:scouting_app_865_2024/util/gsheets.dart';
import 'package:scouting_app_865_2024/util/themes.dart';
import 'package:scouting_app_865_2024/util/state.dart';

void main() {
  GSheetsUtil.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {  
  const MyApp({super.key});

  // This widget is the root of your application
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
      home: const ScoutingApp()
    );
  }
}

class ScoutingApp extends StatefulWidget {
  const ScoutingApp({super.key});

  @override
  State<ScoutingApp> createState() => ScoutingAppState();
}