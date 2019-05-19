import 'package:uuid/uuid.dart';

class IdGenerator{
  static final IdGenerator _idGenerator = new IdGenerator._internal();
  Uuid _uuid;

  factory IdGenerator() {
    return _idGenerator;
  }

  IdGenerator._internal() {
    _uuid = new Uuid();
  }

  String get generateUid{
    return _uuid.v1();
  }
}