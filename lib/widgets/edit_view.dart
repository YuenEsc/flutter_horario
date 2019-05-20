import 'package:flutter/material.dart';

import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_horario/state/state.dart';
import 'package:flutter_horario/models/lesson.dart';

import 'package:flutter_horario/widgets/week_view_header_delegate.dart';
import 'package:flutter_horario/widgets/form_lesson_grid_tile.dart';
import 'package:flutter_horario/widgets/time_grid_tile.dart';
import 'package:flutter_horario/widgets/empty_grid_tile.dart';
import 'package:flutter_horario/models/colors.dart';

class EditView extends StatelessWidget {

  static const hourHeight = 100.0;
  int time = 0;
  int lessonsIndex = 0;
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, List<Lesson>>(
      onWillChange: (List<Lesson> formLessons){
        time = 0;
        lessonsIndex = 0;
      },
      converter: (store)=>store.state.formLessons,
      builder: (context, formLessons){
        return CustomScrollView(
          slivers: <Widget>[
            SliverPersistentHeader(
              delegate: WeekViewHeaderDelegate(),
              pinned: true,
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 2.0, vertical: 5.0),
              sliver: SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 6,
                  mainAxisSpacing: 2.0,
                  crossAxisSpacing: 2.0,
                  childAspectRatio: .6666666,
                ),
                delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                    if(index % 6 == 0){
                      time=time+1;
                      return TimeGridTile(time);
                    }
                    else if(formLessons[lessonsIndex].isEmpty){
                      return FormLessonGridTile(lesson: formLessons[lessonsIndex++]);
                    }
                    else{
                      lessonsIndex++;
                      return EmptyGridTile(backgroundColor: charcoal,);
                    }
                  },
                  childCount: formLessons.length,
                ),
              ),
            )
          ],
        );
      },
    );
  }

}