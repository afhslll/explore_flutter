import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Alignment _alignment = Alignment.centerLeft;

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
              Container(
                height: 50,
                child: Row(
                  children: [
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            _alignment = Alignment.centerLeft;
                          });
                        },
                        child: Container(width: 50, color: Colors.orange)),
                    Expanded(
                      child: AnimatedContainer(
                          color: _alignment == Alignment.centerLeft
                              ? Colors.yellow
                              : Colors.green,
                          alignment: _alignment,
                          duration: const Duration(seconds: 2),
                          curve: Curves.fastOutSlowIn,
                          child: Text('Expanded')),
                    ),
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            _alignment = Alignment.centerRight;
                          });
                        },
                        child: Container(width: 50, color: Colors.orange)),
                  ],
                ),
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
