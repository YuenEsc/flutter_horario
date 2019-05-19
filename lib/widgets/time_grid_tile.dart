import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class TimeGridTile extends StatelessWidget{

  final int time;

  TimeGridTile(this.time);

  @override
  Widget build(BuildContext context){
    return Card(
        margin: EdgeInsets.all(2.0),
        color: Colors.white54,
        child:  Container(
          child: Center(
            child: GridTile(
              child: AutoSizeText(time.toString(),
                style: Theme.of(context).textTheme.copyWith(
                  title: TextStyle(
                    fontFamily: 'Manrope',
                    fontWeight: FontWeight.w600,
                    fontSize: 16
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