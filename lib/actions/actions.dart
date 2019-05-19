import 'package:flutter_horario/models/course.dart';
import 'package:flutter_horario/models/lesson.dart';

class RemoveCourseAction {
  final Course course;

  RemoveCourseAction(this.course);
}

class AddCourseAction {
  final Course course;
  AddCourseAction(this.course);
}

class UpdateCourseAction {
  final String courseId;
  final Course course;
  UpdateCourseAction({this.courseId, this.course});
}

class UpdateLessonsAction{
  final List<Lesson> selectedLessons;
  final String courseId;
  final Course course;
  UpdateLessonsAction({this.selectedLessons, this.courseId, this.course});
}

class RemoveCourseFromLessonsAction{
  final String courseId;
  RemoveCourseFromLessonsAction({this.courseId});
}

class ToggleSelectValueFormLessonAction{
  final int lessonFormIndex;
  ToggleSelectValueFormLessonAction(this.lessonFormIndex);
}

class SetSelectFormLessonsAction{
  final String courseId;
  SetSelectFormLessonsAction({this.courseId});
}

class ResetSelectValueFormLessonAction{
  ResetSelectValueFormLessonAction();
}

class UpdateFormLessonsAction{
  final List<Lesson> updatedLessons;
  UpdateFormLessonsAction({this.updatedLessons});
}

class SetFormColorAction{
  final int newColor;
  SetFormColorAction(this.newColor);
}

class SetFormCourseIdAction{
  final String newCourseId;
  SetFormCourseIdAction(this.newCourseId);
}
