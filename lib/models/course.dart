import 'package:flutter/foundation.dart';
import 'package:flutter_horario/models/id_generator.dart';

class Course{
  IdGenerator idGenerator = new IdGenerator();
  String id;
  String subject;
  String professor;
  String room;
  int color;



  Course({
    String id,
    @required String subject,
    @required String professor,
    String room,
    @required int color,
  }){
    if(id != null) this.id = id;
    else this.id = idGenerator.generateUid;

    this.subject = subject;
    this.professor = professor;
    this.color = color;
    this.room = room;
  }

  factory Course.fromJson(Map<String, dynamic> parsedJson){
    if(parsedJson != null){
      return Course.form(
        id: parsedJson['id'] != null ? parsedJson['id'] : null,
        subject: parsedJson['subject'] != null ? parsedJson['subject'] : null,
        professor : parsedJson['professor'] != null ? parsedJson['professor'] : null,
        color : parsedJson['color'] != null  ? parsedJson ['color'] : null,
        room : parsedJson['room'] != null ? parsedJson['room'] : null,
      );
    }else{
      return Course.form();
    }
  }

  Course.form({
    String id,
    String subject,
    String professor,
    String room,
    int color,
  }){
    if(id != null) this.id = id;
    else this.id = idGenerator.generateUid;

    this.subject = subject;
    this.professor = professor;
    this.color = color;
    this.room = room;
  }


  @override
  String toString(){
    return 'Id: $id \n'
        'Subject: $subject \n'
        'Professor: $professor \n'
        'Color: ${color.toRadixString(16)} \n'
        'Room: $room\n'
        '_____________';
  }

  // ! Add toJson serializer
  dynamic toJson() =>
    {
      'id': id,
      'subject': subject,
      'professor': professor,
      'room': room,
      'color': color,
    };
}