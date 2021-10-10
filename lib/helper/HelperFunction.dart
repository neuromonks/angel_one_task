import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:intl/intl.dart';

class HelperFunction {
  // static showCommonDialog(BuildContext context,
  //     {Function positiveButton, Function no, String title, Widget content}) {
  //   showDialog(
  //       context: context,
  //       builder: (context) {
  //         return WidgetAlertDialog(
  //             title: title,
  //             content: content,
  //             positiveButton: positiveButton,
  //             no: no);
  //       });
  // }

  static pageTransitionType() {
    return PageTransitionType.rightToLeft;
  }

  static showFlushbarSuccess(BuildContext context, String msg) {
    // Flushbar(
    //   margin: EdgeInsets.all(8),
    //   borderRadius: 8,
    //   backgroundColor: Colors.green,
    //   flushbarPosition: FlushbarPosition.TOP,
    //   message: msg,
    //   duration: Duration(seconds: 3),
    // )..show(context);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
          content: Container(
            width: double.maxFinite,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Image.asset('assets/images/success.png', height: 60),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Text(
                      'Yay!!',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                  Text('$msg')
                ],
              ),
            ),
          ),
          actionsPadding: EdgeInsets.only(bottom: 10),
          actions: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'OK',
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            )
          ],
        );
      },
    );
  }

  static showFlushbarError(BuildContext context, String msg) {
    // Flushbar(
    //   margin: EdgeInsets.all(8),
    //   borderRadius: 8,
    //   backgroundColor: Colors.red,
    //   flushbarPosition: FlushbarPosition.TOP,
    //   message: msg,
    //   duration: Duration(seconds: 3),
    // )..show(context);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
          content: Container(
            width: double.maxFinite,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/error.png',
                    height: 60,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Text(
                      'Ohh!!',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                  Text(
                    '$msg',
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ),
          actionsPadding: EdgeInsets.only(bottom: 10),
          actions: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'DISMISS',
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            )
          ],
        );
      },
    );
  }

  static hideKeyboard(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      FocusManager.instance.primaryFocus.unfocus();
    }
  }

  static String dateFormat(String format, DateTime dateTime) {
    return new DateFormat(format).format(dateTime);
  }

  static String dateStringFromat(String format, String dateTime) {
    return new DateFormat(format).format(DateTime.parse(dateTime)).toString();
  }
}
