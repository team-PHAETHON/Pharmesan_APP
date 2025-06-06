import 'package:flutter/material.dart';

const double dragBarTopMargin = 10;
const double dragBarRadius = 10;
const double dragBarWidth = 50;
const double dragBarHeight = 5;
const int animationTime = 300;
const double minChildSize = 0.65;
const double maxChildSize = 0.8;

class GreyTouchHorizontalButton extends StatelessWidget {
  final VoidCallback? onTap;

  const GreyTouchHorizontalButton({required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,

      /// 드래그 용 회색 수직 바
      child: Container(
        width: dragBarWidth,
        height: dragBarHeight,
        margin: EdgeInsets.symmetric(vertical: dragBarTopMargin),
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(dragBarRadius),
        ),
      ),
    );
  }
}
