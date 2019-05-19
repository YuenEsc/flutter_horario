import 'package:flutter/material.dart';

import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_horario/actions/actions.dart';
import 'package:flutter_horario/state/state.dart';

import 'package:flutter_horario/widgets/edit_view.dart';
import 'package:flutter_horario/widgets/edit_form.dart';
import 'package:community_material_icon/community_material_icon.dart';

class EditPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: StoreBuilder<AppState>(
          builder: (context, store){
            return IconButton(
                icon: Icon(CommunityMaterialIcons.close),
                onPressed: (){
                  if(store.state.formCourseId == null){
                    store.dispatch(ResetSelectValueFormLessonAction());
                  }
                  else{
                    store.dispatch(UpdateFormLessonsAction(updatedLessons: store.state.lessons));
                    store.dispatch(ResetSelectValueFormLessonAction());
                  }
                  Navigator.pop(context);
                }
            );
          },
        ),
        title: Text(
          "Editar curso",
          style:  Theme.of(context).textTheme.title,
        ),
        elevation: 0,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: EditView()
          ),
          Expanded(
            flex: 1,
            child: EditForm(),
          )
        ],
      ),
    );
  }
}

typedef OnCloseCallback = Function();
