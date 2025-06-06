import 'package:flutter/material.dart';
import 'package:myapp/color_theme/color_theme.dart';

class HomeNavigationBar extends StatefulWidget {
  const HomeNavigationBar({super.key});

  @override
  State<HomeNavigationBar> createState() => _HomeNavigationBarState();
}

class _HomeNavigationBarState extends State<HomeNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      // Suggested code may be subject to a license. Learn more: ~LicenseLog:293401831.
      decoration: BoxDecoration(
        color: Color(ColorTheme.mainThemeBlueColor),
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // TODO: 네비게이션 바 아이템들 추가하기
        ],
      ),
    );
  }
}
