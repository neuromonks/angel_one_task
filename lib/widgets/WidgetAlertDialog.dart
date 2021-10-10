import 'package:flutter/material.dart';

class WidgetAlertDialog extends StatelessWidget {
  final title;
  Widget content;
  Function positiveButton, no;
  WidgetAlertDialog({this.title, this.content, this.positiveButton, this.no});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: content,
      actions: <Widget>[
        FlatButton(
          child: Text(
            'No',
            style: TextStyle(color: Colors.red),
          ),
          onPressed: () {
            if (no != null) {
              no();
            } else {
              Navigator.of(context).pop();
            }
          },
        ),
        FlatButton(
            child: Text(
              'Yes',
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
            onPressed: () {
              Navigator.of(context).pop();
              positiveButton();
            }),
      ],
    );
  }
}
