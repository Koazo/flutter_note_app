import 'package:hive/hive.dart';
import 'package:marks_app/constants.dart';
import 'package:marks_app/models/note.dart';

class Boxes {
  static Box<Note> getNotes() => Hive.box<Note>(HIVE_NOTE_BOX);
}
