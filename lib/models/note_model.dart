import 'package:flutter/material.dart';

class NoteModel {
  int? id;
  String? title;
  String? content;
  DateTime? createdDate;
  Color? color;

  NoteModel({
    this.id,
    this.title,
    this.content,
    this.createdDate,
    this.color,
  });
}
