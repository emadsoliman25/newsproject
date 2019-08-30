import 'dart:math';

import 'package:flutter/material.dart';
import 'package:news_app/api/posts_api.dart';
import 'package:news_app/models/post.dart';
import 'package:news_app/utilities/data_utilities.dart';
import 'package:news_app/screens/single_post.dart';

class WhatsNew extends StatefulWidget {
  @override
  _WhatsNewState createState() => _WhatsNewState();
}

class _WhatsNewState extends State<WhatsNew> {
  PostsApi postsApi = PostsApi();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _drawHeader(),
          _drawTopStories(context),
          _drawRecentUpdates(context),
        ],
      ),
    );
  }

  Widget _drawHeader() {
    TextStyle _headerTitle = TextStyle(
      color: Colors.white,
      fontSize: 24,
    );
    TextStyle _headerDescription = TextStyle(
      color: Colors.white,
      fontSize: 16,
    );
    return FutureBuilder(
       future: postsApi.fetchPostsByCategoryId("1"),
      // ignore: missing_return
      builder: (context,AsyncSnapshot snapShot){

         switch(snapShot.connectionState){
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
             if(snapShot.hasError){
               return error(snapShot.error);
             }else{
               if(snapShot.hasData){
                 List<Post> posts = snapShot.data;
                 Random random = Random();
                 var randomIndex = random.nextInt(posts.length);
                 Post post = posts[randomIndex];
                 return GestureDetector(
                   onTap: (){
                     Navigator.push(context, MaterialPageRoute(builder: (context){
                       return SinglePost(post);
                     }));
                   },
                   child: Container(
                     width: MediaQuery.of(context).size.width,
                     height: MediaQuery.of(context).size.height * 0.3,
                     decoration: BoxDecoration(
                       image: DecorationImage(
                         image: NetworkImage(post.featuredImage),
                         fit: BoxFit.cover,
                       ),
                     ),
                     child: Center(
                       child: Padding(
                         padding: const EdgeInsets.all(12),
                         child: Card(
                           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                           elevation: 2,
                           color: Colors.transparent,
                           child: Padding(
                             padding: const EdgeInsets.all(4.0),
                             child: Column(
                               mainAxisAlignment: MainAxisAlignment.center,
                               children: <Widget>[
                                 Text(
                                   post.title,
                                   style: _headerTitle,
                                   textAlign: TextAlign.center,
                                 ),
                                 SizedBox(
                                   height: 20,
                                 ),
                                 Text(post.content.substring(0 , 100), style: _headerDescription,
                                   textAlign: TextAlign.center,
                                 ),
                               ],
                             ),
                           ),
                         ),
                       ),
                     ),
                   ),
                 );
               }else{
                 return noData();
               }
             }
             break;
         }
      },
    );
  }

  Widget _drawTopStories(BuildContext context) {
    return Container(
      color: Colors.grey.shade50,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
              left: 16,
              top: 16,
            ),
            child: _drawSectionTitle('Top Stories'),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Card(
              child: FutureBuilder(
                future: postsApi.fetchPostsByCategoryId("1"),
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
                        return error(snapShot.error);
                      } else {
                        if (snapShot.hasData) {
                          List<Post> posts = snapShot.data;
                          if (posts.length >= 3) {
                            Post post1 = posts[0];
                            Post post2 = posts[1];
                            Post post3 = posts[2];
                            return Column(
                              children: <Widget>[
                                _drawSingleRow(post1),
                                _drawDivider(),
                                _drawSingleRow(post2),
                                _drawDivider(),
                                _drawSingleRow(post3),
                              ],
                            );
                          }else{
                            return noData();
                          }
                        } else {
                          return noData();
                        }
                      }
                      break;
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _drawRecentUpdates(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: FutureBuilder(
        future: postsApi.fetchPostsByCategoryId("2"),
        // ignore: missing_return
        builder: (context,AsyncSnapshot snapShot){
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
                return error(snapShot.error);
              } else {
                if (snapShot.hasData) {
                  List<Post> posts = snapShot.data;
                  if (posts.length >= 2) {
                    Post post1 = snapShot.data[0];
                    Post post2 = snapShot.data[1];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 16,
                            bottom: 8,
                            top: 8,
                          ),
                          child: _drawSectionTitle('Recent Updates'),
                        ),
                        _drawRecentUpdateCard(Colors.indigo,post1),
                        _drawRecentUpdateCard(Colors.purple,post2),
                        SizedBox(
                          height: 48,
                        ),
                      ],
                    );
                  }else{
                    return noData();
                  }
                } else {
                  return noData();
                }
              }
              break;
          }
        },
      ),
    );
  }

  Widget _drawDivider() {
    return Container(
      height: 1,
      width: double.infinity,
      color: Colors.grey.shade300,
    );
  }

  Widget _drawSingleRow(Post post) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return SinglePost(post);
        }));
      },
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                left: 4,
                top: 8,
                bottom: 8,
              ),
              child: Row(
                children: <Widget>[
                  SizedBox(
                    child: Image.network(
                      post.featuredImage,
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
                                Text(parseHumanDateTime(post.dataWritten),
                                    style:
                                        TextStyle(fontWeight: FontWeight.w600)),
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
          ],
        ),
      ),
    );
  }



  Widget _drawSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        color: Colors.grey.shade700,
        fontWeight: FontWeight.w600,
        fontSize: 16,
      ),
    );
  }

  Widget _drawRecentUpdateCard(Color color, Post post) {
    return Card(
      child: GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return SinglePost(post);
          }));
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(post.featuredImage),
                  fit: BoxFit.cover,
                ),
              ),
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.3,
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 16,
                left: 16,
              ),
              child: Container(
                padding: EdgeInsets.only(
                  left: 30,
                  right: 30,
                  bottom: 2,
                  top: 2,
                ),
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  'FOOD',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 16,
                right: 16,
                top: 16,
                bottom: 8,
              ),
              child: Text(
                post.title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
                top: 8,
                bottom: 16,
              ),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.access_time,
                    color: Colors.grey,
                    size: 18,
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Text(
                    parseHumanDateTime(post.dataWritten),
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
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
