import 'package:flutter/material.dart';

class WidgetSpace extends StatelessWidget {
  const WidgetSpace({Key? key, this.child, this.space = 0.0}) : super(key: key);
  final dynamic child;
  final double space;
  @override
  Widget build(BuildContext context) => Column(
        children: <Widget>[
          child,
          SizedBox(
            height: space,
          )
        ],
      );
}
