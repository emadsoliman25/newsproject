import 'package:flutter/material.dart';
import 'package:news_app/shared_ui/navigation_drawer.dart';

import 'home_tabs/favourities_screen.dart';
import 'home_tabs/popular_screen.dart';

class HeadLineNews extends StatefulWidget {
  @override
  _HeadLineNewsState createState() => _HeadLineNewsState();
}

class _HeadLineNewsState extends State<HeadLineNews> with SingleTickerProviderStateMixin{

  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(initialIndex: 0, length: 3, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Headline News',
        ),
        centerTitle: false,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
        bottom: TabBar(
          tabs: [
            Tab(
              text: "What's New",
            ),
            Tab(
              text: "Popular",
            ),
            Tab(
              text: "Favourities",
            ),
          ],
          controller: _tabController,
          indicatorColor: Colors.indigo,
        ),
      ),
      drawer: NavigationDrawer(),
      body: Center(
        child: TabBarView(
          children: [
            Favourities(),
            Popular(),
            Favourities(),
          ],
          controller: _tabController,
        ),
      ),
    );
  }
}
