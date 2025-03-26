import 'package:flutter/material.dart';

const int searchBarColor = 0xffA1E3F9;

class SearchingBar extends StatelessWidget {
  final ValueChanged<String> onTextChanged;

  const SearchingBar({required this.onTextChanged});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: SingleChildScrollView(
        child: TextField(
          onChanged: onTextChanged,
          decoration: InputDecoration(
            filled: true,
            fillColor: Color(searchBarColor),
            prefixIcon: Icon(Icons.search),
            hintText: '약 이름으로 검색하세요!',
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              borderSide: BorderSide(width: 1, color: Color(searchBarColor)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              borderSide: BorderSide(width: 1, color: Color(searchBarColor)),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
          ),
        ),
      ),
    );
  }
}
