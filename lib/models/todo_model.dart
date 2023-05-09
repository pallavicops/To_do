// To parse this JSON data, do
//
//     final toDoModel = toDoModelFromJson(jsonString);

import 'dart:convert';

List<ToDoModel> toDoModelFromJson(String str) =>
    List<ToDoModel>.from(json.decode(str).map((x) => ToDoModel.fromJson(x)));

String toDoModelToJson(List<ToDoModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ToDoModel {
  String title;
  String timeStamp;
  bool markedDone;

  ToDoModel({
    required this.title,
    required this.timeStamp,
    required this.markedDone,
  });

  factory ToDoModel.fromJson(Map<String, dynamic> json) => ToDoModel(
        title: json["title"],
        timeStamp: json["timeStamp"],
        markedDone: json["markedDone"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "timeStamp": timeStamp,
        "markedDone": markedDone,
      };
}
