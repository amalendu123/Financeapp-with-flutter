import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Peoplecard extends StatelessWidget {
  final String people;
  final String rupees;
  bool onswitch;
  Peoplecard(
      {super.key,
      required this.people,
      required this.rupees,
      required this.onswitch});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.indigo,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              people,
              style: TextStyle(color: Colors.white),
            ),
            Text(
              rupees,
              style: TextStyle(color: onswitch ? Colors.red : Colors.blue),
            ),
          ],
        ),
      ),
    );
  }
}
