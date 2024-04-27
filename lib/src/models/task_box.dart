import 'package:flutter/material.dart';
import 'package:to_do_list/src/models/edit_box.dart';

class TaskBox extends StatelessWidget {
  final String taskName;
  final String taskDescirption;
  final bool checkMarked;
  final Function onDelete;
  final Function onChanged;
  final Function(String, String) onEdit;
  const TaskBox(
      {super.key,
      required this.taskName,
      required this.checkMarked,
      required this.taskDescirption,
      required this.onChanged,
      required this.onDelete,
      required this.onEdit});
  @override
  @override
  Widget build(BuildContext context) {
    final textEdit = TextEditingController();
    final discription = TextEditingController();
    textEdit.text = taskName;
    discription.text = taskDescirption;
    return Card(
      margin: const EdgeInsets.all(10),
      color: Colors.white,
      elevation: 5,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            children: [
              IconButton(
                  onPressed: !checkMarked ? () => {onChanged()} : null,
                  icon: checkMarked
                      ? const Icon(Icons.check_box, color: Colors.green)
                      : const Icon(
                          Icons.check_box_outline_blank_outlined,
                          color: Colors.green,
                        )),
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            taskName,
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                          Text(taskDescirption)
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        IconButton(
                            onPressed: !checkMarked
                                ? () => {
                                      showDialog(
                                          context: context,
                                          builder: ((context) {
                                            return EditBox(
                                                controller: textEdit,
                                                descriptionController:
                                                    discription,
                                                onAdd: () {
                                                  Navigator.of(context).pop();
                                                  onEdit(textEdit.text,
                                                      discription.text);
                                                },
                                                onCancel: () {
                                                  Navigator.of(context).pop();
                                                });
                                          }))
                                    }
                                : null,
                            disabledColor: Colors.grey,
                            color: Colors.deepPurple,
                            icon: const Icon(Icons.edit_square)),
                        IconButton(
                          onPressed: () {
                            onDelete();
                          },
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
