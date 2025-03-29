import 'package:flutter/material.dart';
import 'package:myapp/screens/medicine_information_screen.dart';

const int searchBarColor = 0xffA1E3F9;

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
          builder: (context) => MedicineInformationScreen(medicineName: query),
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
            fillColor: Color(searchBarColor),
            prefixIcon: Icon(Icons.search),
            hintText: '약 이름으로 검색하세요!',
            suffixIcon: IconButton(
              onPressed: _onSearch,
              icon: Icon(Icons.arrow_forward),
            ),
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
