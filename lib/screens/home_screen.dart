import 'package:flutter/material.dart';
import 'package:news_app/shared_ui/navigation_drawer.dart';
import 'home_tabs/whats_new_screen.dart';
import 'home_tabs/popular_screen.dart';
import 'home_tabs/favourities_screen.dart';
import 'package:news_app/screens/pop_up_screens/about_screen.dart';
import 'package:news_app/screens/pop_up_screens/help_screen.dart';
import 'package:news_app/screens/pop_up_screens/settings_screen.dart';
import 'package:news_app/screens/pop_up_screens/contact_screen.dart';
import 'package:news_app/shared_ui/search_bar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();

}

enum PopOutMenu {
  HELP,
  ABOUT,
  CONTACT,
  SETTINGS,
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
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
          'Explore',
        ),
        centerTitle: false,
        actions: <Widget>[
//          IconButton(
//            icon: Icon(Icons.search),
//            onPressed: () {
//              return SearchBar();
//            },
//          ),
          _popOutMenu(context),
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
            WhatsNew(),
            Popular(),
            Favourities(),
          ],
          controller: _tabController,
        ),
      ),
    );
  }

  Widget _popOutMenu(BuildContext context) {
    return PopupMenuButton<PopOutMenu>(
      itemBuilder: (context) {
        return [
          PopupMenuItem<PopOutMenu>(
            value: PopOutMenu.ABOUT,
            child: Text("ABOUT"),
          ),
//          PopupMenuItem(
//            value: PopOutMenu.HELP,
//            child: Text("HELP"),
//          ),
//          PopupMenuItem(
//            value: PopOutMenu.SETTINGS,
//            child: Text("SETTINGS"),
//          ),
          PopupMenuItem(
            value: PopOutMenu.CONTACT,
            child: Text("CONTACT"),
          ),
        ];
      },
      onSelected: (PopOutMenu menu) {
        switch (menu) {
          case PopOutMenu.ABOUT:
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return AboutUs();
            }));
            break;
          case PopOutMenu.CONTACT:
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return ContactUs();
            }));
            break;
          case PopOutMenu.HELP:
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return Help();
            }));
            break;
          case PopOutMenu.SETTINGS:
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return Settings();
            }));
            break;
        }
      },
      icon: Icon(Icons.more_vert),
    );
  }
}
