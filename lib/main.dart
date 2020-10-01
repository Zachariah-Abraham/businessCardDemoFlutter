import 'package:flutter/material.dart';
import 'BusinessCardPage.dart';

void main() {
  runApp(ShoopyDemo());
}

class ShoopyDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ShoopyDemo',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BusinessCardPage(),
    );
  }
}