import 'package:flutter/material.dart';

import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_horario/state/state.dart';
import 'package:flutter_horario/models/lesson.dart';

import 'package:flutter_horario/widgets/week_view_header_delegate.dart';
import 'package:flutter_horario/widgets/lesson_grid_tile.dart';
import 'package:flutter_horario/widgets/time_grid_tile.dart';
import 'package:flutter_horario/widgets/empty_grid_tile.dart';

class WeekView extends StatelessWidget {

  static const hourHeight = 100.0;
  int time = 0;
  int lessonsIndex = 0;
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, List<Lesson>>(
      onWillChange: (List<Lesson> lessons){
        time = 0;
        lessonsIndex = 0;
      },
      converter: (store)=>store.state.lessons,
      builder: (context, lessons){
        return CustomScrollView(
          slivers: <Widget>[
            SliverPersistentHeader(
              delegate: WeekViewHeaderDelegate(),
              pinned: true,
              floating: false,
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
                    else if(!lessons[lessonsIndex].isEmpty ){
                      return LessonGridTile(lesson: lessons[lessonsIndex++]);
                    }
                    else{
                      lessonsIndex++;
                      return EmptyGridTile();
                    }
                  },
                  childCount: lessons.length,
                ),
              ),
            )
          ],
        );
      },
    );
  }

}