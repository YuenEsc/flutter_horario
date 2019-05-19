import 'package:flutter_horario/models/course.dart';
import 'package:flutter_horario/models/lesson.dart';
import 'package:flutter/material.dart';

class AppState {
  static final int daysOfTheWeek = 5;
  static final int columns = 7;

  final List<Course> courses;
  final List<Lesson> lessons;
  final List<Lesson> formLessons;
  final int formColor;
  final String formCourseId;

  AppState(this.courses, this.lessons, this.formLessons, this.formColor, this.formCourseId);

  factory AppState.initial() {
    List<Lesson> newLessons = [];
    for(int i = 0; i < (daysOfTheWeek + 1) * columns; i++){
      newLessons.add(Lesson(lessonId: i, selected: false));
    }
    List formNewLessons = List.from(newLessons);
    return AppState(
        List.unmodifiable([]),
        List.unmodifiable(newLessons),
        List.unmodifiable(formNewLessons),
        Colors.red.value,
        null
    );
  }

  static AppState fromJson(dynamic parsedJson) {
    if(parsedJson != null){
      var coursesJson = parsedJson['courses'] != null ? parsedJson['courses'] as List : [];
      List<Course> courses = coursesJson.map((i) => Course.fromJson(i)).toList();
      var lessonsJson = parsedJson['lessons'] != null ? parsedJson['lessons'] as List : [];
      List<Lesson> lessons = lessonsJson.map((i) => Lesson.fromJson(i)).toList();
      var formLessonsJson = parsedJson['formlessons'] != null ? parsedJson['formlessons'] as List : [];
      List<Lesson> formLessons = formLessonsJson.map((i)=> Lesson.fromJson(i)).toList();
      return AppState( courses, lessons, formLessons, Colors.red.value, null );
    }
    else{
      return AppState.initial();
    }
  }

  dynamic toJson() => {
    'courses': courses,
    'lessons': lessons,
    'formlessons' : formLessons,
  };
}

