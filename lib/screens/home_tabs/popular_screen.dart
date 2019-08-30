import 'package:flutter/material.dart';
import 'package:news_app/api/posts_api.dart';
import 'package:news_app/models/post.dart';
import 'package:news_app/screens/single_post.dart';
import 'package:news_app/utilities/data_utilities.dart';

class Popular extends StatefulWidget {
  @override
  _PopularState createState() => _PopularState();
}

class _PopularState extends State<Popular> {
  PostsApi postsApi = PostsApi();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: postsApi.fetchPostsByCategoryId("3"),
      // ignore: missing_return
      builder: (context, AsyncSnapshot snapShot) {
        switch (snapShot.connectionState) {
          case ConnectionState.waiting:
            return loading();
            break;
          case ConnectionState.active:
            return loading();
            break;
          case ConnectionState.none:
            return connectionError();
            break;
          case ConnectionState.done:
            if (snapShot.error != null) {
              error(snapShot.error);
            } else {
              if (snapShot.hasData) {
                List<Post> posts = snapShot.data;
                  return ListView.builder(
                    itemBuilder: (context, position) {
                      return Card(
                        child: _drawSingleRow(posts[position]),
                      );
                    },
                    itemCount: posts.length,
                  );
                } else {
                  noData();
                }
            }
            break;
        }
      },
    );
  }

  Widget _drawSingleRow(Post post) {
    return Padding(
            padding: const EdgeInsets.all(12.0),
            child: GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return SinglePost(post);
                }));
              },
              child: Row(
                children: <Widget>[
                  SizedBox(
                    child: Image(
                      image: NetworkImage(post.featuredImage),
                      fit: BoxFit.cover,
                    ),
                    width: 125,
                    height: 125,
                  ),
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 16,
                            top: 2,
                          ),
                          child: Text(
                            post.title,
                            maxLines: 2,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 45,
                        ),
                        Row(
                          children: <Widget>[
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Michael Adams',
                              style: TextStyle(fontWeight: FontWeight.w700),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Row(
                              children: <Widget>[
                                Icon(Icons.access_time),
                                Text(
                                  parseHumanDateTime(post.dataWritten),
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
