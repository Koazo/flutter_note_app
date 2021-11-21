import 'package:flutter/material.dart';
import 'package:marks_app/constants.dart';
import 'package:marks_app/widgets/custom_app_bar_text.dart';

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
                onPressed: () {
                  Navigator.pushNamed(context, '/settings_page');
                },
                icon: const Icon(Icons.settings_outlined)),
          ]),
      body: ListView.builder(
          itemCount: 15,
          itemBuilder: (_, index) {
            // return customListTile('Заголовок', DateTime.now(), Colors.black,
            //     Icon(Icons.bookmark));
            return ListTile(
              leading: const CircleAvatar(
                child: Icon(Icons.bookmark),
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
              ),
              title: const Text(
                'Заголовок',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              subtitle: Text(
                DATE_FORMAT_MAIN.format(DateTime.now()),
                style: const TextStyle(fontSize: 16),
              ),
              trailing: const Icon(
                Icons.arrow_right,
                color: Colors.black,
              ),
              onTap: () {
                Navigator.pushNamed(context, '/note_page');
              },
            );
          }),
    );
  }
}
