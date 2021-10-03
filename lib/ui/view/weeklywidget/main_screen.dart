import 'package:explore_flutter/ui/view/weeklywidget/animation_screen.dart';
import 'package:explore_flutter/ui/view/weeklywidget/widget_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weekly Widget'),
      ),
      body: PageView(
        children: const [
          WidgetScreen(),
          AnimationScreen(),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          print('FAB pressed');
        },
        label: Text('FAB'),
        icon: Icon(Icons.thumb_up),
      ),
    );
  }
}
