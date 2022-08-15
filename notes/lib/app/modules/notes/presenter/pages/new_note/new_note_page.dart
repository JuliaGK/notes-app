import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../utils/color_menu_popup.dart';
import 'new_note_page_controller.dart';

class NewNotePage extends StatefulWidget {
  const NewNotePage({Key? key}) : super(key: key);

  @override
  State<NewNotePage> createState() => _NewNotePageState();
}

class _NewNotePageState extends State<NewNotePage> {
  final controller = Modular.get<NewNotePageController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: controller.backgroundColor,
        appBar: AppBar(
          title: const Text('Add a new note'),
          actions: <Widget>[
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
            setState(() {
              controller.createNote();
            });
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
                    ),
                  ),
                ],
              )),
        ));
  }
}
