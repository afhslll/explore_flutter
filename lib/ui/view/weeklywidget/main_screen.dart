import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        bottom: true,
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Container(height: 50, width: 50, color: Colors.orange),
                  Expanded(
                    child: Container(
                        height: 50,
                        color: Colors.yellow,
                        child: Center(child: Text('Expanded'))),
                  ),
                  Container(height: 50, width: 50, color: Colors.orange),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
