import 'package:flutter/material.dart';
class Logout extends StatefulWidget {
  @override
  _LogoutState createState() => _LogoutState();
}

class _LogoutState extends State<Logout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LOG OUT"),
        centerTitle: true,
      ),
      body: Center(
        child: Text("LOG OUT"),
      ),
    );
  }
}
