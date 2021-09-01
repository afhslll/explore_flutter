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
              ),
              Container(
                color: Colors.blue,
                height: 200,
                width: double.infinity,
                child: Wrap(
                    spacing: 8.0,
                    runSpacing: 4.0,
                    alignment: WrapAlignment.center,
                    runAlignment: WrapAlignment.center,
                    direction: Axis.vertical,
                    children: List.generate(
                      7,
                      (index) => Chip(
                        avatar: CircleAvatar(
                            backgroundColor: Colors.blue.shade900,
                            child: const Icon(Icons.person,
                                color: Colors.white, size: 16)),
                        label: Text('Afifah $index'),
                      ),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
