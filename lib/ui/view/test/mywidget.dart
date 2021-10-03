import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  final String title;
  final String message;

  const MyWidget({
    @required this.title,
    @required this.message,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(child: Container()),
      ),
    );
  }
}
