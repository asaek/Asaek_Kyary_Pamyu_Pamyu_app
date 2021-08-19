import 'package:flutter/material.dart';

class HorizontalDividerWithoutHTTP extends StatelessWidget {
  final String leftLabel;
  final String rightLabel;
  final double? height;
  final Color? colorLinea;

  const HorizontalDividerWithoutHTTP({
    required this.leftLabel,
    required this.rightLabel,
    this.height = 20,
    this.colorLinea = Colors.pink,
  });

  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      Text(leftLabel),
      Expanded(
        child: new Container(
            margin: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Divider(
              color: colorLinea,
              height: height,
              thickness: 1,
            )),
      ),
      Text(rightLabel),
    ]);
  }
}
