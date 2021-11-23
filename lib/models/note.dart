import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'note.g.dart';

@HiveType(typeId: 1)
class Note extends HiveObject {
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

  Note({
    this.id,
    this.title,
    this.content,
    this.createdDate,
    this.color,
  });
}
