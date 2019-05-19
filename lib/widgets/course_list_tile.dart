import 'package:flutter/material.dart';

import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_horario/actions/actions.dart';
import 'package:flutter_horario/state/state.dart';
import 'package:flutter_horario/models/course.dart';

import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter_horario/screens/edit_page.dart';

class CourseListTile extends StatefulWidget{
  final Course course;

  CourseListTile(this.course);

  @override
  _CourseListTileState createState() => _CourseListTileState();
}

class _CourseListTileState extends State<CourseListTile>{
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 1.0),
      child: StoreBuilder<AppState>(
          builder: (context, store){
            return ListTile(
                title: Text(widget.course.subject,
                  style: Theme.of(context).textTheme.subhead,
                ),
                subtitle: Text(widget.course.professor),
                trailing: IconButton(
                    icon: Icon(CommunityMaterialIcons.trash_can) ,
                    onPressed: (){
                      store.dispatch(RemoveCourseFromLessonsAction(courseId: widget.course.id));
                      store.dispatch(UpdateFormLessonsAction(updatedLessons: store.state.lessons));
                      store.dispatch(RemoveCourseAction(widget.course));
                    }
                ),
                onTap: (){
                  store.dispatch(SetSelectFormLessonsAction(courseId: widget.course.id));
                  store.dispatch(SetFormColorAction(widget.course.color));
                  store.dispatch(SetFormCourseIdAction(widget.course.id));
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EditPage()),
                  );
                }
            );
          }
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.0),
        color: Color(widget.course.color),
      )
    );
  }
}