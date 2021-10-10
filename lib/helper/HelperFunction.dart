import 'package:angle_one_task/widgets/WidgetAlertDialog.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class HelperFunction {
  static showCommonDialog(BuildContext context,
      {Function positiveButton, Function no, String title, Widget content}) {
    showDialog(
        context: context,
        builder: (context) {
          return WidgetAlertDialog(
              title: title,
              content: content,
              positiveButton: positiveButton,
              no: no);
        });
  }

  static pageTransitionType() {
    return PageTransitionType.rightToLeft;
  }

  static hideKeyboard(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      FocusManager.instance.primaryFocus.unfocus();
    }
  }
}
