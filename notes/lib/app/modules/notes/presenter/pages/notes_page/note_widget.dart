import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../domain/entities/note.dart';
import '../../utils/string_to_color.dart';

class NoteWidget extends StatelessWidget {
  final DataSnapshot snapshot;

  const NoteWidget({super.key, required this.snapshot});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: stringToColor(snapshot.child("color").value.toString()),
      elevation: 5,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
      margin: const EdgeInsets.only(top: 10, bottom: 10),
      child: InkWell(
        splashColor: const Color(0xFF4027FF),
        onTap: () {
          Modular.to.pushNamed('/notes/edit_note',
              arguments: Note(
                id: snapshot.key as String,
                color: snapshot.child('color').value as String,
                content: snapshot.child('text').value as String,
                title: snapshot.child('title').value as String,
                datetimeCreated:
                    snapshot.child('datetime_created').value as String,
              ));
        },
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                snapshot.child("title").value.toString(),
                style: GoogleFonts.roboto(
                    fontSize: 22, fontWeight: FontWeight.bold),
                textAlign: TextAlign.left,
              ),
              Container(
                height: 5,
              ),
              Text(
                snapshot.child("text").value.toString(),
                style: GoogleFonts.roboto(
                  fontSize: 16,
                ),
                textAlign: TextAlign.left,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
