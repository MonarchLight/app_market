import '../screens/favorites_screen.dart';

import '../screens/categories_screen.dart';
import 'package:flutter/material.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Food"),
          bottom: TabBar(
            indicatorColor: Colors.white,
            unselectedLabelColor: Colors.black26,
            tabs: [
              Tab(
                icon: Icon(Icons.category),
                text: "Category",
              ),
              Tab(
                icon: Icon(Icons.star),
                text: "Favorites",
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            CategoriesScreen(),
            FavoritesScreen(),
          ],
        ),
      ),
    );
  }
}
