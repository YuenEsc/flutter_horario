import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_horario/models/colors.dart';

class TimeGridTile extends StatelessWidget{

  final int time;

  TimeGridTile(this.time);

  @override
  Widget build(BuildContext context){
    return Card(
        margin: EdgeInsets.all(2.0),
        color: maximumBlueGreen,
        child:  Container(
          child: Center(
            child: GridTile(
              child: AutoSizeText(time.toString(),
                style: Theme.of(context).textTheme.copyWith(
                  title: TextStyle(
                    fontFamily: 'Manrope',
                    fontWeight: FontWeight.w800,
                    fontSize: 16,
                    color: Colors.white
                  )
                ).title,
                maxLines: 3
              ),
            ),
          )
        )
    );
  }
}