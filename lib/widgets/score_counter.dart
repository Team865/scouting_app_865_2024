  import 'package:flutter/material.dart';

class ScoreCounter extends StatelessWidget {
  int scoreCounter;
  Function changeValue;
  TextEditingController scoreCounterController;

  ScoreCounter({
    super.key,  
    required this.scoreCounter,
    required this.changeValue,
    required this.scoreCounterController
    });  

  @override
  Widget build(BuildContext context) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ElevatedButton.icon(
            onPressed: () {
              changeValue(-1);
            },
            icon: const Icon(Icons.minimize),
            label: const Text('')
          ),
          /*SizedBox(
            width: 50,
            child: TextFormField(controller: scoreCounterController)
          ),*/
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text('$scoreCounter')
          ),
          ElevatedButton.icon(
            onPressed: () {
              changeValue(1);
            },
            icon: const Icon(Icons.add),
            label: const Text('')
          ),
        ]
      );
  } 
}
