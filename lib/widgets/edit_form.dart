import 'package:flutter/material.dart';

import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_horario/actions/actions.dart';
import 'package:flutter_horario/state/state.dart';
import 'package:flutter_horario/models/course.dart';
import 'package:flutter_horario/models/lesson.dart';

import 'package:flutter_horario/widgets/input_container.dart';
import 'package:flutter_horario/widgets/color_form_picker.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter_horario/models/colors.dart';


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
                      shrinkWrap: true,
                      children: <Widget>[
                        ListTile(
                          contentPadding: EdgeInsets.symmetric(horizontal:16, vertical: 0),
                          dense: true,
                          leading: Icon(
                            CommunityMaterialIcons.notebook,
                            color: maximumBlueGreen,
                          ),
                          title: InputContainer(
                            child: TextFormField(
                              initialValue: editCourse != null ? editCourse.subject : null,
                              style: TextStyle(
                                color: Colors.white,
                              ),
                              decoration: new InputDecoration(
                                contentPadding: EdgeInsets.symmetric(vertical: 2.0),
                                hintText: "Materia",
                                hintStyle: TextStyle(
                                  color: romanSilver,
                                ),
                                errorStyle: TextStyle(
                                    color: fieryRose
                                ),
                                border: InputBorder.none,
                              ),
                              validator: (value){
                                if(value.isEmpty){
                                  return 'Ingresa la materia';
                                }
                                else if(value.length > 20){
                                  return 'No debe ser mayor a 20 caracteres';
                                }
                              },
                              onSaved: (value){
                                setState((){
                                  _formCourse.subject = value;
                                });
                              },
                            ),
                          )
                        ),
                        ListTile(
                          contentPadding: EdgeInsets.symmetric(horizontal:16, vertical: 0),
                          dense: true,
                          leading: Icon(
                              CommunityMaterialIcons.teach,
                              color: maximumBlueGreen,
                          ),
                          title: InputContainer(
                            child: new TextFormField(
                              initialValue: editCourse != null ? editCourse.professor : null,
                              style: TextStyle(
                                color: Colors.white,
                              ),
                              decoration: new InputDecoration(
                                contentPadding: EdgeInsets.symmetric(vertical: 2.0),
                                  hintText: "Profesor",
                                  hintStyle: TextStyle(
                                    color: romanSilver,
                                  ),
                                  errorStyle: TextStyle(
                                    color: fieryRose
                                  ),
                                  border: InputBorder.none,
                              ),
                              validator: (value){
                                if(value.isEmpty){
                                  return 'Ingresa el nombre del profesor';
                                }
                                else if(value.length > 20){
                                  return 'No debe ser mayor a 20 caracteres';
                                }
                              },
                              onSaved: (value){
                                setState((){
                                  _formCourse.professor = value;
                                });
                              },
                            ),
                          ),
                        ),
                        ListTile(
                          contentPadding: EdgeInsets.symmetric(horizontal:16, vertical: 0),
                          dense: true,
                          leading: Icon(
                            CommunityMaterialIcons.pound_box,
                            color: maximumBlueGreen,
                          ),
                          title: InputContainer(
                            child: new TextFormField(
                              initialValue: editCourse != null ? editCourse.room : null,
                              style: TextStyle(
                                color: Colors.white,
                              ),
                              decoration: new InputDecoration(
                                contentPadding: EdgeInsets.symmetric(vertical: 2.0),
                                hintText: "Salón",
                                hintStyle: TextStyle(
                                  color: romanSilver,
                                ),
                                errorStyle: TextStyle(
                                    color: fieryRose
                                ),
                                border: InputBorder.none,
                              ),
                              validator: (value){
                                if(value.length > 8){
                                  return 'No debe exceder 8 caracteres';
                                }
                              },
                              onSaved: (value){
                                setState((){
                                  _formCourse.room = value;
                                });
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 10.0),
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
                                  color: maximumBlueGreen,
                                  child: Text(
                                    'Guardar curso',
                                    style: TextStyle(
                                      color: Colors.white70
                                    )
                                  ),
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