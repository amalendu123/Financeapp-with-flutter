// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:financeapp/pages/buttoon.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Dialogbox extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final name;
  final rupcontroller;
  bool onswitch;
  VoidCallback onSave;
  VoidCallback onCancel;
  Dialogbox({
    super.key,
    required this.name,
    required this.rupcontroller,
    required this.onswitch,
    required this.onSave,
    required this.onCancel,
  });

  @override
  State<Dialogbox> createState() => _DialogboxState();
}

class _DialogboxState extends State<Dialogbox> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      content: Container(
        height: 400,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // get user input
            TextField(
              controller: widget.name,
              decoration: const InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 3,
                    color: Colors.indigo,
                  ),
                ),
                hintText: "Name of the person or shop",
              ),
            ),
            TextField(
              controller: widget.rupcontroller,
              decoration: const InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 3,
                    color: Colors.indigo,
                  ),
                ),
                hintText: "Enter the amount of money",
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("To give"),
                Switch(
                  value: widget.onswitch,
                  onChanged: (value) {
                    setState(() {
                      widget.onswitch = value;
                    });
                  },
                  activeTrackColor: Colors.indigo,
                  activeColor: Colors.indigo,
                ),
                const Text("To get"),
              ],
            ),
            // buttons -> save + cancel
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // save button
                MyButton(text: "Save", onPressed: widget.onSave),

                const SizedBox(width: 8),

                // cancel button
                MyButton(text: "Cancel", onPressed: widget.onCancel),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
