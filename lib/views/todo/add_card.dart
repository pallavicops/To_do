import 'package:flutter/material.dart';
import 'package:to_do/controller/todo_controller.dart';
import 'package:to_do/utils/snackbar_service.dart';

class AddCard extends StatelessWidget {
  const AddCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    return AlertDialog(
      title: const Text(
        "Add ToDo",
      ),
      content: TextField(
        textAlign: TextAlign.center,
        decoration: const InputDecoration(
          hintText: "Enter todo title here",
        ),
        onChanged: (title) {
          toDoController.title = title;
        },
      ),
      actions: [
        Center(
          child: ElevatedButton(
            onPressed: () {
              if (toDoController.title == null ||
                  toDoController.title!.isEmpty) {
                Navigator.pop(context);
                snackBarService.showNegativeSnackBar(
                  "Title can not be empty",
                );
                return;
              } else {
                toDoController.addToDo();
                Navigator.pop(context);
              }
            },
            style: ElevatedButton.styleFrom(
              fixedSize: const Size(210, 44),
              backgroundColor: Theme.of(context).primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            child: Text(
              "SAVE",
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
        )
      ],
    );
  }
}
