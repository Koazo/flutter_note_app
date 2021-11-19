import 'package:flutter/material.dart';

Text customAppBarText(
  String title,
) {
  return Text(
    title,
    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
  );
}
