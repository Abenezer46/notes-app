// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors


import 'package:flutter/material.dart';
import 'package:note_app/components/note_card.dart';
import 'package:note_app/data/database.dart';
import 'package:note_app/pages/edit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  List<Note> filteredNotes = [];
  bool sorted = false;

  @override
  void initState() {
    super.initState();
    filteredNotes = sampleNote;
  }

  List<Note> sortNotes(List<Note> notes) {
    if (sorted) {
      notes.sort((a, b) => a.modifiedTime.compareTo(b.modifiedTime));
    } else {
      notes.sort((b, a) => a.modifiedTime.compareTo(b.modifiedTime));
    }

    sorted = !sorted;
    return notes;
  }

  void onSearchChange(String searchText) {
    setState(() {
      filteredNotes = sampleNote
          .where((note) =>
              note.content.toLowerCase().contains(searchText.toLowerCase()) ||
              note.title.toLowerCase().contains(searchText.toLowerCase()))
          .toList();
    });
  }

  void deleteNote(int index) {
    setState(() {
      sampleNote.removeAt(index);
      filteredNotes = sampleNote;
    });
  }

  void newNoteCreate(Note note) {
    setState(() {
      sampleNote.add(note);
      filteredNotes = sampleNote;
    });
  }

  void editedNewNote(Note note, int index) {
    setState(() {
      sampleNote[index] = note;
      filteredNotes = sampleNote;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        title: const Text(
          "Simple Note",
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
        backgroundColor: Colors.grey.shade900,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              onPressed: () {
                setState(() {
                  filteredNotes = sortNotes(filteredNotes);
                });
              },
              icon: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    color: Colors.grey.shade800.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(10)),
                child: const Icon(
                  Icons.sort_rounded,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              onChanged: onSearchChange,
              style: const TextStyle(fontSize: 16, color: Colors.white),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 12),
                hintText: "Search Note ...",
                hintStyle: const TextStyle(color: Colors.grey),
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                filled: true,
                fillColor: Colors.grey.shade800,
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(color: Colors.transparent)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(color: Colors.transparent)),
              ),
            ),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ListView.builder(
              itemCount: filteredNotes.length,
              itemBuilder: (context, index) {
                return NoteCard(
                  noteIndex: index,
                  deleteNote: (context) => deleteNote(index),
                  note: filteredNotes[index],
                  editedNewNote: editedNewNote,
                );
              },
            ),
          ))
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute<void>(
              builder: (BuildContext context) => EditPage(
                newNoteCreate: newNoteCreate,
                editedNewNote: editedNewNote,
              ),
            ),
          );
        },
        backgroundColor: Colors.grey.shade800,
        elevation: 10,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
