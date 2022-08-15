import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../domain/entities/note.dart';
import '../../utils/color_menu_popup.dart';
import '../../utils/string_to_color.dart';
import 'edit_note_page_controller.dart';

class EditNotePage extends StatefulWidget {
  final Note note;
  const EditNotePage({super.key, required this.note});

  @override
  State<EditNotePage> createState() => EditNotePageState();
}

class EditNotePageState extends State<EditNotePage> {
  final controller = Modular.get<EditNotePageController>();

  @override
  void initState() {
    controller.setNote(widget.note);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: stringToColor(controller.note.color),
        appBar: AppBar(
          title: const Text('Edit note'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.delete),
              tooltip: 'Exclude note',
              onPressed: () {
                controller.removeNote();
              },
            ),
            GestureDetector(
              child: Row(
                children: const [
                  Icon(Icons.palette),
                  SizedBox(
                    width: 10,
                  )
                ],
              ),
              onTapDown: (details) =>
                  getColorMenuPopUp(context, details).then((value) => {
                        setState(() {
                          controller.setColor(value);
                        })
                      }),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.save),
          onPressed: () {
            controller.editNote();
          },
        ),
        body: Container(
          padding: const EdgeInsets.only(left: 15.0, top: 15.0, right: 15.0),
          child: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Column(
                children: [
                  TextField(
                    decoration: const InputDecoration(
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      hintText: 'Title',
                    ),
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    onChanged: controller.setTitle,
                    controller:
                        TextEditingController(text: controller.note.title),
                  ),
                  Expanded(
                    child: TextField(
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: const InputDecoration(
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          hintText: 'Your note'),
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                      onChanged: controller.setText,
                      controller:
                          TextEditingController(text: controller.note.content),
                    ),
                  ),
                ],
              )),
        ));
  }
}
