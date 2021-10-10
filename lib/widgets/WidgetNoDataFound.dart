import 'package:flutter/material.dart';

class WidgetNoDataFound extends StatelessWidget {
  String title;
  double height, width;
  WidgetNoDataFound({this.title, this.height, this.width});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          () {
            return 'assets/images/noDataFound.png';
          }(),
          height: height,
          width: width,
        ),
        Text('${title ?? "No data found"} ')
      ],
    );
  }
}
