import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;


Widget noData() {
  return Container(
    padding: EdgeInsets.all(16),
    child: Text("No Data Available!"),
  );
}

Widget error(var error) {
  return Container(
    padding: EdgeInsets.all(16),
    child: Text(error.toString()),
  );
}

Widget connectionError() {
  return Container(
    padding: EdgeInsets.all(16),
    child: Text("Connection Error!"),
  );
}

Widget loading() {
  return Container(
    child: Padding(
      padding: const EdgeInsets.only(
        top: 16,
        bottom: 16,
      ),
      child: Center(
        child: CircularProgressIndicator(),
      ),
    ),
  );
}

String parseHumanDateTime(String dateTime) {
  Duration timeAgo = DateTime.now().difference(DateTime.parse(dateTime));
  DateTime theDifference = DateTime.now().subtract(timeAgo);
  return timeago.format(theDifference);
}

Widget drawSingleTextFormField({
  TextEditingController controller,
  String labelText,
  String validatorWarning,
  IconData icon,
  bool secure,
  int maxLines,
}) {
  return TextFormField(
    controller: controller,
    decoration: InputDecoration(
      labelText: labelText,
      prefixIcon: Icon(icon),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
    ),
    obscureText: secure,
    maxLines: maxLines,
    validator: (value) {
      if (value.isEmpty) {
        return validatorWarning;
      }
      return null;
    },
  );
}