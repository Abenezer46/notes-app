// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:note_app/data/database.dart';

class EditPage extends StatefulWidget {
  EditPage(
      {super.key,
      this.newNoteCreate,
      this.note,
      this.index,
      this.editedNewNote});

  final Function(Note)? newNoteCreate;
  final Function(Note, int)? editedNewNote;
  final Note? note;
  final int? index;

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  var _titleController = TextEditingController();
  var _textController = TextEditingController();
  var id;
  bool edit = false;

  @override
  void initState() {
    if (widget.note != null) {
      _titleController = TextEditingController(text: widget.note!.title);
      _textController = TextEditingController(text: widget.note!.content);
      id = widget.note!.id;
      edit = true;
    }

    super.initState();
  }

  saveNote() {
    if (edit) {

      if (_titleController.text.isNotEmpty && _textController.text.isNotEmpty) {
        final note = Note(
            id: id,
            title: _titleController.text,
            content: _textController.text,
            modifiedTime: DateTime.now());
        widget.editedNewNote!(note, id);
        Navigator.of(context).pop();
      }
    } else {
      if (_titleController.text.isNotEmpty && _textController.text.isNotEmpty) {
        final note = Note(
            id: sampleNote.length,
            title: _titleController.text,
            content: _textController.text,
            modifiedTime: DateTime.now());
        widget.newNoteCreate!(note);
        Navigator.of(context).pop();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade900,
        iconTheme: const IconThemeData(color: Colors.white, fill: 0),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              onPressed: saveNote,
              icon: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    color: Colors.grey.shade800.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(10)),
                child: const Icon(
                  Icons.save_rounded,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView(
            padding: const EdgeInsets.only(left: 12, right: 12),
            children: [
              TextField(
                controller: _titleController,
                style: const TextStyle(color: Colors.white, fontSize: 25),
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Title',
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 25)),
              ),
              TextField(
                maxLines: null,
                controller: _textController,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Type Something here',
                    hintStyle: TextStyle(color: Colors.grey)),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
