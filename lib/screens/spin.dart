import 'dart:math';
import 'package:flutter/material.dart';
import 'board_view.dart';
import 'bottombar.dart';
import 'model.dart';

//The wheel of fortune - Gives the coupon of reduction

class spin extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _spinState();
  }
}

class _spinState extends State<spin>
    with SingleTickerProviderStateMixin {
  double _angle = 0;
  double _current = 0;
  late AnimationController _ctrl;
  late Animation _ani;
  List<Luck> _items = [
    Luck("perdu", Colors.accents[6]),
    Luck("perdu", Colors.accents[2]),
    Luck("10", Colors.accents[4]),
    Luck("perdu", Colors.accents[6]),
    Luck("15", Colors.accents[8]),
    Luck("perdu", Colors.accents[10]),
    Luck("20", Colors.accents[12]),
    Luck("perdu", Colors.accents[14]),
    Luck("perdu", Colors.accents[10]),
    Luck("5", Colors.accents[14]),

  ];

  get key => null;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var _duration = Duration(milliseconds: 5000);
    _ctrl = AnimationController(vsync: this, duration: _duration);
    _ani = CurvedAnimation(parent: _ctrl, curve: Curves.fastLinearToSlowEaseIn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:FloatingActionButton(
        onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>bar()));},
        child: Icon(Icons.clear,color: Colors.black,),
        backgroundColor: Color(0xfffee6ea) ,
        elevation: 0,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,

      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xfffee6ea), Color(0xfffee6ea)])),
        child: AnimatedBuilder(
            animation: _ani,
            builder: (context, child) {
              final _value = _ani.value;
              final _angle = _value * this._angle;
              return Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  BoardView(items: _items, current: _current, angle: _angle, key: key,),
                  _buildGo(),
                  _buildResult(_value),
                ],
              );
            }),
      ),
    );
  }

  _buildGo() {
    return Material(
      color: Colors.white,
      shape: CircleBorder(),
      child: InkWell(
        customBorder: CircleBorder(),
        child: Container(
          alignment: Alignment.center,
          height: 72,
          width: 72,
          child: Text(
            "GO",
            style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
          ),
        ),
        onTap: _animation,
      ),
    );
  }

  _animation() {
    if (!_ctrl.isAnimating) {
      var _random = Random().nextDouble();
      _angle = 20 + Random().nextInt(5) + _random;
      _ctrl.forward(from: 0.0).then((_) {
        _current = (_current + _random);
        _current = _current - _current ~/ 1;
        _ctrl.reset();
      });
    }
  }

  int _calIndex(value) {
    var _base = (2 * pi / _items.length / 2) / (2 * pi);
    return (((_base + value) % 1) * _items.length).floor();
  }

  _buildResult(_value) {
    var _index = _calIndex(_value * _angle + _current);
    String _asset = _items[_index].asset;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Image.asset(_asset, height: 100, width: 100),
      ),
    );
  }
}
