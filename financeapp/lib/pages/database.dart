import 'package:hive_flutter/hive_flutter.dart';

class MoneyDatabase {
  List money = [];

  // reference our box
  final _myBox = Hive.box('mybox');

  // run this method if this is the 1st time ever opening this app
  void createInitialData() {
    money = [
      ["123", "500", "abc"],
    ];
  }

  // load the data from database
  void loadData() {
    money = _myBox.get("money");
  }

  // update the database
  void updateDataBase() {
    _myBox.put("money", money);
  }
}
