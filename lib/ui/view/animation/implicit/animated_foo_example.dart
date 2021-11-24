import 'package:explore_flutter/core/enum/animated_foo.dart';
import 'package:flutter/material.dart';

class AnimatedFooExample extends StatefulWidget {
  @override
  _AnimatedFooExampleState createState() => _AnimatedFooExampleState();
}

class _AnimatedFooExampleState extends State<AnimatedFooExample>
    with SingleTickerProviderStateMixin {
  AnimatedFoo _dropdownValue = AnimatedFoo.align;
  AlignmentGeometry _alignmentGeometry = Alignment.topRight;
  bool _isSelected = false;
  Key _key = UniqueKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('AnimatedFoo Example'),
        ),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Container(
                  width: double.infinity,
                  child: DropdownButton<AnimatedFoo>(
                    isExpanded: true,
                    value: _dropdownValue,
                    onChanged: (value) {
                      print('selected ${value.toString()}');
                      setState(() {
                        _dropdownValue = value;
                      });
                    },
                    items: AnimatedFoo.values
                        .map((AnimatedFoo value) =>
                            DropdownMenuItem<AnimatedFoo>(
                              value: value,
                              child: Text(value.toString()),
                            ))
                        .toList(),
                  )),
              Expanded(
                child: Center(
                    child: Container(
                  height: 300,
                  width: 300,
                  color: Colors.blueAccent,
                  child: Column(
                    children: [
                      Expanded(
                          child: Container(
                              color: Colors.lightBlue,
                              child: _buildAnimationOption())),
                      FlatButton(
                          onPressed: () {
                            _changeState();
                          },
                          child: Text('Animate'))
                    ],
                  ),
                )),
              ),
            ],
          ),
        ));
  }

  Widget _buildAnimationOption() {
    switch (_dropdownValue) {
      case AnimatedFoo.align:
        return _buildAnimatedAlign();
      case AnimatedFoo.container:
        return _buildAnimatedContainer();
      case AnimatedFoo.text:
        return _buildAnimatedText();
      case AnimatedFoo.opacity:
        return _buildAnimatedOpacity();
      case AnimatedFoo.padding:
        return _buildAnimatedPadding();
      case AnimatedFoo.physicalModel:
        return _buildAnimatedPhysicalModel();
      case AnimatedFoo.positioned:
        return _buildAnimatedPositioned();
      case AnimatedFoo.positionedDirectional:
        return _buildAnimatedPositionedDirectional();
      case AnimatedFoo.theme:
        return _buildAnimatedTheme();
      case AnimatedFoo.crossFade:
        return _buildAnimatedCrossFade();
      case AnimatedFoo.size:
        return _buildAnimatedSize();
      case AnimatedFoo.switcher:
        return _buildAnimatedSwitcher();
      default:
        return _buildAnimatedAlign();
    }
  }

  void _changeState() {
    setState(() {
      _key = UniqueKey();
      _alignmentGeometry = _alignmentGeometry == Alignment.topRight
          ? Alignment.bottomLeft
          : Alignment.topRight;
      _isSelected = !_isSelected;
    });
  }

  Widget _buildAnimatedSwitcher() {
    return Center(
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        transitionBuilder: (Widget child, Animation<double> animation) {
          return ScaleTransition(
            scale: animation,
            child: child,
          );
        },
        child: Container(
          key: _key,
          height: 100,
          width: 100,
          decoration:
              BoxDecoration(shape: BoxShape.circle, color: Colors.black),
        ),
      ),
    );
  }

  Widget _buildAnimatedSize() {
    return Align(
      alignment: Alignment.center,
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.all(8),
        child: AnimatedSize(
          duration: Duration(seconds: 1),
          curve: Curves.easeIn,
          vsync: this,
          child: Container(
              width: _isSelected ? 50 : 100,
              height: _isSelected ? 50 : 100,
              color: Colors.purple),
        ),
      ),
    );
  }

  Widget _buildAnimatedCrossFade() {
    return Container(
      width: double.infinity,
      child: AnimatedCrossFade(
        alignment: Alignment.center,
        duration: Duration(seconds: 1),
        firstCurve: Curves.easeIn,
        secondCurve: Curves.easeOut,
        firstChild: Container(
          width: 100,
          height: 100,
          decoration:
              BoxDecoration(shape: BoxShape.rectangle, color: Colors.black),
        ),
        secondChild: Container(
          width: 100,
          height: 100,
          decoration:
              BoxDecoration(shape: BoxShape.circle, color: Colors.purple),
        ),
        layoutBuilder: (topChild, topChildKey, bottomChild, bottomChildKey) =>
            Stack(
          children: [
            Positioned(
                key: bottomChildKey, left: 100, top: 100, child: bottomChild),
            Positioned(
              key: topChildKey,
              top: 50,
              left: 50,
              child: topChild,
            )
          ],
        ),
        crossFadeState:
            _isSelected ? CrossFadeState.showFirst : CrossFadeState.showSecond,
      ),
    );
  }

  Widget _buildAnimatedTheme() {
    return Center(
      child: AnimatedTheme(
          duration: Duration(seconds: 1),
          curve: Curves.ease,
          data: _isSelected
              ? ThemeData(
                  buttonColor: Colors.purple,
                )
              : ThemeData(
                  buttonColor: Colors.black,
                ),
          child: RaisedButton(
            onPressed: () {},
            child: Text('Button', style: TextStyle(color: Colors.white)),
          )),
    );
  }

  Widget _buildAnimatedPositionedDirectional() {
    return Stack(
      children: [
        AnimatedPositionedDirectional(
          start: _isSelected ? 10 : 50,
          end: _isSelected ? 10 : 50,
          duration: const Duration(milliseconds: 500),
          curve: Curves.fastOutSlowIn,
          top: _isSelected ? 70 : 20,
          bottom: _isSelected ? 70 : 20,
          child: Container(
              color: Colors.black,
              child: Text(
                'Learn to do animation in flutter',
                style: TextStyle(color: Colors.white, fontSize: 30),
              )),
        ),
      ],
    );
  }

  Widget _buildAnimatedPositioned() {
    return Stack(
      fit: StackFit.expand,
      alignment: Alignment.center,
      children: [
        Align(alignment: Alignment.center, child: Text('Hey!')),
        AnimatedPositioned(
          curve: Curves.linear,
          top: _isSelected ? 70 : 100,
          duration: Duration(milliseconds: 500),
          child: Container(height: 40, width: 80, color: Colors.black),
        )
      ],
    );
  }

  Widget _buildAnimatedPhysicalModel() {
    return Center(
      child: AnimatedPhysicalModel(
        shape: BoxShape.rectangle,
        color: Colors.black,
        shadowColor: Colors.grey,
        duration: Duration(milliseconds: 500),
        elevation: _isSelected ? 0 : 10,
        borderRadius: _isSelected
            ? BorderRadius.all(Radius.circular(0))
            : BorderRadius.all(Radius.circular(20)),
        curve: Curves.linear,
        child: Container(
          height: 100,
          width: 100,
        ),
      ),
    );
  }

  Widget _buildAnimatedPadding() {
    return GridView.count(
      crossAxisCount: 2,
      scrollDirection: Axis.vertical,
      padding: EdgeInsets.zero,
      children: List.generate(
          4,
          (index) => AnimatedPadding(
                duration: Duration(seconds: 1),
                curve: Curves.easeInOut,
                padding: EdgeInsets.all(_isSelected ? 12 : 8),
                child: Container(
                  color: Colors.black,
                ),
              )),
    );
  }

  Widget _buildAnimatedOpacity() {
    return Center(
      child: AnimatedOpacity(
          duration: Duration(seconds: 2),
          opacity: _isSelected ? 0.3 : 1.0,
          child: Container(
            height: 50,
            width: 50,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.black),
          )),
    );
  }

  Widget _buildAnimatedText() {
    return Center(
      child: AnimatedDefaultTextStyle(
        curve: Curves.bounceInOut,
        duration: Duration(seconds: 3),
        style: TextStyle(
          fontSize: _isSelected ? 40 : 20,
          fontWeight: _isSelected ? FontWeight.bold : FontWeight.normal,
          color: _isSelected ? Colors.black : Colors.white,
        ),
        child: Text('Flutter'),
      ),
    );
  }

  Widget _buildAnimatedContainer() {
    return Center(
      child: AnimatedContainer(
        width: _isSelected ? 200 : 100,
        height: _isSelected ? 100 : 200,
        color: _isSelected ? Colors.black : Colors.blue,
        duration: Duration(seconds: 3),
        curve: Curves.fastLinearToSlowEaseIn,
        alignment: _isSelected ? Alignment.topLeft : Alignment.bottomRight,
        child: Container(
          width: 50,
          height: 50,
          decoration:
              BoxDecoration(shape: BoxShape.circle, color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildAnimatedAlign() {
    return AnimatedAlign(
        alignment: _alignmentGeometry,
        curve: Curves.linear,
        duration: Duration(seconds: 3),
        child: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.black,
          ),
        ));
  }

  @override
  void dispose() {
    super.dispose();
  }
}
