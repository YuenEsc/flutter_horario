import 'package:flutter/material.dart';

import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_horario/actions/actions.dart';
import 'package:flutter_horario/state/state.dart';
import 'package:flutter_horario/models/course.dart';
import 'package:flutter_horario/models/lesson.dart';

import 'package:flutter_horario/widgets/color_form_picker.dart';
import 'package:community_material_icon/community_material_icon.dart';


class EditForm extends StatefulWidget{

  @override
  _EditFormState createState() => _EditFormState();
}

class _EditFormState extends State<EditForm>{

  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  Course _formCourse = Course.form();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        key: _formKey,
        child: Row(
          children: <Widget>[
            StoreBuilder<AppState>(
              builder: (context, store){
                return  ColorFormPicker(
                    onSaved: (Color color){
                      _formCourse.color = color.value;
                    },
                    initialValue: Color(store.state.formColor),
                    onColorChange: (Color color){
                      store.dispatch(SetFormColorAction(color.value));
                    },
                );
              },
            ),
            StoreBuilder<AppState>(
              builder: (context, store){
                List<Course> courses = List.from(store.state.courses);
                Course editCourse;
                if(store.state.formCourseId != null){
                  editCourse = courses.singleWhere((course)=>course.id == store.state.formCourseId);
                  _formCourse.id = store.state.formCourseId;
                }
                return Flexible(
                    child:  ListView(
                      children: <Widget>[
                        ListTile(
                          leading: const Icon(CommunityMaterialIcons.notebook),
                          title: new TextFormField(
                            initialValue: editCourse != null ? editCourse.subject : null,
                            decoration: new InputDecoration(
                              hintText: "Materia",
                            ),
                            validator: (value){
                              if(value.isEmpty){
                                return 'Ingresa la materia';
                              }
                            },
                            onSaved: (value){
                              setState((){
                                _formCourse.subject = value;
                              });
                            },
                          ),
                        ),
                        ListTile(
                          leading: const Icon(CommunityMaterialIcons.teach),
                          title: new TextFormField(
                            initialValue: editCourse != null ? editCourse.professor : null,
                            decoration: new InputDecoration(
                              hintText: "Profesor",
                            ),
                            validator: (value){
                              if(value.isEmpty){
                                return 'Ingresa el nombre del profesor';
                              }
                            },
                            onSaved: (value){
                              setState((){
                                _formCourse.professor = value;
                              });
                            },
                          ),
                        ),
                        ListTile(
                          leading: const Icon(CommunityMaterialIcons.pound_box),
                          title: new TextFormField(
                            initialValue: editCourse != null ? editCourse.room : null,
                            decoration: new InputDecoration(
                              hintText: "Salón",
                            ),
                            onSaved: (value){
                              setState((){
                                _formCourse.room = value;
                              });
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 10.0),
                          child: StoreBuilder<AppState>(
                              builder: (context, store){
                                return RaisedButton(
                                  onPressed: () {
                                    _formKey.currentState.save();
                                    if (_formKey.currentState.validate()) {
                                      if(store.state.formCourseId == null){
                                        store.dispatch(AddCourseAction(_formCourse));
                                      }else{
                                        store.dispatch(UpdateCourseAction(
                                          courseId: store.state.formCourseId,
                                          course: _formCourse,
                                        ));
                                      }
                                      List<Lesson> selectedLessons = List.from(store.state.formLessons);
                                      store.dispatch(UpdateLessonsAction(
                                        selectedLessons: selectedLessons,
                                        courseId: _formCourse.id,
                                        course: _formCourse,
                                      ));
                                      store.dispatch(UpdateFormLessonsAction( updatedLessons: store.state.lessons));
                                      store.dispatch(ResetSelectValueFormLessonAction());
                                      Navigator.of(context).pop();
                                    }
                                  },
                                  child: Text('Guardar curso'),
                                );
                              }
                          ),
                        ),
                      ],
                    )
                );
              }
            )
          ],
        ),
      )
    );
  }
}

typedef OnCourseAddedCallback = Function(Course course);
typedef OnColorChangedCallback = Function(int color);