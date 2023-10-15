import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class CategoryModel {
  String name;
  IconData icon;
  Color boxColor;

  CategoryModel({
    required this.name,
    required this.icon,
    required this.boxColor
  });

  static List<CategoryModel> getCategories() {
    List<CategoryModel> categories = [];
    
    categories.add(
      CategoryModel(
        name: 'Business',
        icon: Ionicons.bag,
        boxColor: const Color(0XFF92A3FD)
      )
    );
    categories.add(
      CategoryModel(
        name: 'Social',
        icon: Ionicons.people_outline,
        boxColor: const Color(0XFFC58BF2)
      )
    );
    categories.add(
      CategoryModel(
        name: 'Health',
        icon: Ionicons.heart,
          boxColor: const Color(0XFF92A3FD)
      )
    );
    categories.add(
      CategoryModel(
        name: 'Science',
        icon: Ionicons.rocket_outline,
          boxColor: const Color(0XFFC58BF2)
      )
    );
    categories.add(
      CategoryModel(
        name: 'Sports',
          icon: Ionicons.baseball_outline,
          boxColor: const Color(0XFF92A3FD)
      )
    );
    categories.add(
      CategoryModel(
        name: 'Technology',
        icon: Ionicons.telescope_outline,
          boxColor: const Color(0XFFC58BF2)
      )
    );

    return categories;
  }
}
