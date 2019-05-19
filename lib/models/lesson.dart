import 'package:flutter_horario/models/course.dart';

class Lesson {
  String courseId;
  int lessonId;
  Course course;
  bool selected = false;
  static int color;

  Lesson({this.lessonId, this.courseId, this.course, this.selected});

  factory Lesson.fromJson(Map<String, dynamic> parsedJson){
    if(parsedJson != null){
      return Lesson(
        courseId : parsedJson['courseId'] != null ? parsedJson['courseId'] : null,
        lessonId : parsedJson['lessonId'] != null ? parsedJson['lessonId'] : null,
        course :   parsedJson['course'] != null ? Course.fromJson(parsedJson['course']) : null,
        selected : parsedJson['selected'] != null ? parsedJson['selected'] == 'true' : false,
      );
    }else{
      return Lesson();
    }
  }

  bool get isEmpty{
    return courseId == null && course == null;
  }

  bool get isNotSelected{
    return !selected;
  }

  // ! Add toJson serializer
  dynamic toJson() =>
    {
      'courseId': courseId,
      'lessonId': lessonId,
      'course': course,
      'selected': selected,
    };

  @override
  String toString(){
    if(course == null){
      return 'NULL LESSON\n';
    }
    return 'courseId $courseId\n'+
      'lessonId $lessonId\n'+
      'course $course\n'+
      'selected $selected\n'+
      '____________________\n';
  }
}