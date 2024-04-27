import 'package:flutter/material.dart';
import 'package:to_do_list/src/models/simple_button.dart';

class DialogBox extends StatelessWidget {
  final TextEditingController controller;
  final TextEditingController descriptionController;
  final VoidCallback? onAdd;
  final VoidCallback? onCancel;

  const DialogBox({
    Key? key,
    required this.controller,
    required this.descriptionController,
    required this.onAdd,
    required this.onCancel,
  }) : super(key: key);

  void call() {
    onAdd;
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(19)),
      backgroundColor: Colors.white,
      child: Container(
        height: MediaQuery.of(context).size.width * 0.65,
        padding: const EdgeInsets.all(20),
        alignment: Alignment.center,
        width: MediaQuery.sizeOf(context).width + 20,
        child: Column(children: [
          const Text(
            "Add To-Do",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          TextField(
            decoration: const InputDecoration(
                border: UnderlineInputBorder(), hintText: "Title"),
            controller: controller,
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            decoration: const InputDecoration(
                border: UnderlineInputBorder(), hintText: "Description"),
            controller: descriptionController,
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SimpleButton(
                onPressed: onAdd,
                backGroundColor: const Color(0xFF40CFCF),
                title: 'SAVE',
              ),
              const SizedBox(
                width: 10,
              ),
              SimpleButton(
                backGroundColor: const Color(0xFFEC3737),
                title: 'CANCEL',
                onPressed: onCancel,
              ),
            ],
          )
        ]),
      ),
    );
  }
}
