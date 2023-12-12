import 'package:campus_insider/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
  });

  // Method to be called when Enter key is pressed
  void _onSearchPressed(BuildContext context, String queryValue, ArticleQueryType queryType) {
    Navigator.pushNamed(
      context,
      'DailyNews',
      arguments: {
        'queryValue': queryValue,
        'queryType': queryType,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 35, left: 20, right: 20),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: const Color(0XFF1D1617).withOpacity(0.11),
            blurRadius: 40,
            spreadRadius: 0)
      ]),
      child: TextField(
        onSubmitted: (String searchText) {
          _onSearchPressed(context, searchText, ArticleQueryType.bySearch);
        },
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.all(15),
            hintText: 'Search Article',
            hintStyle: const TextStyle(
              color: Color(0XFFDDDADA),
              fontSize: 14,
            ),
            prefixIcon: const Icon(Ionicons.search, color: Colors.blue),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none)),
      ),
    );
  }
}
