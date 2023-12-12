import 'package:campus_insider/core/constants/constants.dart';
import 'package:campus_insider/features/dashboard/data/models/source_model.dart';
import 'package:flutter/material.dart';

class SourceSection extends StatelessWidget {
  SourceSection({Key? key}) : super(key: key);

  final List<Map<String, String>> sources = SourceModel.getSources();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Center(
          child: Text(
            'Sources',
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600
            ),
          ),
        ),
        const SizedBox(height: 15),
        Expanded(
          child: GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 20.0,
              childAspectRatio: 2.5,
            ),
            itemCount: sources.length,
            padding: const EdgeInsets.only(left: 20, right: 20),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  print(sources[index]['idName']);
                  _onSourcePressed(
                    context,
                    sources[index]['idName']!,
                    ArticleQueryType.bySources,
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.blueAccent.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(16)
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        sources[index]['displayName']!,
                        style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                            fontSize: 16
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

  void _onSourcePressed(BuildContext context, String queryValue, ArticleQueryType queryType) {
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
