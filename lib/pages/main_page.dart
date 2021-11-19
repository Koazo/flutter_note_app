import 'package:flutter/material.dart';
import 'package:marks_app/widgets/custom_app_bar_text.dart';
import 'package:marks_app/widgets/custom_list_tile.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _light = true;
    return Scaffold(
      appBar: AppBar(
          title: customAppBarText('REMARKABLE'),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.settings_outlined)),
          ]),
      body: ListView.builder(
          itemCount: 15,
          itemBuilder: (_, index) {
            return customListTile('Заголовок', DateTime.now(), Colors.black,
                Icon(Icons.bookmark));
          }),
    );
  }
}
