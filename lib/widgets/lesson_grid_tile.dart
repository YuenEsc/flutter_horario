import 'package:flutter/material.dart';
import 'package:flutter_horario/models/lesson.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter_horario/models/colors.dart';

class LessonGridTile extends StatelessWidget{

  final Lesson lesson;
  final bool empty = false;

  LessonGridTile({this.lesson});

  @override
  Widget build(BuildContext context){
    return Card(
      color: Color(lesson.course.color),
      margin: EdgeInsets.all(2.0),
      child: Container(
        child: InkWell(
          onTap: (){

          },
          onDoubleTap: (){
            Flushbar(
              title: lesson.course.subject,
              message: "Profesor: " + lesson.course.professor + "\nSalón:"+lesson.course.room ?? 'Sin definir',
              backgroundColor: charcoal,
              icon: Icon(
                Icons.info_outline,
                size: 28.0,
                color: maximumBlueGreen,
              ),
              duration: Duration(seconds: 3),
              leftBarIndicatorColor: maximumBlueGreen,
            )..show(context);
          },
          child: Center(
            child: GridTile(
              child: SizedBox.expand(
                child: Center(
                  child: AutoSizeText(
                    lesson.course.subject,
                    style: Theme.of(context).textTheme.copyWith(
                        title: TextStyle(
                            fontFamily: 'Manrope',
                            fontWeight: FontWeight.w600,
                            fontSize: 16
                        ),
                    ).title,
                    maxFontSize: 32,
                    minFontSize: 10,
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            )
          )
        )
      )
    );
  }
}