import 'package:flutter/material.dart';
import 'package:news_app/shared_ui/navigation_drawer.dart';

class FaceBookFeed extends StatefulWidget {
  @override
  _FaceBookFeedState createState() => _FaceBookFeedState();
}

class _FaceBookFeedState extends State<FaceBookFeed> {

  TextStyle _hashTagStyle = TextStyle(
    color: Colors.indigo,
  );
  
  List<int> ids = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Facebook Feeds  "),
        centerTitle: false,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      drawer: NavigationDrawer(),
      body: ListView.builder(
        itemBuilder: (context, position) {
          return Padding(
            padding: const EdgeInsets.only( bottom: 3,top: 5,),
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _drawCardHeader(position),
                  _drawCardTitle(),
                  _drawHashTags(),
                  _drawCardBody(),
                  _drawCardFooter(),
                ],
              ),
            ),
          );
        },
        itemCount: 20,
      ),
    );
  }

  Widget _drawCardHeader(int position) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: CircleAvatar(
            backgroundImage: ExactAssetImage('assets/images/ss.jpeg'),
            radius: 24,
          ),
        ),
        Expanded(
          child: Column(
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
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Text("Fri, 12 May 2019 . 14:30"),
            ],
          ),
        ),
        Row(
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.favorite,
                color:(ids.contains(position))? Colors.red:Colors.grey,
              ),
              onPressed: () {
                if(ids.contains(position)){
                  ids.remove(position);
                }else{
                  ids.add(position);
                }
                setState(() {
                  
                });
              },
            )
          ],
        ),
      ],
    );
  }

  Widget _drawCardTitle() {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 8,
        left: 16,
        right: 16,
        top: 8,
      ),
      child: Text(
        "We also talk about one of the most popular food ",
        style: TextStyle(
          fontSize: 14,
          color: Colors.grey.shade900,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  Widget _drawCardBody() {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.3,
      child: Image(
        image: ExactAssetImage('assets/images/falafel.jpg'),
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _drawCardFooter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        FlatButton(
          onPressed: () {},
          child: Text(
            "10 COMMENTS",
            style: _hashTagStyle,
          ),
        ),
        Row(
          children: <Widget>[
            FlatButton(
              onPressed: () {},
              child: Text(
                "SHARE",
                style: _hashTagStyle,
              ),
            ),
            FlatButton(
              onPressed: () {},
              child: Text(
                "OPEN",
                style: _hashTagStyle,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _drawHashTags() {
    return Container(
      child: Wrap(
        children: <Widget>[
          FlatButton(
            onPressed: () {},
            child: Text(
              "#falafel",
              style: _hashTagStyle,
            ),
          ),
          FlatButton(
            onPressed: () {},
            child: Text(
              "#food",
              style: _hashTagStyle,
            ),
          ),
          FlatButton(
            onPressed: () {},
            child: Text(
              "#facebook",
              style: _hashTagStyle,
            ),
          ),
        ],
      ),
    );
  }
}

