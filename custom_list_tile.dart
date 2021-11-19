import 'package:flutter/material.dart';
import 'package:marks_app/constants.dart';

Widget customListTile(
    String title, DateTime createdDate, Color color, Icon icon) {
  return ListTile(
    leading: CircleAvatar(
      child: icon,
      backgroundColor: color,
      foregroundColor: Colors.white,
    ),
    title: Text(
      title,
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: color),
    ),
    subtitle: Text(
      DATE_FORMAT_MAIN.format(createdDate),
      style: const TextStyle(fontSize: 16),
    ),
    trailing: const Icon(
      Icons.arrow_right,
      color: Colors.black,
    ),
    onTap: () {},
  );
}
