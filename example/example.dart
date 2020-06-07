import 'package:flutter/material.dart';
import 'package:fluttertagselector/fluttertagselector.dart';
import 'package:fluttertagselector/tag_class.dart';

class Example extends StatelessWidget {
  final List<Tags> tagList = [
    Tags("Label 1",Icons.map),
    Tags("Label 2",Icons.headset),
    Tags("Label 3",Icons.info),
    Tags("Label 4",Icons.cake),
    Tags("Label 5",Icons.ac_unit),
  ];
  @override
  Widget build(BuildContext context) {
    return TagGenrator(tagList: tagList, fillRandomColor: true);
  }
}
