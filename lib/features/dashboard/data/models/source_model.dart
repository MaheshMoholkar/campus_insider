import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class SourceModel {
  static List<Map<String, String>> getSources() {
    List<Map<String, String>> sources = [
      {'displayName': 'BBC News', 'idName': 'bbc-news'},
      {'displayName': 'Google News', 'idName': 'google-news'},
      {'displayName': 'Hacker News', 'idName': 'hacker-news'},
      {'displayName': 'IGN', 'idName': 'ign'},
      {'displayName': 'Independent', 'idName': 'independent'},
      {'displayName': 'Medical News', 'idName': 'medical-news'},
      {'displayName': 'MSNBC', 'idName': 'msnbc'},
      {'displayName': 'MTV News', 'idName': 'mtv-news'},
      {'displayName': 'Nat Geo', 'idName': 'nat-geo'},
      {'displayName': 'National Review', 'idName': 'national-review'},
      {'displayName': 'NBC News', 'idName': 'nbc-news'},
      {'displayName': 'News.com.au', 'idName': 'news-com-au'},
      {'displayName': 'Newsweek', 'idName': 'newsweek'},
      {'displayName': 'NY Magazine', 'idName': 'ny-magazine'},
      {'displayName': 'Next Big Future', 'idName': 'next-big-future'},
      {'displayName': 'NFL News', 'idName': 'nfl-news'},
      {'displayName': 'NHL News', 'idName': 'nhl-news'},
      {'displayName': 'Politico', 'idName': 'politico'},
      {'displayName': 'Polygon', 'idName': 'polygon'},
      {'displayName': 'Recode', 'idName': 'recode'},
      {'displayName': 'Reuters', 'idName': 'reuters'},
    ];

    return sources;
  }
}
