import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:marks_app/constants.dart';

class NotePage extends StatefulWidget {
  const NotePage({Key? key}) : super(key: key);

  @override
  _NotePageState createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  Color color = Colors.red;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back_ios),
          padding: const EdgeInsets.only(left: 10.0),
        ),
        actions: [
          colorPickerButton(),
          DeleteButton(),
          const Padding(padding: EdgeInsets.only(right: 3.0)),
        ],
      ),
      body: const NoteColumn(),
    );
  }

  Widget colorPickerButton() {
    return RawMaterialButton(
      onPressed: () => pickColor(context),
      elevation: 0,
      fillColor: color,
      shape: const CircleBorder(
        side: BorderSide(color: Colors.black, width: 0.6),
      ),
      constraints: const BoxConstraints(
          maxHeight: 18, maxWidth: 18, minHeight: 18, minWidth: 18),
    );
  }

  void pickColor(BuildContext context) => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Pick note color'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              buildColorPicker(),
              // TextButton(
              //   child: const Text(
              //     'SELECT',
              //     style: TextStyle(fontSize: 24),
              //   ),
              //   onPressed: () {
              //     changeColor(color);
              //     Navigator.of(context).pop();
              //   },
              // ),
            ],
          ),
        ),
      );

  Widget buildColorPicker() => BlockPicker(
      pickerColor: color,
      availableColors: [
        Colors.red[900]!,
        Colors.red[700]!,
        Colors.redAccent,
        Colors.red[300]!,
        Colors.deepOrange,
        Colors.orange[700]!,
        Colors.orange[400]!,
        Colors.orange[300]!,
        Colors.green[900]!,
        Colors.green[800]!,
        Colors.green[600]!,
        Colors.green[400]!,
        Colors.blue[900]!,
        Colors.blue[800]!,
        Colors.lightBlue[700]!,
        Colors.lightBlue,
        Colors.purple[800]!,
        Colors.purple,
        Colors.pink[800]!,
        Colors.pink,
      ],
      onColorChanged: (color) {
        this.color = color;
        changeColor(color);
        Navigator.of(context).pop();
      });

  void changeColor(Color color) => setState(() {
        this.color = color;
      });
}

class NoteColumn extends StatefulWidget {
  const NoteColumn({
    Key? key,
  }) : super(key: key);

  @override
  State<NoteColumn> createState() => _NoteColumnState();
}

class _NoteColumnState extends State<NoteColumn> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 13.0),
          child: Text(
            DATE_FORMAT_NOTE.format(DateTime.now()).toLowerCase(),
          ),
        ),
        const Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 13),
            child: TextField(
              keyboardType: TextInputType.multiline,
              maxLines: 9999,
              style: TextStyle(fontSize: 18),
            ),
          ),
        ),
      ],
    );
  }
}

class DeleteButton extends StatelessWidget {
  const DeleteButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: const Icon(Icons.delete_outlined),
    );
  }
}
