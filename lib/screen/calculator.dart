
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../componets/display.dart';
import '../componets/keyboard.dart';
import '../model/memory.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<StatefulWidget> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  final Memory memory = Memory();

  _onPressed(String command) {
    setState(() {
      memory.applyCommand(command);
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Column(
        children: [
          Display(
            text: memory.value,
          ),
          Keyboard(
            onPressed: _onPressed,
          ),
        ],
      ),
    );
  }
}