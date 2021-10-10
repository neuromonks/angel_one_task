import 'package:flutter/material.dart';

class WidgetError extends StatelessWidget {
  String title;
  WidgetError({this.title});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.warning),
        Text(title == null ? 'Something went wrong' : '$title')
      ],
    );
  }
}
