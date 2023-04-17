import 'package:flutter/material.dart';

class DraggableObject extends StatefulWidget {
  final int numberValue;
  final bool isDragged;
  const DraggableObject(this.numberValue, this.isDragged, {Key? key}) : super(key: key);

  @override
  State<DraggableObject> createState() => _DraggableObjectState();
}

class _DraggableObjectState extends State<DraggableObject> {

  Color color = Colors.pink.shade400;

  @override
  Widget build(BuildContext context) {
    return widget.isDragged ? Container(): Padding(padding: const EdgeInsets.all(12),
      child:  Draggable(
        data: widget.numberValue,
        feedback: Container(
          height: 150,
          width: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color: color,
          ),
          alignment: Alignment.center,
          child: Text(widget.numberValue.toString(), style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black,
              decoration: TextDecoration.none),),
        ),
        childWhenDragging: Container(
          height: 150,
          width: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color: Colors.grey.shade400,
          ),
        ),
        child: Container(
          height: 150,
          width: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color: color,
          ),
          alignment: Alignment.center,
          child: Text(widget.numberValue.toString(), style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
        ),
      ),);
  }
}