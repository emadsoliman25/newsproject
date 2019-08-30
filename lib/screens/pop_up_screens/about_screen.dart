import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ABOUT US"),
        centerTitle: false,
      ),
      body: _drawSingleBox(context),
    );
  }

  Widget _drawSingleBox(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 7,
        height: MediaQuery.of(context).size.height * (0.4),
          child: Column(
            children: <Widget>[
              _drawSingleRow(
                Icons.account_balance,
                "News Paper \n 1234 FL Mansoura City \n ST 12345 - 0001",
              ),

              _drawSingleRow(Icons.phone, "066-88742387289 - 065-69347926896"),

              _drawSingleRow(Icons.email, "lang.jerry@example.net"),

              _drawSingleRow(Icons.account_circle, "www.facebook.com/news-paper/ijdilwhfuh"),

              _drawSingleRow(Icons.account_box, "www.twitter.com/news-paper/dajhcu"),
            ],
          ),

      ),
    );
  }

  Widget _drawSingleRow(
    IconData icon,
    String text,

  ) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          Icon(
            icon,
            size: 48,
            color: Colors.black54,
          ),
          SizedBox(
            width: 20,
          ),
          Text(
            text,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _divider() {
    return Container(
      width: double.infinity,
      height: 1,
      color: Colors.grey,
    );
  }
}
