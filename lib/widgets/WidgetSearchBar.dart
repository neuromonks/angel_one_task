import 'package:flutter/material.dart';

class WidgetSearchBar extends StatefulWidget {
  String hint;
  final void Function(String) onTextChange, onSubmitted;

  WidgetSearchBar({this.hint, this.onTextChange, this.onSubmitted});

  @override
  _WidgetSearchBarState createState() => _WidgetSearchBarState();
}

class _WidgetSearchBarState extends State<WidgetSearchBar> {
  bool showCross = false;
  final controllerText = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 4),
        child: TextField(
            controller: controllerText,
            onChanged: (value) {
              widget.onTextChange(value);
              setState(() {
                showCross = true;
              });
            },
            onSubmitted: (value) {
              if (widget.onSubmitted != null) widget.onSubmitted(value);
            },
            autofocus: false,
            decoration: InputDecoration(
                fillColor: Colors.black.withOpacity(0.1),
                filled: true,
                prefixIcon: Icon(Icons.search),
                suffixIcon: showCross
                    ? IconButton(
                        padding: EdgeInsets.zero,
                        icon: Icon(Icons.clear),
                        onPressed: () {
                          controllerText.clear();
                          widget.onTextChange("");
                          setState(() {
                            showCross = false;
                          });
                        },
                      )
                    : Icon(
                        Icons.ac_unit,
                        size: 0,
                      ),
                hintText: widget.hint,
                hintStyle: TextStyle(
                    fontSize: 14, wordSpacing: 0.5, letterSpacing: 0.4),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide.none),
                contentPadding: EdgeInsets.zero)));
  }
}
