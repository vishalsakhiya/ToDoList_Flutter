import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_list/src/data/database.dart';
import 'package:to_do_list/src/models/dilog_box.dart';
import 'package:to_do_list/src/models/new_slide_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _textEdit = TextEditingController();
  final _discription = TextEditingController();
  final _mybox = Hive.box("myBox");
  int? openedSliderIndex;
  ToDoList db = ToDoList();
  @override
  void initState() {
    if (_mybox.get("TODOLIST") != null) {
      db.load();
    }
    super.initState();
  }

  void onAdd() {
    if (_discription.text != "" && _textEdit.text != "") {
      setState(() {
        db.tasks.add([_textEdit.text, _discription.text, false]);
        _textEdit.clear();
        _discription.clear();
        onCancel();
      });
      db.update();
    } else {
      // onCancel();
      final scaffold = ScaffoldMessenger.of(context);
      scaffold.showSnackBar(
          const SnackBar(content: Text("must enter title and description")));
    }
  }

  void onCancel() {
    Navigator.of(context).pop();
  }

  void onEdit(String title, String description, int index) {
    setState(() {
      db.tasks[index][0] = title;
      db.tasks[index][1] = description;
    });
    db.update();
  }

  void onChagne(int index) {
    setState(() {
      db.tasks[index][2] = true;
    });
    db.update();
  }

  void onDelete(int index) {
    setState(() {
      openedSliderIndex = -1;
      db.tasks.removeAt(index);
    });
    db.update();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('To-Do List')),
      floatingActionButton: FloatingActionButton(
          elevation: 1,
          onPressed: () => {
                setState(() {
                  openedSliderIndex = -1;
                }),
                showDialog(
                    context: context,
                    builder: ((context) {
                      return DialogBox(
                          controller: _textEdit,
                          descriptionController: _discription,
                          onAdd: onAdd,
                          onCancel: onCancel);
                    }))
              },
          child: const Icon(Icons.add)),
      body: db.tasks.isNotEmpty
          ? ListView.builder(
              itemCount: db.tasks.length,
              itemBuilder: ((context, index) => SliderBox(
                    title: db.tasks[index][0],
                    description: db.tasks[index][1],
                    isMarked: db.tasks[index][2],
                    onDelete: () => onDelete(index),
                    itemIndex: index,
                    opnedIndex: openedSliderIndex,
                    onUpdate: () => {onChagne(index)},
                    onStart: () => {
                      setState(() {
                        openedSliderIndex = index;
                      }),
                    },
                    onEdit: (title, dsc) => {onEdit(title, dsc, index)},
                  )))
          : const Center(
              child: Text(
                "No task found!",
                style: TextStyle(fontSize: 20),
              ),
            ),
    );
  }
}
