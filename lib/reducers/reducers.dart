import 'package:redux/redux.dart';
import 'package:flutter_horario/state/state.dart';
import 'package:flutter_horario/models/course.dart';
import 'package:flutter_horario/models/lesson.dart';
import 'package:flutter_horario/actions/actions.dart';

AppState appReducer(AppState state, action) =>
    AppState(
        coursesReducer(state.courses, action),
        lessonsReducer(state.lessons, action),
        formLessonsReducer(state.formLessons, action),
        formColorReducer(state.formColor, action),
        formCourseId(state.formCourseId, action),
    );

final Reducer<List<Course>> coursesReducer = combineReducers([
  TypedReducer<List<Course> , AddCourseAction>(_addCourse),
  TypedReducer<List<Course>, RemoveCourseAction>(_removeCourse),
  TypedReducer<List<Course>, UpdateCourseAction>(_updateCourse),
]);

List<Course> _removeCourse(List<Course> courses, RemoveCourseAction action) =>
    List.unmodifiable(List.from(courses)..remove(action.course));

List<Course> _addCourse(List<Course> courses, AddCourseAction action){
  return  List.unmodifiable(List.from(courses)..add(action.course));
}

List<Course> _updateCourse(List<Course> courses, UpdateCourseAction action){
  List<Course> newCourses = List.from(courses);
  for(int i = 0; i < newCourses.length; i++){
    if(newCourses[i].id == action.courseId ){
      newCourses[i] = action.course;
    }
  }
  return List.unmodifiable(newCourses);
}


final Reducer<List<Lesson>> lessonsReducer = combineReducers([
  TypedReducer<List<Lesson> , UpdateLessonsAction>(_updateLessons),
  TypedReducer<List<Lesson> , RemoveCourseFromLessonsAction>(_removeCourseFromLessons),
]);

List<Lesson> _updateLessons(List<Lesson> lessons, UpdateLessonsAction action){
  List newLessons = List.from(lessons);
  for(int i = 0; i < action.selectedLessons.length; i++){
    if(!action.selectedLessons[i].isNotSelected){
      newLessons[i].course = action.course;
      newLessons[i].courseId = action.courseId;
    }
    if(action.selectedLessons[i].isNotSelected && newLessons[i].courseId == action.courseId){
      newLessons[i].course = null;
      newLessons[i].courseId = null;
    }
  }
  return List.unmodifiable(newLessons);
}

List<Lesson> _removeCourseFromLessons(List<Lesson> lessons, RemoveCourseFromLessonsAction action){
  List newLessons = List.from(lessons);
  for(int i = 0; i < newLessons.length; i++){
    if(newLessons[i].courseId == action.courseId){
      newLessons[i] = Lesson(lessonId: i, selected: false);
    }
  }
  return List.unmodifiable(newLessons);
}

final Reducer<List<Lesson>> formLessonsReducer = combineReducers([
  TypedReducer<List<Lesson> , ToggleSelectValueFormLessonAction>(_toggleSelectValueFormLesson),
  TypedReducer<List<Lesson>, ResetSelectValueFormLessonAction>(_resetSelectValueFormLesson),
  TypedReducer<List<Lesson>, UpdateFormLessonsAction>(_updateFormLessons),
  TypedReducer<List<Lesson>, SetSelectFormLessonsAction>(_setSelectFormLessonsAction)
]);

List<Lesson> _toggleSelectValueFormLesson(List<Lesson> formLessons, ToggleSelectValueFormLessonAction action) {
  List newLessons = List.from(formLessons);
  newLessons[action.lessonFormIndex].selected = !formLessons[action.lessonFormIndex].selected;
  return List.unmodifiable(newLessons);
}

List<Lesson> _resetSelectValueFormLesson(List<Lesson> formLessons, ResetSelectValueFormLessonAction action){
  List newLessons = List.from(formLessons);
  newLessons.forEach( ( newLesson){
    newLesson.selected = false;
  });

  return List.unmodifiable(newLessons);
}

List<Lesson> _updateFormLessons(List<Lesson> formLessons, UpdateFormLessonsAction action){
  List newLessons = List.from(action.updatedLessons);
  return List.unmodifiable(newLessons);
}

List<Lesson> _setSelectFormLessonsAction(List<Lesson> formLessons, SetSelectFormLessonsAction action){
  List<Lesson> newFormLessons = List.from(formLessons);
  for(int i = 0; i < newFormLessons.length;i++){
    if(newFormLessons[i].courseId == action.courseId){
      newFormLessons[i] = Lesson(
        lessonId: i,
        courseId: null,
        course: null,
        selected: true,
      );
    }
  }
  return List.unmodifiable(newFormLessons);
}

final Reducer<int> formColorReducer = combineReducers([
  TypedReducer<int, SetFormColorAction>(_setFormColor),
]);

int _setFormColor(int formColor, SetFormColorAction action) =>
    action.newColor;

final Reducer<String> formCourseId = combineReducers([
  TypedReducer<String, SetFormCourseIdAction>(_setFormCourseId),
]);

String _setFormCourseId(String courseId, SetFormCourseIdAction action)=>
    action.newCourseId;