import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:myapp/color_theme/color_theme.dart';

class CameraFloatingButton extends StatelessWidget {
  const CameraFloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Color(ColorTheme.mainThemeBlueColor),
      onPressed: (){
      // TODO: 카메라 촬영 기능 구현
    },
    child: Icon(Icons.camera_alt, color: Color.fromARGB(255, 255, 255, 255)),
    );
  }
}
