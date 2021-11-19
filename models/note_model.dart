import 'package:flutter/material.dart';

class NoteModel {
  String? title;
  String? content;
  DateTime? createdDate;
  Color? color;
  Icon? icon;

  NoteModel(
      {this.title, this.content, this.createdDate, this.color, this.icon});
}
