import 'package:explore_flutter/core/constant/path_constant.dart';
import 'package:explore_flutter/ui/view/weeklywidget/widget/fading_car.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Alignment _alignment = Alignment.centerLeft;
  double _carOpacity = 1.0;
  final Future<String> _futureData =
      Future<String>.delayed(const Duration(seconds: 2), () => 'Data loaded');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weekly Widget'),
      ),
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
              _futureBuilderExample(),
              FadingCar(),
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

  Widget _futureBuilderExample() {
    return FutureBuilder(
        future: _futureData,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          List<Widget> children;
          if (snapshot.hasData) {
            children = <Widget>[
              Icon(Icons.done, color: Colors.green),
              Text('${snapshot.data}'),
            ];
          } else if (snapshot.hasError) {
            children = <Widget>[
              Icon(Icons.error, color: Colors.red),
              Text('Error 500'),
            ];
          } else {
            children = <Widget>[
              CircularProgressIndicator(),
              Text('Loading'),
            ];
          }
          return Column(
            children: children,
          );
        });
  }
}
