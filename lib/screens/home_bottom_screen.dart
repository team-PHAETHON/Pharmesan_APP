import 'package:flutter/material.dart';
import 'package:myapp/widget/grey_touch_horizontal_button.dart';

const double cornerRadius = 20;
const double minChildSize = 0.65;
const double maxChildSize = 0.8;

class HomeBottomScreen extends StatefulWidget {
  @override
  _HomeBottomScreenState createState() => _HomeBottomScreenState();
}

class _HomeBottomScreenState extends State<HomeBottomScreen> {
  late DraggableScrollableController _controller;

  @override
  void initState() {
    super.initState();
    _controller = DraggableScrollableController();
  }

  void changeSize() {
    final currentSize = _controller.size;
    if (currentSize < maxChildSize) {
      /// ✅ 현재 크기가 작으면 maxChildSize로 확장
      _controller.animateTo(
        maxChildSize,
        duration: Duration(milliseconds: animationTime),
        curve: Curves.easeInOut,
      );
    } else {
      /// ✅ 이미 최대 크기면 minChildSize로 축소
      _controller.animateTo(
        minChildSize,
        duration: Duration(milliseconds: animationTime),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      controller: _controller,
      initialChildSize: minChildSize,
      minChildSize: minChildSize,
      maxChildSize: maxChildSize,
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(cornerRadius),
            ),
          ),
          child: Column(
            children: [
              GreyTouchHorizontalButton(onTap: changeSize),
              Flexible(
                /// TODO: 메인화면에 기능 추가 및 수정 예정
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      children: List.generate(
                        20,
                        (index) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text("HELLO $index"),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
