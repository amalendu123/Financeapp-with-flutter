import 'package:financeapp/pages/dialogbox.dart';
import 'package:financeapp/pages/people.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List list = [
    ["Amalendu", "500"]
  ];
  bool isSwitched = true;
  final _controller = TextEditingController();
  final _namecontroller = TextEditingController();
  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return Dialogbox(
          name: _namecontroller,
          rupcontroller: _controller,
          onswitch: isSwitched,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  void saveNewTask() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Finance app"),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            createNewTask();
          },
          child: const Icon(Icons.add),
        ),
        body: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {
            return Peoplecard(people: list[index][0], rupees: list[index][1]);
          },
        ));
  }
}
