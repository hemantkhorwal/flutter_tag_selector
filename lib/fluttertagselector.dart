library fluttertagselector;

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:fluttertagselector/tag_class.dart';

class TagGenrator extends StatefulWidget {
  final List<Tags> tagList;
  final bool fillRandomColor;
  final Color fixedColor;
  TagGenrator(
      {Key key,
      @required this.tagList,
      @required this.fillRandomColor,
      this.fixedColor})
      : assert(
            fillRandomColor == true ||
                (fillRandomColor == false && fixedColor == null),
            "fixedColor can't be empty.");

  @override
  _TagGenratorState createState() => _TagGenratorState();
}

class _TagGenratorState extends State<TagGenrator> {
  List<Tags> tagList;
  bool isRandomColor;
  List<String> selectedCategories = new List();
  List<Color> colors;
  int iconSize = 22;
  bool randomColor = false;
  int counter = 0;

  @override
  void initState() {
    super.initState();
    this.tagList = widget.tagList;
    this.isRandomColor = widget.fillRandomColor;
    this.colors = getColorList();

    isRandomColor ? randomColorApplyer() : fixedColorApplyer(widget.fixedColor);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
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
                color: Colors.white,
                size: 22,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5.0, right: 10.0),
            child: Text(
              "${data.getTitle()}",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
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
      Colors.blueGrey
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
