import 'package:flutter/material.dart';

class Tags {
  final String tagTitle;
  final IconData developerDefinedIcon;

  IconData tagIcon;
  bool isSlected = false;
  Color tagColor;

  String getTitle() {
    return tagTitle;
  }

  setTagColor(Color c) {
    this.tagColor = c;
  }

  Color getColor() {
    return tagColor;
  }

  IconData getIcon() {
    if (tagIcon == null) tagIcon = developerDefinedIcon;
    return tagIcon;
  }

  Tags(this.tagTitle, this.developerDefinedIcon)
      : assert(tagTitle != null && developerDefinedIcon != null);
}
