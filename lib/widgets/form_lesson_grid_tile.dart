import 'package:flutter/material.dart';

import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_horario/actions/actions.dart';
import 'package:flutter_horario/state/state.dart';
import 'package:flutter_horario/models/lesson.dart';

class FormLessonGridTile extends StatelessWidget{

  final Lesson lesson;

  FormLessonGridTile({this.lesson});

  @override
  Widget build(BuildContext context){
    return StoreConnector<AppState, int>(
      converter: (store)=> store.state.formColor,
      builder: (context, formColor){
        return Card(
            margin: EdgeInsets.all(2.0),
            color: lesson.isNotSelected ? Colors.white30 : Color(formColor),
            child: StoreConnector<AppState, OnTileTouchedCallback>(
              converter: (store){
                return (lessonIndex)=>store.dispatch(ToggleSelectValueFormLessonAction(lessonIndex));
              },
              builder: (context, callback){
                return InkWell(
                  borderRadius: BorderRadius.circular(4.0),
                  splashColor: Color(formColor).withAlpha(200),
                  onTap: (){
                    print("lessonId ${lesson.lessonId}");
                    callback(lesson.lessonId);
                  },
                  child: Center(
                    child: SizedBox()
                  )
                );
              },
            )
        );
      },
    );
  }
}

typedef OnTileTouchedCallback = Function(int lessonIndex);

