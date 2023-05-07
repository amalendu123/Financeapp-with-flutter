import 'package:financeapp/pages/database.dart';
import 'package:financeapp/pages/dialogbox.dart';
import 'package:financeapp/pages/people.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final _myBox = Hive.box('mybox');
  MoneyDatabase db = MoneyDatabase();
  @override
  void initState() {
    // if this is the 1st time ever openin the app, then create default data
    if (_myBox.get("money") == null) {
      db.createInitialData();
    } else {
      // there already exists data
      db.loadData();
    }

    super.initState();
  }

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
          title: const Text(
            "Finance app",
            style: TextStyle(
              fontFamily: 'RobotoMono',
            ),
          ),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            createNewTask();
          },
          child: const Icon(Icons.add),
        ),
        body: ListView.builder(
          itemCount: db.money.length,
          itemBuilder: (context, index) {
            return Peoplecard(
              people: db.money[index][0],
              rupees: db.money[index][1],
            );
          },
        ));
  }
}
