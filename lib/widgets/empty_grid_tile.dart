import 'package:flutter/material.dart';
import 'package:flutter_horario/models/colors.dart';

class EmptyGridTile extends StatelessWidget{

  Color backgroundColor;

  EmptyGridTile({this.backgroundColor});

  @override
  Widget build(BuildContext context){
    return Card(
        margin: EdgeInsets.all(2.0),
        color: backgroundColor ?? Colors.white30,
        child:  Center(
            child: SizedBox(

            )
        )
    );
  }
}