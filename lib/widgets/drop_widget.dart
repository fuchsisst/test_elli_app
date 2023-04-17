import 'package:flutter/material.dart';

class DropWidget extends StatefulWidget {
  final bool startState;
  final Function(bool) stateChanged;
  final String numberWord;
  final Map<String, int> value;
  const DropWidget(
      {required this.numberWord,
      required this.value,
      required this.startState,
      required this.stateChanged,
      Key? key})
      : super(key: key);

  @override
  State<DropWidget> createState() => DropWidgetState();
}

class DropWidgetState extends State<DropWidget> {
  Color color = Colors.blue;
  late String _currentNumberWord;
  bool isCompleted = false;


  @override
  void initState() {
    super.initState();
    _currentNumberWord = widget.numberWord;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: DragTarget(
        builder: (BuildContext context, List<dynamic> acceptedData,
            List<dynamic> rejectData) {
          return Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18), color: color),
            alignment: Alignment.center,
            child: Text(
              _currentNumberWord,
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          );
        },
        onAccept: (numberValue) {
          if (!isCompleted) {
            if (widget.value[widget.numberWord] == numberValue) {
              color = Colors.green;
              _currentNumberWord = numberValue.toString();
              isCompleted = true;
              widget.stateChanged(!widget.startState);
            } else {
              color = Colors.redAccent;
              Future.delayed(const Duration(milliseconds: 300), () {
                setState(() {
                  color = Colors.blue;
                });
              });
            }
          }
        },
      ),
    );
  }
}
