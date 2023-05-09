import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:to_do/controller/todo_controller.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    Key? key,
    required this.todo,
  }) : super(key: key);
  final QueryDocumentSnapshot<Map<String, dynamic>> todo;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(
            10,
          ),
        ),
      ),
      color: Theme.of(context).primaryColor,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Checkbox(
              value: todo.get("markedDone"),
              onChanged: (newValue) {
                toDoController.updateMarkedDone(todo.id, newValue ?? false);
              },
            ),
            Expanded(
              child: Text(
                todo.get('title'),
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      decoration: todo.get("markedDone")
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
              ),
            ),
            IconButton(
              onPressed: () {
                toDoController.deleteToDo(todo.id);
              },
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
            )
          ],
        ),
      ),
    );
  }
}
