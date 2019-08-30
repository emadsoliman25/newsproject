import 'dart:math';

import 'package:flutter/material.dart';
import 'package:news_app/models/post.dart';

class SinglePost extends StatefulWidget {
  final Post post;

  SinglePost(this.post);

  @override
  _SinglePostState createState() => _SinglePostState();
}

class _SinglePostState extends State<SinglePost> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(widget.post.featuredImage),
                      fit: BoxFit.cover),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              // ignore: missing_return
              (context, position) {
                if (position == 0) {
                  return _drawPostDetails();
                } else if (position >= 1 && position < 24) {
                  return _comments();
                } else {
                  return _commentTextEntry();
                }
              },
              childCount: 25,
            ),
          ),
        ],
      ),
    );
  }

  Color getRandomColor({int minBrightness = 50}) {
    final random = Random();
    assert(minBrightness >= 0 && minBrightness <= 255);
    return Color.fromARGB(
      0xFF,
      minBrightness + random.nextInt(255 - minBrightness),
      minBrightness + random.nextInt(255 - minBrightness),
      minBrightness + random.nextInt(255 - minBrightness),
    );
  }

  Widget _drawPostDetails() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          widget.post.content,
          style: TextStyle(
            fontSize: 18,
            letterSpacing: 1.2,
            height: 1.3,
          ),
        ),
      ),
    );
  }

  Widget _comments() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              CircleAvatar(
                backgroundImage: ExactAssetImage("assets/images/ss.jpg"),
              ),
              SizedBox(
                width: 16,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Emad Soliman",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text('1 hour'),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          Text(
              "I can't bieleve that for any thing and i think it is a big trouble"),
        ],
      ),
    );
  }

  Widget _commentTextEntry() {
    return Container(
      color: Color.fromRGBO(241, 245, 247, 1),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Flexible(
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Add Comment Here..',
                    contentPadding: EdgeInsets.only(
                      left: 16,
                      top: 24,
                      bottom: 28,
                    ),
                  ),
                ),
              ),
              FlatButton(
                onPressed: () {},
                child: Text(
                  'SEND',
                  style: TextStyle(
                    color: Colors.indigo,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
