import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

AppBar buildAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.white,
    title: const Text(
      'Dashboard',
      style: TextStyle(
        color: Colors.black,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    ),
    elevation: 0,
    centerTitle: true,
    leading: Container(
      margin: const EdgeInsets.all(10),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: const Color(0XFFF7F8F8),
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Icon(Ionicons.person, color: Colors.redAccent),
    ),
    actions: [
      GestureDetector(
        onTap: () => _onShowSavedArticlesViewTapped(context),
        child: Container(
          margin: const EdgeInsets.all(10),
          alignment: Alignment.center,
          width: 37,
          decoration: BoxDecoration(
            color: const Color(0XFFF7F8F8),
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Icon(Ionicons.log_out, color: Colors.red),
        ),
      ),
    ],
  );
}

void _onShowSavedArticlesViewTapped(BuildContext context) {
  Navigator.pushNamed(context, '/SavedArticles');
}
