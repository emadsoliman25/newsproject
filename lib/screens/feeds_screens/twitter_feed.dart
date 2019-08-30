import 'package:flutter/material.dart';
import 'package:news_app/shared_ui/navigation_drawer.dart';

class TwitterFeed extends StatefulWidget {
  @override
  _TwitterFeedState createState() => _TwitterFeedState();
}

class _TwitterFeedState extends State<TwitterFeed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Twitter Feed"),
        centerTitle: false,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          )
        ],
      ),
      drawer: NavigationDrawer(),
      body: ListView.builder(
        itemBuilder: (context, position) {
          return Card(
            child: Column(
              children: <Widget>[
                _drawCardHeader(),
                _drawCardBody(),
                _drawDivider(),
                _drawCardFooter(),
              ],
            ),
          );
        },
        itemCount: 20,
      ),
    );
  }

  Widget _drawCardHeader() {
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: CircleAvatar(
            backgroundImage: ExactAssetImage('assets/images/ss.jpg'),
            radius: 24,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  "Emad Abdullah Soliman ",
                  style: TextStyle(
                    color: Colors.indigo,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text("  @ea.solimsn225",style: TextStyle(
                  fontWeight: FontWeight.w400
                ),),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Text("Fri, 12 May 2019 . 14:30"),
          ],
        ),
      ],
    );
  }

  Widget _drawCardBody() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        bottom: 22,
      ),
      child: Text(
        "We also talk about the future of work as the robots advance,and we ask whether a retro phone",
        style: TextStyle(
          fontSize: 18,
        ),
      ),
    );
  }

  Widget _drawCardFooter() {
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12, bottom: 12,top: 8,),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: Icon(
              Icons.repeat,
              size: 28,
            ),
            color: Colors.indigo,
            onPressed: () {},
          ),
          Row(
            children: <Widget>[
              FlatButton(
                  onPressed: () {},
                  child: Text(
                    "SHARE",
                    style: TextStyle(
                      color: Colors.indigo,
                      fontSize: 16,
                    ),
                  )),
              FlatButton(
                  onPressed: () {},
                  child: Text(
                    "OPEN",
                    style: TextStyle(
                      color: Colors.indigo,
                      fontSize: 16,
                    ),
                  )),
            ],
          ),
        ],
      ),
    );
  }

  Widget _drawDivider() {
    return Container(
      height: 1,
      width: double.infinity,
      color: Colors.indigo.shade100,
    );
  }

}
