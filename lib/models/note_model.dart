import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'note_model.g.dart';

@HiveType(typeId: 1)
class NoteModel {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? title;
  @HiveField(2)
  String? content;
  @HiveField(3)
  DateTime? createdDate;
  @HiveField(4)
  Color? color;

  NoteModel({
    this.id,
    this.title,
    this.content,
    this.createdDate,
    this.color,
  });
}
