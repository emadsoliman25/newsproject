import 'dart:math';
import 'package:flutter/material.dart';

class Favourities extends StatefulWidget {
  @override
  _FavouritiesState createState() => _FavouritiesState();
}

class _FavouritiesState extends State<Favourities> {
  List<Color> colorsList = [
    Colors.purple,
    Colors.indigo,
    Colors.red,
    Colors.amber,
    Colors.teal,
    Colors.lightGreenAccent,
    Colors.brown,
  ];

  Random random = Random();

  Color _getRandomColor() {
    return colorsList[random.nextInt(colorsList.length)];
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, position) {
        return Card(
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              children: <Widget>[
                _authorRow(),
                SizedBox(
                  height: 16,
                ),
                _newsItemRow(),
              ],
            ),
          ),
        );
      },
      itemCount: 20,
    );
  }

  Widget _authorRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: ExactAssetImage('assets/images/ss.jpg'),
                  fit: BoxFit.cover,
                ),
                shape: BoxShape.circle,
              ),
              width: 50,
              height: 50,
              margin: EdgeInsets.only(
                right: 16,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Emad Soliman',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: <Widget>[
                    Text(
                      '15 Min ',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      'life style',
                      style: TextStyle(
                        color: _getRandomColor(),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        IconButton(
          icon: Icon(Icons.bookmark_border),
          color: Colors.grey,
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _newsItemRow() {
    return Row(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: ExactAssetImage('assets/images/ss.jpeg'),
              fit: BoxFit.cover,
            ),
          ),
          width: 124,
          height: 124,
          margin: EdgeInsets.only(
            right: 16,
          ),
        ),
        Expanded(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                  top: 5,
                  bottom: 4,
                ),
                child: Text(
                  'Tech Tens : old phones and speed fast',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Text(
                'we can say that we live in the most prodectable generation with technology but it put us under control of it.',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                  height: 1.2,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
