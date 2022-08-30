import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class UI3 extends StatefulWidget {
  const UI3({Key? key}) : super(key: key);

  @override
  State<UI3> createState() => _UI3State();
}

class _UI3State extends State<UI3> with SingleTickerProviderStateMixin {
  AnimationController? _controller1;
  Animation<Offset>? _animation1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller1 =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    _animation1 = Tween<Offset>(begin: Offset.zero, end: Offset(1.5, 0.0))
        .animate(
            CurvedAnimation(parent: _controller1!, curve: Curves.elasticIn));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller1!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("UI3")),
      body: Center(
          child: SlideTransition(
              position: _animation1!,
              child: Padding(
                padding: EdgeInsets.all(8),
                child: FlutterLogo(
                  size: 150,
                ),
              ))),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: (() {
          _controller1!.forward();
          Navigator.of(context).pushNamed("UI4");
        }),
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}
