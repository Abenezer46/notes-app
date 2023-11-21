import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DialogBox extends StatelessWidget {
  
  VoidCallback onDelete;
  VoidCallback onCancel;

  DialogBox({super.key, required this.onDelete, required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.grey.shade900,
      icon: const Icon(
        Icons.info,
        color: Colors.grey,
      ),
      title: const Text(
        'Are you sure you want to delete?',
        style: TextStyle(color: Colors.white),
      ),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ElevatedButton(
              onPressed: onDelete,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              child: const SizedBox(
                width: 60,
                child: Text(
                  'Yes',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ),
              )),
          ElevatedButton(
              onPressed:onCancel,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: const SizedBox(
                width: 60,
                child: Text(
                  'No',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ),
              ))
        ],
      ),
    );
  }
}
