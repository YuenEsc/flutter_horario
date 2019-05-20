import 'package:flutter/material.dart';
import 'package:flutter_horario/models/colors.dart';

class InputContainer extends StatelessWidget{
  final Widget child;

  InputContainer({Key key, this.child}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 0),
      padding: EdgeInsets.only(left: 6),
      decoration: new BoxDecoration(
        shape: BoxShape.rectangle,
        color: charcoal,
      ),
      child: child,
    );
  }
}