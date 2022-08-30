import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class UI5 extends StatefulWidget {
  const UI5({Key? key}) : super(key: key);

  @override
  State<UI5> createState() => _UI5State();
}

class _UI5State extends State<UI5> with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  Animation? _animation;
  AnimationStatus? _status = AnimationStatus.dismissed;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: Duration(microseconds: 2000));
    _animation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(_animationController!)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        _status = status;
      });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _animationController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("UI5")),
      backgroundColor: Colors.grey,
      body: Center(
        child: Transform(
          alignment: FractionalOffset.center,
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.002)
            ..rotateX(3.14 * _animation!.value),
          child: Container(
            color: Colors.blue,
            width: 200,
            height: 200,
            child: Icon(
              Icons.accessibility,
              color: Colors.white,
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _animationController!.forward();
        },
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}
