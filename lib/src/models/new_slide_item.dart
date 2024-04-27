import 'package:flutter/material.dart';
import 'package:flutter_slidable_panel/flutter_slidable_panel.dart';
import 'package:to_do_list/src/models/edit_box.dart';

class SliderBox extends StatefulWidget {
  final String title;
  final String description;
  final VoidCallback onDelete;
  final VoidCallback onUpdate;
  final int? opnedIndex;
  final VoidCallback onStart;
  final Function(String, String) onEdit;
  final int itemIndex;
  final bool isMarked;
  const SliderBox(
      {super.key,
      required this.title,
      required this.description,
      required this.itemIndex,
      required this.opnedIndex,
      required this.isMarked,
      required this.onDelete,
      required this.onStart,
      required this.onEdit,
      required this.onUpdate});

  @override
  State<SliderBox> createState() => _SliderBoxState();
}

class _SliderBoxState extends State<SliderBox> {
  final SlideController _slideController = SlideController(
    usePreActionController: true,
    usePostActionController: true,
  );
  @override
  void dispose() {
    _slideController.dispose();
    super.dispose();
  }

  void onDismiss() {
    _slideController.dismiss();
  }

  @override
  Widget build(BuildContext context) {
    final textEdit = TextEditingController();
    final discription = TextEditingController();
    textEdit.text = widget.title;
    discription.text = widget.description;

    widget.opnedIndex != widget.itemIndex ? onDismiss() : null;

    return Padding(
        padding: const EdgeInsets.only(top: 5, left: 19, right: 19),
        child: SlidablePanel(
          controller: _slideController,
          onSlideStart: () => {widget.onStart()},
          maxSlideThreshold: 0.2,
          axis: Axis.horizontal,
          preActions: !widget.isMarked
              ? [
                  Container(
                    margin: const EdgeInsets.only(right: 5),
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(13)),
                        color: Color(0xFF40CFCF)),
                    child: IconButton(
                      icon: const Icon(Icons.edit_square),
                      onPressed: () => {
                        onDismiss(),
                        showDialog(
                            context: context,
                            builder: (context) {
                              return EditBox(
                                  controller: textEdit,
                                  descriptionController: discription,
                                  onAdd: () {
                                    Navigator.of(context).pop();
                                    widget.onEdit(
                                        textEdit.text, discription.text);
                                  },
                                  onCancel: () {
                                    Navigator.of(context).pop();
                                  });
                            })
                      },
                      color: Colors.white,
                    ),
                  ),
                ]
              : [],
          postActions: [
            Container(
              margin: const EdgeInsets.only(left: 5),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(13)),
                  color: Color(0xFFEC3737)),
              child: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: widget.onDelete,
                color: Colors.white,
              ),
            )
          ],
          child: Flex(direction: Axis.horizontal, children: [
            Flexible(
              child: Container(
                width: MediaQuery.sizeOf(context).width,
                padding:
                    const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
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
                        onPressed: !widget.isMarked
                            ? () => {onDismiss(), widget.onUpdate()}
                            : null,
                        icon: widget.isMarked
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
                            widget.title,
                            style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            widget.description,
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
          ]),
        ));
  }
}
