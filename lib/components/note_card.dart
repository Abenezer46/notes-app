import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:note_app/assets/colors.dart';
import 'package:note_app/components/dialog_box.dart';
import 'package:note_app/data/database.dart';
import 'package:note_app/pages/edit.dart';

class NoteCard extends StatelessWidget {

  final Note note;
  final int noteIndex;
  final Function deleteNote;
  final Function(Note, int)? editedNewNote;

  const NoteCard(
      {super.key,
      required this.noteIndex,
      required this.deleteNote, 
      required this.note, this.editedNewNote});

  getRandomColor() {
    Random random = Random();
    return backgroundColors[random.nextInt(backgroundColors.length)];
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 20),
      color: getRandomColor(),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute<void>(
              builder: (BuildContext context) => EditPage(index: noteIndex, note: note, editedNewNote: editedNewNote,),
            ),
          );
        },
        title: RichText(
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          text: TextSpan(
              text: '${note.title}\n',
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  height: 1.5),
              children: [
                TextSpan(
                    text: note.content,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                      height: 1.5,
                    ))
              ]),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            'Edited ${DateFormat('EEE MMM d, yyyy h:mm a').format(note.modifiedTime)}',
            style: const TextStyle(
                color: Colors.grey, fontStyle: FontStyle.italic, fontSize: 10),
          ),
        ),
        trailing: IconButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return DialogBox(
                      onDelete: () =>
                          {deleteNote(noteIndex), Navigator.of(context).pop()},
                      onCancel: () => {Navigator.of(context).pop()},
                    );
                  });
            },
            icon: const Icon(Icons.delete)),
      ),
    );
  }
}
