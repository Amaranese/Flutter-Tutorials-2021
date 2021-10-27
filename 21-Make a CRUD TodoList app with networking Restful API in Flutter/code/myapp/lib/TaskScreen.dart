/*
Nguyen Duc Hoang (Mr)
Programming tutorial channel:
https://www.youtube.com/c/nguyenduchoang
Flutter, React, React Native, IOS development, Swift, Python, Angular
* */
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'models/task.dart';
import 'DetailTaskScreen.dart';

class TaskScreen extends StatefulWidget {
  final int todoId;
  //constructor
  TaskScreen({this.todoId}):super();
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TaskScreenState();
  }
}
class _TaskScreenState extends State<TaskScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("List of tasks"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: (){
              //Press this button to navigate to detail Task
            },
          )
        ],
      ),
      body: FutureBuilder(
          future: fetchTasks(http.Client(), widget.todoId),
          builder: (context, snapshot){
            if (snapshot.hasError) print(snapshot.error);
            return snapshot.hasData
                ? TaskList(tasks: snapshot.data)
                : Center(child: CircularProgressIndicator());
          }),
    );
  }
}
class TaskList extends StatelessWidget {
  final List<Task> tasks;
  TaskList({Key key, this.tasks}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
        itemBuilder: (context, index) {
          return GestureDetector(
            child: Container(
              padding: EdgeInsets.all(10.0),
              color: index % 2 == 0 ? Colors.deepOrangeAccent : Colors.amber,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment:CrossAxisAlignment.start,
                children: <Widget>[
                  Text(this.tasks[index].name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)),
                  new Text('Finished: ${tasks[index].finished==true?"Yes":"No"}', style: TextStyle(fontSize: 16.0))
                ],
              ),
            ),
            onTap: () {
              int selectedId = tasks[index].id;
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => new DetailTaskScreen(id: selectedId))
              );
            } ,
          );
        },
      itemCount: this.tasks.length,
    );
  }
}