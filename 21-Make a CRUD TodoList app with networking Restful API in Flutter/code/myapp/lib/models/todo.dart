/*
Nguyen Duc Hoang (Mr)
Programming tutorial channel:
https://www.youtube.com/c/nguyenduchoang
Flutter, React, React Native, IOS development, Swift, Python, Angular
* */
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:myapp/global.dart';
class Todo {
  int id;
  String name;
  String dueDate;
  String description;
  //Constructor
  Todo({
    this.id,
    this.name,
    this.dueDate,
    this.description
  });
  //This is a static method
  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      id: json["id"],
      name: json["name"],
      dueDate: json["duedate"],
      description: json["description"]
    );
  }
}
//Fetch data from Restful API
Future<List<Todo>> fetchTodos(http.Client client) async {
  //How to make these URLs in a .dart file ?
  final response = await client.get(URL_TODOS);
  if(response.statusCode == 200) {
    Map<String, dynamic> mapResponse = json.decode(response.body);
    if(mapResponse["result"] == "ok") {
      final todos = mapResponse["data"].cast<Map<String, dynamic>>();
      final listOfTodos = await todos.map<Todo>((json) {
        return Todo.fromJson(json);
      }).toList();
      return listOfTodos;
    } else {
      return [];
    }
  } else {
    throw Exception('Failed to load Todo from the Internet');
  }
}
