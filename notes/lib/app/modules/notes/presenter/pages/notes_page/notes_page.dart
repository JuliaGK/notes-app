import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:notes/app/modules/notes/presenter/pages/notes_page/notes_page_controller.dart';

import 'note_widget.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return NotesPageState();
  }
}

class NotesPageState extends State<NotesPage> {
  final controller = Modular.get<NotesPageController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Notes'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.logout),
              tooltip: 'Logout',
              onPressed: () {
                controller.signOut();
              },
            )
          ],
        ),
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FutureBuilder(
                future: controller.getNotesQuery(),
                builder: (BuildContext context, AsyncSnapshot<Query> snapshot) {
                  if (snapshot.hasData) {
                    return Flexible(
                      child: FirebaseAnimatedList(
                        padding: const EdgeInsets.all(10),
                        query: snapshot.data as Query,
                        itemBuilder: (_, DataSnapshot snapshot,
                            Animation<double> animation, int x) {
                          return NoteWidget(
                            snapshot: snapshot,
                          );
                        },
                      ),
                    );
                  } else {
                    return const CircularProgressIndicator();
                  }
                },
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.note_add),
          onPressed: () {
            Navigator.pushNamed(context, '/notes/new_note');
          },
        ));
  }
}
