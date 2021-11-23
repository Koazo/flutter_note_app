import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:marks_app/constants.dart';
import 'package:marks_app/models/note.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late Box<Note> notesBox;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    notesBox = Hive.box('notes');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   child: const Icon(
      //     Icons.add,
      //     color: Colors.white,
      //   ),
      //   onPressed: () {
      //     Navigator.pushNamed(context, '/note_page');
      //   },
      //   backgroundColor: Colors.black,
      // ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: SizedBox(
          height: 45,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  'Notes: 12',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
              ),
              // const Spacer(),
              IconButton(
                padding: const EdgeInsets.only(right: 20),
                alignment: Alignment.centerRight,
                icon: const Icon(
                  Icons.bookmark_add,
                  color: Colors.white,
                  size: 30,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/note_page');
                },
              )
            ],
          ),
        ),
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      appBar: AppBar(
        title: RichText(
          text: const TextSpan(
            children: [
              TextSpan(
                text: 'REMARKABLE ',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  fontFamily: 'GothamPro',
                ),
              ),
              WidgetSpan(
                child: Icon(Icons.bookmarks),
              ),
            ],
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/settings_page');
              },
              icon: const Icon(Icons.settings_outlined)),
        ],
      ),
      body: ValueListenableBuilder(
        valueListenable: notesBox.listenable(),
        builder: (context, Box<Note> notes, _) {
          return ListView.builder(
            itemBuilder: (context, index) {
              final key = notes.keys.toList()[index];
              final title = notes.get(key);
              final content = notes.get(key);
              return ListTile();
            },
            itemCount: notesBox.keys.toList().length,
          );
        },
      ),
    );
  }
}


// ListView.builder(
//           itemCount: 15,
//           itemBuilder: (_, index) {
//             // return customListTile('Заголовок', DateTime.now(), Colors.black,
//             //     Icon(Icons.bookmark));
//             return ListTile(
//               leading: const CircleAvatar(
//                 child: Icon(Icons.bookmark),
//                 backgroundColor: Colors.black,
//                 foregroundColor: Colors.white,
//               ),
//               title: const Text(
//                 'Заголовок',
//                 style: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black),
//               ),
//               subtitle: Text(
//                 DATE_FORMAT_MAIN.format(DateTime.now()),
//                 style: const TextStyle(fontSize: 16),
//               ),
//               trailing: const Icon(
//                 Icons.arrow_right,
//                 color: Colors.black,
//               ),
//               onTap: () {
//                 Navigator.pushNamed(
//                   context,
//                   '/note_page',
//                 );
//               },
//             );
//           }),