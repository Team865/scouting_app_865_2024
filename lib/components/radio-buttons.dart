import 'package:flutter/material.dart';


class RadioButton extends /*StatefulWidget*/StatelessWidget {
  final String text1;
  final String text2;
  final String text3;
  final String text4;
  final String text5;
  final String text6;
  final String buttonValue;
  final void Function(Object?) changeState;

  const RadioButton({
    super.key,
    required this.text1,
    required this.text2,
    required this.text3,
    required this.text4,
    required this.text5,
    required this.text6,
    required this.buttonValue,
    required this.changeState
    });

  

  /*@override
  // ignore: no_logic_in_create_state
  State<RadioButton> createState() => _RadioButtonState(
    text1: text1,
    text2: text2,
    text3: text3,
    text4: text4,
    text5: text5,
    text6: text6,
    buttonValue: buttonValue,
    changeState: changeState
    );
}

class _RadioButtonState extends State<RadioButton> {
  final String text1;
  final String text2;
  final String text3;
  final String text4;
  final String text5;
  final String text6;
  final String buttonValue;
  final void Function(Object?) changeState;

  _RadioButtonState ({
    required this.text1,
    required this.text2,
    required this.text3,
    required this.text4,
    required this.text5,
    required this.text6,
    required this.buttonValue,
    required this.changeState
  });*/

  

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            Text(text1),
            const SizedBox(width: 8),
            Radio(
              value: text1,
              groupValue: buttonValue,
              onChanged: changeState,
              activeColor: const Color.fromARGB(255, 6, 98, 219),
            ),
            const SizedBox(width: 8),
            Radio(
              value: text2,
              groupValue: buttonValue,
              onChanged: changeState,
              activeColor: const Color.fromARGB(255, 6, 98, 219),
            ),
            const SizedBox(width: 8),
            Text(text2),
          ],
        ),
        Row(
          children: [
            Text(text3),
            const SizedBox(width: 8),
            Radio(
              value: text3,
              groupValue: buttonValue,
              onChanged: changeState,
              activeColor: const Color.fromARGB(255, 6, 98, 219),
            ),
            const SizedBox(width: 8),
            Radio(
              value: text4,
              groupValue: buttonValue,
              onChanged: changeState,
              activeColor: const Color.fromARGB(255, 6, 98, 219),
            ),
            const SizedBox(width: 8),
            Text(text4),
          ],
        ),
        Row(
          children: [
            Text(text5),
            const SizedBox(width: 8),
            Radio(
              value: text5,
              groupValue: buttonValue,
              onChanged: changeState,
              activeColor: const Color.fromARGB(255, 6, 98, 219),
            ),
            const SizedBox(width: 8),
            Radio(
              value: text6,
              groupValue: buttonValue,
              onChanged: changeState,
              activeColor: const Color.fromARGB(255, 6, 98, 219),
            ),
            const SizedBox(width: 8),
            Text(text6),
          ],
        ),
      ],
    );
  }
}
