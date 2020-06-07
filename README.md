# Welcome to Flutter Tag Selector!

The **fluttertagselector** is a flutter package which you can use to create bubble tag selector as show in the below screen shots.

You can check it on [pub.dev](https://pub.dev/packages/fluttertagselector)



# Use this package as a library

### 1. Depend on it

Add this to your package's pubspec.yaml file:

```yaml

dependencies:
  fluttertagselector: ^0.0.3


```

### 2. Install it

You can install packages from the command line:

with Flutter:

```shell

$ flutter pub get


```

Alternatively, your editor might support `flutter pub get`. Check the docs for your editor to learn more.

### 3. Import it

Now in your Dart code, you can use:

```dart

import 'package:fluttertagselector/fluttertagselector.dart';

```

## How to use :

```dart
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
```

## Parameter you can use in TagGenrator

| Parameter | Type  |   Use
|:--:|:--:| :--:|
| tagList | List of Class Tags | to pass the tags
| fillRandomColor | bool | to fill tag background with random color
|fixedColor | Color | if fillRandomColor == false then you have to pass a fix background color
|iconColor | Color | icon color
|iconSize | double | icon size
|fontSize | double | label fontSize
