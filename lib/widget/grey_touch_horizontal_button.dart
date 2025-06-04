import 'package:flutter/material.dart';

const double dragBarTopMargin = 10;
const double dragBarRadius = 10;
const double dragBarWidth = 50;
const double dragBarHeight = 5;
const int animationTime = 300;
const double minChildSize = 0.7;
const double maxChildSize = 0.8;

class GreyTouchHorizontalButton extends StatelessWidget {
  final DraggableScrollableController controller;

  const GreyTouchHorizontalButton({required this.controller, super.key});

  void changeSize() {
    final currentSize = controller.size;
    if (currentSize < maxChildSize) {
      /// ✅ 현재 크기가 작으면 maxChildSize로 확장
      controller.animateTo(
        maxChildSize,
        duration: Duration(milliseconds: animationTime),
        curve: Curves.easeInOut,
      );
    } else {
      /// ✅ 이미 최대 크기면 minChildSize로 축소
      controller.animateTo(
        minChildSize,
        duration: Duration(milliseconds: animationTime),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: changeSize,

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
