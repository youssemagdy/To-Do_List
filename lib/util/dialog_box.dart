import 'package:flutter/material.dart';
import 'package:to_do/util/widget_button.dart';

// ignore: must_be_immutable
class DialogBox extends StatelessWidget {
  DialogBox({
    Key? key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  }) : super(key: key);

  // ignore: prefer_typing_uninitialized_variables
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[100],
      content: Container(
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Get User Input
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                hintText: 'Add A New Task',
                // focusColor: Colors.white,
                hintStyle: TextStyle(color: Colors.grey),
                focusColor: Colors.white,
              ),
            ),
            // buttons -> save + cancel
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Save Button
                Expanded(
                  child: WidgetButton(
                    text: 'Save',
                    onPressed: onSave
                  ),
                ),
                const SizedBox(width: 8,),
                // Cancel Button
                Expanded(
                  child: WidgetButton(
                    text: 'Cancel',
                    onPressed: onCancel,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
