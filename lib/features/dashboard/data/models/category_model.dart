import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class CategoryModel {
  String name;
  IconData icon;

  CategoryModel({
    required this.name,
    required this.icon
  });

  static List<CategoryModel> getCategories() {
    List<CategoryModel> categories = [];
    
    categories.add(
      CategoryModel(
        name: 'Business',
        icon: Ionicons.bag,
      )
    );
    categories.add(
      CategoryModel(
        name: 'Entertainment',
        icon: Ionicons.people
      )
    );
    categories.add(
      CategoryModel(
        name: 'Health',
        icon: Ionicons.heart
      )
    );
    categories.add(
      CategoryModel(
        name: 'Science',
        icon: Ionicons.rocket
      )
    );
    categories.add(
      CategoryModel(
        name: 'Sports',
          icon: Ionicons.baseball
      )
    );
    categories.add(
      CategoryModel(
        name: 'Technology',
        icon: Ionicons.telescope
      )
    );

    return categories;
  }
}
