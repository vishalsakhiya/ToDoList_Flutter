import 'package:flutter/material.dart';
import 'package:to_do_list/src/models/simple_button.dart';

class EditBox extends StatelessWidget {
  final TextEditingController controller;
  final TextEditingController descriptionController;
  final VoidCallback onAdd;
  final VoidCallback onCancel;

  const EditBox({
    Key? key,
    required this.controller,
    required this.descriptionController,
    required this.onAdd,
    required this.onCancel,
  }) : super(key: key);

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
            "Edit To-Do",
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
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SimpleButton(
                  title: "SAVE",
                  backGroundColor: const Color(0xFF40CFCF),
                  onPressed: onAdd),
              const SizedBox(
                width: 10,
              ),
              SimpleButton(
                  title: "CANCEL",
                  backGroundColor: const Color(0xFFEC3737),
                  onPressed: onCancel),
            ],
          )
        ]),
      ),
    );
  }
}
