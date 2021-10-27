/*
Nguyen Duc Hoang (Mr)
Programming tutorial channel:
https://www.youtube.com/c/nguyenduchoang
Flutter, React, React Native, IOS development, Swift, Python, Angular
Build a TodoList with Flutter(including Restful API with Nodejs)
Please see how to make Resful API in Nodejs for this lesson in NodejsTutorial video List
* */
import 'package:flutter/material.dart';
import 'TodoScreen.dart';
//Define "root widget"
void main() => runApp(MyApp());//one-line function

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //build function returns a "Widget"
    final materialApp = MaterialApp(
      title: '',
      home: TodoScreen(),
    );
    return materialApp;
  }
}







