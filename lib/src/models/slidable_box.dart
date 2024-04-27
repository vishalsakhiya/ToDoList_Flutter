import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:to_do_list/src/models/edit_box.dart';

class Slidablebox extends StatelessWidget {
  final String title;
  final String description;
  final Function(BuildContext)? onDelete;
  final VoidCallback onUpdate;
  final Function(String, String) onEdit;
  final bool isMarked;
  const Slidablebox(
      {super.key,
      required this.title,
      required this.description,
      required this.isMarked,
      required this.onDelete,
      required this.onEdit,
      required this.onUpdate});
  @override
  Widget build(BuildContext context) {
    final textEdit = TextEditingController();
    final discription = TextEditingController();
    textEdit.text = title;
    discription.text = description;
    return Padding(
      padding: const EdgeInsets.only(top: 5, left: 19, right: 19),
      child: Slidable(
        startActionPane: isMarked
            ? null
            : ActionPane(
                extentRatio: 0.2,
                motion: const StretchMotion(),
                children: [
                  SlidableAction(
                    onPressed: (context) => {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return EditBox(
                                controller: textEdit,
                                descriptionController: discription,
                                onAdd: () {
                                  Navigator.of(context).pop();
                                  onEdit(textEdit.text, discription.text);
                                },
                                onCancel: () {
                                  Navigator.of(context).pop();
                                });
                          })
                    },
                    icon: Icons.edit_square,
                    borderRadius: BorderRadius.circular(13),
                    backgroundColor: const Color(0xFF40CFCF),
                  ),
                ],
              ),
        endActionPane: ActionPane(
            motion: const StretchMotion(),
            extentRatio: 0.2,
            children: [
              SlidableAction(
                onPressed: onDelete,
                borderRadius: BorderRadius.circular(13),
                icon: Icons.delete,
                backgroundColor: const Color(0xFFEC3737),
              ),
            ]),
        child: Flexible(
          child: Container(
            width: MediaQuery.sizeOf(context).width,
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: const Color(0xFFE6E6E6),
                ),
                color: const Color(0xFFF3FFFF),
                borderRadius: BorderRadius.circular(13)),
            child: Row(
              children: [
                IconButton(
                    onPressed: !isMarked ? onUpdate : null,
                    icon: isMarked
                        ? const Icon(Icons.check_box, color: Colors.green)
                        : const Icon(
                            Icons.check_box_outline_blank_outlined,
                            color: Colors.green,
                          )),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        description,
                        style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF9D9D9D)),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
