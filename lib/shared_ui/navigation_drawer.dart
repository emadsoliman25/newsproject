import 'package:flutter/material.dart';
import 'package:news_app/models/nav_menu.dart';
import 'package:news_app/screens/home_screen.dart';
import 'package:news_app/screens/headline_news.dart';
import 'package:news_app/screens/feeds_screens/twitter_feed.dart';
import 'package:news_app/screens/feeds_screens/instagram_feed.dart';
import 'package:news_app/screens/feeds_screens/facebook_feed.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:news_app/screens/submit_screens/login_screen.dart';
class NavigationDrawer extends StatefulWidget {
  @override
  _NavigationDrawerState createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  String token;
  static bool isLoggedIn = false;
  SharedPreferences sharedPreferences;
  List<NavMenuItem> navigationMenu = [
    NavMenuItem("Explore", () => HomeScreen()),
    NavMenuItem("Headline News", () => HeadLineNews()),
    NavMenuItem("Twitter Feed", () => TwitterFeed()),
    NavMenuItem("Instagram Feed", () => InstagramFeed()),
    NavMenuItem("Facebook Feed", () => FaceBookFeed()),
  ];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(isLoggedIn){
      navigationMenu.add(NavMenuItem("Logout", () => _logout()));
    }
  }

  @override
  Widget build(BuildContext context) {
    if(this.mounted){
      _checkToken();
    }
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.only(
          top: 15,
          left: 5,
        ),
        child: ListView.builder(
          itemBuilder: (context, position) {
            return ListTile(
              title: Text(
                navigationMenu[position].title,
                style: TextStyle(
                  color: Colors.grey.shade700,
                  fontSize: 20,
                ),
              ),
              trailing: Icon(
                Icons.chevron_right,
                color: Colors.grey.shade400,
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => navigationMenu[position].destination()));
              },
            );
          },
          itemCount: navigationMenu.length,
        ),
      ),
    );
  }
  _checkToken()async{
    sharedPreferences = await SharedPreferences.getInstance();
    token = sharedPreferences.get("token");
    setState(() {
      if(token == null){
        isLoggedIn = false;
      }else{
        isLoggedIn = true;
      }
    });
  }
  _logout(){
      sharedPreferences.remove("token");
      return Login();
  }
}
