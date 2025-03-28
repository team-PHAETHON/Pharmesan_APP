import 'package:flutter/material.dart';
import 'package:myapp/screens/medicine_information_screen.dart';
import 'package:myapp/service/db_server.dart';
import 'package:myapp/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pharmesan',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MedicineInformationScreen(),
    );
  }
}
      // body: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: <Widget>[
      //       Row(
      //         mainAxisAlignment: MainAxisAlignment.start,
      //         children: [Container(width: 75), Text("Pharmesan")],
      //       ),
      //       Text('${response}'),
      //       ElevatedButton(
      //         onPressed: callSpringServer,
      //         child: Text('call API'),
      //       ),
      //     ],
      //   ),
      // ),