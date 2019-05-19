import 'package:flutter/material.dart';
import 'package:flutter_horario/models/lesson.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flushbar/flushbar.dart';

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
              message: lesson.course.professor,
              backgroundColor: Color(0xFF171b21),
              icon: Icon(
                Icons.info_outline,
                size: 28.0,
                color: Color(0xAA5d66ea),
              ),
              duration: Duration(seconds: 3),
              leftBarIndicatorColor: Color(0xAA5d66ea),
            )..show(context);
          },
          child: Center(
            child: GridTile(
              child: AutoSizeText(
                lesson.course.subject,
                style: Theme.of(context).textTheme.copyWith(
                    title: TextStyle(
                        fontFamily: 'Manrope',
                        fontWeight: FontWeight.w600,
                        fontSize: 16
                    )
                ).title,
                textAlign: TextAlign.center,
              )
            )
          )
        )
      )
    );
  }
}