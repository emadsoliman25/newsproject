import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  final void Function(String) onTextChange;
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        padding: EdgeInsets.all(8),
        child: TextField(
            onChanged: onTextChange,
            decoration: InputDecoration(
                fillColor: Colors.black.withOpacity(0.1),
                filled: true,
                prefixIcon: Icon(Icons.search),
                hintText: 'Search something ...',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
                contentPadding: EdgeInsets.zero
            )
        )
    );
  }
}



