import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:httprequest_datamysql/Sample.dart';

void main() => runApp (MaterialApp (
  theme: ThemeData(
    primaryColor: Colors.red,
    accentColor: Colors.orangeAccent,
    primarySwatch: Colors.blue,
  ),
  home: MainApp (),
));

class MainApp extends StatefulWidget{
  @override 
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  String _jsonContent = " ";

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter JSON", style: TextStyle(color: Colors.white,),),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    onPressed: (){
                        _loadSampleJson();
                    },
                    child: Text("Read JSON FIle"),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: Text(_jsonContent, textAlign: TextAlign.center),)
            ]
          ),
        ),
      ),
    );
  }


// Configurate to load json file
Future _loadSampleJson() async {                  // Run this code with asynchronous
  String jsonString = await
  rootBundle.loadString("assets/sample.json");
  final jsonData = json.decode(jsonString);
  Sample sample = Sample.fromJson(jsonData);
  setState((){
      _jsonContent = sample.toString();
    });
  }
}
