import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:marks_app/constants.dart';
import 'package:marks_app/models/boxes.dart';
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
    super.initState();
    notesBox = Hive.box(HIVE_NOTE_BOX);
  }

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }

  Future addNote(
      {String? title,
      String? content,
      DateTime? createdDate,
      Color? color = Colors.black}) async {
    final note = Note()
      ..title = title
      ..content = content
      ..createdDate = DateTime.now()
      ..color = color;

    final box = Boxes.getNotes();
    await box.add(note);
  }

  void editNote(Note note, String title, String content, Color color) {
    note.title = title;
    note.content = content;
    note.color = color;

    note.save();
  }

  void deleteNote(Note note) {
    note.delete();
  }

  Widget buildContent(List<Note> notes) {
    if (notes.isEmpty) {
      const Center(
        child: Text(
          'No notes yet',
          style: TextStyle(fontSize: 24),
        ),
      );
    }

    return ListView.builder(
      itemBuilder: (context, index) {
        final note = notes[index];
        return ListTile(
          leading: CircleAvatar(
            child: Icon(Icons.bookmark),
            backgroundColor: note.color,
            foregroundColor: Colors.white,
          ),
          title: Text(
            note.title.toString(),
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: note.color),
          ),
          subtitle: Text(
            DATE_FORMAT_MAIN.format(note.createdDate!),
            style: const TextStyle(fontSize: 16),
          ),
          trailing: const Icon(
            Icons.arrow_right,
            color: Colors.black,
          ),
          onTap: () {
            Navigator.pushNamed(
              context,
              '/note_page',
            );
          },
        );
      },
      itemCount: notes.length,
    );
  }

  RichText buildAppBarTitle() {
    return RichText(
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: buildAppBarTitle(),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/settings_page');
              },
              icon: const Icon(Icons.settings_outlined)),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: SizedBox(
          height: 45,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  'Notes: ${returnNotesCount()}',
                  style: const TextStyle(
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
                  addNote(title: 'New note', content: '');
                  // print(notesBox.values);
                  Navigator.pushNamed(
                    context,
                    '/note_page',
                  );
                },
              )
            ],
          ),
        ),
      ),
      body: ValueListenableBuilder<Box<Note>>(
        valueListenable: Boxes.getNotes().listenable(),
        builder: (context, box, _) {
          final notes = box.values.toList().cast<Note>();
          return buildContent(notes);
        },
      ),
    );
  }

  int? returnNotesCount() {
    return notesBox.values.toList().cast<Note>().length;
  }
}
