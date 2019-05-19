import 'package:flutter/material.dart';

class DayTile extends StatelessWidget{
  final String text;

  DayTile(this.text);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.body2
        ),
        decoration: BoxDecoration(color: Color(0x171b21)),
      ),
    );
  }
}