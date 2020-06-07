library fluttertagselector;

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:fluttertagselector/tag_class.dart';

class TagGenrator extends StatefulWidget {
  final List<Tags> tagList;
  final bool fillRandomColor;
  final Color fixedColor;
  final Color iconColor;
  final double iconSize;
  final double fontSize;
  TagGenrator(
      {Key key,
      @required this.tagList,
      @required this.fillRandomColor,
      this.fixedColor,
      this.iconColor,
      this.iconSize,
      this.fontSize})
      : assert(
            fillRandomColor !=null ||
                (fillRandomColor == false && fixedColor == null),
            "fixedColor can't be empty.");

  @override
  _TagGenratorState createState() => _TagGenratorState();
}

class _TagGenratorState extends State<TagGenrator> {
  List<Tags> tagList;
  bool fillRandomColor;
  List<String> selectedCategories = new List();
  List<Color> colors;
  double iconSize;
  double fontSize;
  Color iconColor = Colors.white;

  @override
  void initState() {
    super.initState();
    this.tagList = widget.tagList;
    widget.iconColor == null
        ? this.iconColor = Colors.white
        : this.iconColor = widget.iconColor;
    widget.fontSize == null
        ? this.fontSize = 16
        : this.fontSize = widget.fontSize;
    widget.iconSize == null
        ? this.iconSize = 22
        : this.iconSize = widget.iconSize;

    this.fillRandomColor = widget.fillRandomColor;
    this.colors = getColorList();
    fillRandomColor
        ? randomColorApplyer()
        : fixedColorApplyer(widget.fixedColor);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 50),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Wrap(
        children: tagList.map((e) => _buildTag(e)).toList(),
      ),
    );
  }

  Container _buildTag(Tags data) {
    return Container(
      margin: const EdgeInsets.only(right: 8.0, bottom: 15.0),
      decoration: BoxDecoration(
        color: data.getColor(),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                data.isSlected ? data.isSlected = false : data.isSlected = true;
                data.isSlected
                    ? selectedCategories.add(data.getTitle())
                    : selectedCategories.remove("" + data.getTitle());
                data.isSlected
                    ? data.tagIcon = Icons.check
                    : data.tagIcon = data.developerDefinedIcon;
              });
            },
            child: AnimatedContainer(
              padding: const EdgeInsets.all(4.0),
              duration: Duration(milliseconds: 100),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.white60,
              ),
              child: new Icon(
                data.getIcon(),
                color: iconColor,
                size: iconSize,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5.0, right: 10.0),
            child: Text(
              "${data.getTitle()}",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: fontSize),
            ),
          ),
        ],
      ),
    );
  }

  static List<Color> getColorList() {
    return [
      Colors.orangeAccent,
      Colors.redAccent,
      Colors.lightBlueAccent,
      Colors.purpleAccent,
      Colors.pinkAccent,
      Colors.blueGrey,
      Colors.lightGreen,
    ];
  }

  int genrateRandom(int old) {
    int newRandom = new Random().nextInt(colors.length - 1);
    if (old == newRandom) {
      genrateRandom(old);
    }
    return newRandom;
  }

  void randomColorApplyer() {
    int temp = colors.length + 1;
    for (int i = 0; i <= tagList.length - 1; i++) {
      temp = genrateRandom(temp);
      tagList[i].setTagColor(colors[temp]);
    }
  }

  fixedColorApplyer(Color fixedColor) {
    for (int i = 0; i <= tagList.length - 1; i++) {
      tagList[i].setTagColor(fixedColor);
    }
  }
}
