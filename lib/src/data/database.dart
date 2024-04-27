import 'package:hive_flutter/hive_flutter.dart';

class ToDoList {
  List tasks = [];
  final _myBox = Hive.box("myBox");

  void load() {
    tasks = _myBox.get("TODOLIST");
  }

  void update() {
    _myBox.put("TODOLIST", tasks);
  }
}
