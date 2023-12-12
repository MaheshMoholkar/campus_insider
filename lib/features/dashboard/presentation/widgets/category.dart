import 'package:campus_insider/core/constants/constants.dart';
import 'package:campus_insider/features/dashboard/data/models/category_model.dart';
import 'package:flutter/material.dart';

class CategorySection extends StatelessWidget {
  CategorySection(BuildContext context, {Key? key}) : super(key: key);

  final List<CategoryModel> categories = CategoryModel.getCategories();
  
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Center(
          child: Text(
            'Categories',
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600),
          ),
        ),
        const SizedBox(height: 15),
        NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (overscroll) {
            overscroll.disallowIndicator();
            return true;
          },
          child: GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 20.0,
              childAspectRatio: 1.3,
            ),
            itemCount: categories.length,
            padding: const EdgeInsets.only(left: 20, right: 20),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  _onCategoryPressed(context, categories[index].name, ArticleQueryType.byCategories);
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.blueAccent.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(16)
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: const BoxDecoration(
                            color: Colors.white, shape: BoxShape.circle
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Icon(categories[index].icon,
                            color: Colors.blueAccent,
                            size: 24,
                          ),
                        ),
                      ),
                      Text(
                        categories[index].name,
                        style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                            fontSize: 18
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
  void _onCategoryPressed(BuildContext context, String queryValue, ArticleQueryType queryType) {
    Navigator.pushNamed(
      context,
      'DailyNews',
      arguments: {
        'queryValue': queryValue,
        'queryType': queryType,
      },
    );
  }

}
