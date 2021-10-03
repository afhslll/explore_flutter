import 'package:flutter/material.dart';

class WidgetScreen extends StatefulWidget {
  const WidgetScreen({Key key}) : super(key: key);

  @override
  _WidgetScreenState createState() => _WidgetScreenState();
}

class _WidgetScreenState extends State<WidgetScreen> {
  final Future<String> _futureData =
      Future<String>.delayed(const Duration(seconds: 2), () => 'Data loaded');

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _wrapExapmle(),
          _futureBuilderExample(),
        ],
      ),
    );
  }

  Widget _wrapExapmle() {
    return Container(
      color: Colors.teal,
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
