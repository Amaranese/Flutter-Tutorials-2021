/*
Nguyen Duc Hoang (Mr)
Programming tutorial channel:
https://www.youtube.com/c/nguyenduchoang
Flutter, React, React Native, IOS development, Swift, Python, Angular
* */
import 'package:flutter/material.dart';

//Define "root widget"
void main() => runApp(new MyApp());//one-line function

class MyApp extends StatelessWidget {
  //Stateless = immutable = cannot change object's properties
  //Every UI components are widgets
  @override
  Widget build(BuildContext context) {
    //Now we need multiple widgets into a parent = "Container" widget
    Widget titleSection = new Container(
      padding: const EdgeInsets.all(10.0),//Top, Right, Bottom, Left
      child: new Row(
        children: <Widget>[
          new Expanded(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Container(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: new Text("Programming tutorials Channel",
                        style: new TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0
                        )),
                  ),
                  //Need to add space below this Text ?
                  new Text("This channel contains tutorial videos in Flutter, "
                      "React Native, React, Angular",
                    style: new TextStyle(
                        color: Colors.grey[850],
                        fontSize: 16.0
                    ),
                  ),
                ],
              ),
          ),
          new Icon(Icons.favorite, color: Colors.red),
          new Text(" 100", style: new TextStyle(fontSize: 16.0),),
        ],
      ),
    );
    //build function returns a "Widget"
    return new MaterialApp(
      title: "",
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Flutter App'),
        ),
        body: new ListView(
          children: <Widget>[
            new Image.asset(
              'images/tutorialChannel.png',
              fit: BoxFit.cover
            ),
            //You can add more widget bellow
            titleSection
          ],
        )
      )
    );//Widget with "Material design"
  }
}

