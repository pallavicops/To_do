import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:to_do/models/todo_model.dart';

import '../utils/snackbar_service.dart';

class ToDoController {
  String? title;
  final firebaseAuth = FirebaseAuth.instance;

  void addToDo() async {
    final userId = firebaseAuth.currentUser!.uid;
    ToDoModel todoData = ToDoModel(
      title: title!,
      timeStamp: DateTime.now().millisecondsSinceEpoch.toString(),
      markedDone: false,
    );
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('todo')
        .add(
          todoData.toJson(),
        )
        .then(
          (value) => snackBarService.showPositiveSnackBar("Added Successfully"),
        )
        .catchError(
      (error) {
        snackBarService.showNegativeSnackBar("Something went wrong");
      },
    );
  }

  deleteToDo(String id) {
    final userId = firebaseAuth.currentUser!.uid;
    FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('todo')
        .doc(id)
        .delete();
  }

  updateMarkedDone(String id, bool newValue) {
    final userId = firebaseAuth.currentUser!.uid;
    FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('todo')
        .doc(id)
        .update(
      {"markedDone": newValue},
    );
  }
}

final ToDoController toDoController = ToDoController();
