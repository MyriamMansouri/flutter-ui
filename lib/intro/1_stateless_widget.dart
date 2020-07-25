import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Flutter Home',
    home: Home(),
  ));
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Hello, world!',
        textDirection: TextDirection.ltr,
      ),
    );
  }
}
