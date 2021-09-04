import 'package:explore_flutter/core/constant/path_constant.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Alignment _alignment = Alignment.centerLeft;
  double _carOpacity = 1.0;

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
              _animatedContainerExample(),
              _wrapExapmle(),
              _opacityExample(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _animatedContainerExample() {
    return Container(
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
    );
  }

  Widget _wrapExapmle() {
    return Container(
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
                child: const Icon(Icons.person, color: Colors.white, size: 16)),
            label: Text('Afifah $index'),
          ),
        ),
      ),
    );
  }

  Widget _opacityExample() {
    return Row(
      children: [
        Opacity(
          opacity: 0.5,
          child: Image.asset(
            ConstantAssetsString.carIcon,
            height: 80,
          ),
        ),
        AnimatedOpacity(
          opacity: _carOpacity,
          duration: const Duration(seconds: 2),
          child: Image.asset(
            ConstantAssetsString.carIcon,
            height: 80,
          ),
        ),
        Slider(
          value: _carOpacity,
          min: 0,
          max: 1,
          divisions: 5,
          label: _carOpacity.round().toString(),
          onChanged: (double value) {
            setState(() {
              _carOpacity = value;
            });
          },
        ),
      ],
    );
  }
}
