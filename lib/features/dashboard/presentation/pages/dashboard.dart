import 'package:campus_insider/features/daily_news/presentation/pages/saved_article/saved_article.dart';
import 'package:campus_insider/features/dashboard/presentation/widgets/home.dart';
import 'package:campus_insider/features/dashboard/presentation/widgets/searchbar.dart';
import 'package:campus_insider/features/dashboard/presentation/widgets/source.dart';
import 'package:campus_insider/features/dashboard/presentation/widgets/category.dart';
import 'package:flutter/material.dart';
import 'package:campus_insider/features/dashboard/presentation/widgets/app_bar.dart';
import 'package:google_nav_bar/google_nav_bar.dart';



class Dashboard extends StatefulWidget {
  Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SearchField(),
          const SizedBox(height: 20,),
          Expanded(
            child: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              controller: _tabController,
              children: [
                HomeSection(context),
                CategorySection(context),
                SourceSection(),
                const SavedArticles()
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: GNav(
        gap: 8,
        tabs: [
          GButton(
              icon: Icons.home,
              text: 'Home',
              iconColor: Colors.blue,
              onPressed: () {
                _tabController.animateTo(0);
              },
          ),
          GButton(
            icon: Icons.category,
            text: 'Cat.',
            iconColor: Colors.blue,
            onPressed: () {
              _tabController.animateTo(1);
            },
          ),
          GButton(
            icon: Icons.source,
            text: 'Src.',
            iconColor: Colors.blue,
            onPressed: () {
              _tabController.animateTo(2);
            },
          ),
          GButton(
            icon: Icons.bookmark,
            text: 'Saved',
            iconColor: Colors.blue,
            onPressed: () => {
              _tabController.animateTo(3)
            },
          ),
        ],
        selectedIndex: _tabController.index,
        onTabChange: (index) {
          _tabController.animateTo(index);
        },
      ),
    );
  }
}