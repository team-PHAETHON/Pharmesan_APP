import 'package:flutter/material.dart';
import 'package:myapp/color_theme/color_theme.dart';
import 'package:myapp/screens/search_result_medicine_catalog_screen.dart';

const String hintText = "약 이름으로 검색하세요!";
const double focusingRadius = 30.0;
const double basicRadius = 10.0;
const double borderWidth = 1.0;

class SearchingBar extends StatefulWidget {
  final ValueChanged<String> onSearch;

  const SearchingBar({required this.onSearch});

  @override
  _SearchingBarState createState() => _SearchingBarState();
}

class _SearchingBarState extends State<SearchingBar> {
  final TextEditingController _controller = TextEditingController();

  void _onSearch() {
    String query = _controller.text.trim();
    if (query.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder:
              (context) =>
                  SearchResultMedicineCatalogScreen(medicineName: query),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: SingleChildScrollView(
        child: TextField(
          controller: _controller,
          onSubmitted: (_) => _onSearch(),
          decoration: InputDecoration(
            filled: true,
            fillColor: Color(ColorTheme.searchBarColor),
            prefixIcon: Icon(Icons.search),
            hintText: hintText,
            suffixIcon: IconButton(
              onPressed: _onSearch,
              icon: Icon(Icons.arrow_forward),
            ),
            focusedBorder: OutlineInputBorder(
              // 사용자가 필드에 입력중일 때
              borderRadius: BorderRadius.all(
                Radius.circular(focusingRadius),
              ),
              borderSide: BorderSide(
                width: borderWidth,
                color: Color(ColorTheme.searchBarColor),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              // 사용자가 입력은 할 수 있지만, 비활성화 상태일 때
              borderRadius: BorderRadius.all(
                Radius.circular(focusingRadius),
              ),
              borderSide: BorderSide(
                width: borderWidth,
                color: Color(ColorTheme.searchBarColor),
              ),
            ),
            border: OutlineInputBorder(
              // 기본 상태일 때
              borderRadius: BorderRadius.all(Radius.circular(basicRadius)),
            ),
          ),
        ),
      ),
    );
  }
}
