import 'package:flutter/material.dart';

import './menu.dart';
import './encyclopaedia.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
        accentColor: Colors.lightGreen
      ),
      home: FullScaffold()
    );
  }
}

class FullScaffold extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _FullScaffold();
  }
}

class _FullScaffold extends State<FullScaffold> {

  late Encyclopaedia encyclopaedia;
  late Menu menu;

  _FullScaffold() {
    encyclopaedia = Encyclopaedia();
    menu = Menu(updateContent);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: encyclopaedia,
      bottomNavigationBar: menu
    );
  }

  // I need a way to update the encyclopaedia after someone has pressed the button.
  // I pass a reference to this function to the Menu Widget, which should execute this function when the Search Button is pressed
  // Note for testing it does not pass the string in the Search Box - only "A"
  // Once this function is called, SetState should cause a rebuild of the encyclopaedia

  // The above does not work - the encyclopaedia does not update

  void updateContent() {
    setState(() {
      encyclopaedia.searchEntry = "A";
    });
  }
}