import 'package:flutter/material.dart';

import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_horario/actions/actions.dart';
import 'package:flutter_horario/state/state.dart';

import 'package:flutter_horario/widgets/week_view.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter_horario/widgets/course_list_tile.dart';
import 'package:flutter_horario/screens/edit_page.dart';

import 'package:flutter_horario/models/colors.dart';
class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: independence,
      appBar: AppBar(
        title: Text(
          'Flutter Horario',
          style:  Theme.of(context).textTheme.title,
        ),
        elevation: 0,
        actions: <Widget>[
          StoreBuilder<AppState>(
            builder: (context, store){
              return IconButton(
                icon: Icon(
                    CommunityMaterialIcons.pen_plus,
                    color: maximumBlueGreen
                ),
                onPressed: () {
                  store.dispatch(SetFormColorAction(mandarin.value));
                  store.dispatch(SetFormCourseIdAction(null));
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EditPage()),
                  );
                },
              );
            },
          ),
          IconButton(
            icon: Icon(
                CommunityMaterialIcons.book_multiple,
                color: maximumBlueGreen),
            onPressed: () {
              showCoursesList(context);
            },
          ),
        ],
      ),
      body: WeekView(),
    );
  }
}

Future<void> showCoursesList(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          'Selecciona un curso para editarlo',
        ),
        backgroundColor: independence,
        content: SingleChildScrollView(
          child: StoreConnector<AppState, List<CourseListTile>>(
            converter: (store) => store.state.courses.map((course) => CourseListTile(course)).toList(),
            builder: (context, courses){
              return ListBody(
                children: courses,
              );
            }
          ),
        ),
        actions: <Widget>[
          RaisedButton(
            color: fieryRose,
            child: Text("CERRAR",
              style: Theme.of(context).textTheme.copyWith(button: TextStyle(
                color: Colors.white,
              )).button,
            ),
            onPressed: (){
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

typedef OnResetColorCallback = Function();
