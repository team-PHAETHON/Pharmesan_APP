import 'package:flutter/material.dart';
import 'package:myapp/screens/home_bottom_screen.dart';
import 'package:myapp/service/db_server.dart';
import 'package:myapp/widget/camera_floating_button.dart';
import 'package:myapp/widget/header_section.dart';
import 'package:myapp/widget/home_navigation_bar.dart';

const String initialString = "";

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    putMedicineInDB();
  }

  /// TODO: 이 함수는 TEST용. 후에 DB에 값이 들어오면 해당함수 삭제
  void putMedicineInDB() {
    for (var i = 1; i <= 5; i++) {
      saveMedicine(i.toString(), "약+$i", "이 약은 $i번째 약입니다");
      debugPrint("생성, 넣기 OK");
    }
  }

  String searchSentence = initialString;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double headerHeight = size.height * rateOfHeaderHeight;

    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: CameraFloatingButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: HomeNavigationBar(),
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
          HomeBottomScreen(),
        ],
      ),
    );
  }
}
