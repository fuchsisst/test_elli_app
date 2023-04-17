import 'package:flutter/material.dart';

import '../widgets/drag_widget.dart';
import '../widgets/drop_widget.dart';

class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  Map<String, int> numbers = {'One': 1, 'Two': 2};
  List<bool> stateOfWidget = [false, false];

  void _handleState1(bool stateChange) {
    setState(() {
      stateOfWidget[0] = stateChange;
    });
  }

  void _handleState2(bool stateChange) {
    setState(() {
      stateOfWidget[1] = stateChange;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Drag & Drop'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              DropWidget(
                  numberWord: 'One',
                  value: numbers,
                  startState: stateOfWidget[0],
                  stateChanged: _handleState1),
              DropWidget(
                  numberWord: 'Two',
                  value: numbers,
                  startState: stateOfWidget[1],
                  stateChanged: _handleState2),
            ],
          ),
          const SizedBox(
            height: 80,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DraggableObject(1, stateOfWidget[0]),
              DraggableObject(2, stateOfWidget[1])
            ],
          )
        ],
      ),
    );
  }
}
