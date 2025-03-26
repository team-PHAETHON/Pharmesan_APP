import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:myapp/screens/home_bottom_screen.dart';
import 'package:myapp/widget/header_section.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String searchSentence = "";

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          HeaderSection(
            size: size,
            onTextChanged: (text) {
              setState(() {
                searchSentence = text;
              });
            },
          ),
          HomeBottomScreen()
        ],
      ),
    );
  }
}
