import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class UI4 extends StatefulWidget {
  const UI4({Key? key}) : super(key: key);

  @override
  State<UI4> createState() => _UI4State();
}

class _UI4State extends State<UI4> with SingleTickerProviderStateMixin {
  AnimationController? _controller4;
  Animation? _animation4;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller4 =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    _animation4 = Tween(
      begin: 200.0,
      end: 120.0,
    ).animate(
      CurvedAnimation(
          parent: _controller4!,
          curve: Interval(0.0, 1.0, curve: Curves.elasticIn)),
    )..addStatusListener((AnimationStatus status) {
        if (status == AnimationStatus.completed) {
          _controller4!.repeat(reverse: true);
        }
      });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller4!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("UI4")),
      body: AnimatedBuilder(
        animation: _animation4!,
        builder: (context, child) => Container(
          width: 450,
          height: 450,
          margin: EdgeInsets.only(
            top: _animation4!.value,
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              image: const DecorationImage(
                  image: NetworkImage(
                      'https://1.bp.blogspot.com/-LNTwvLZGyI0/YVAM7Nhc6hI/AAAAAAAAx0A/aZnBOD0-KJ44p3SLQz5-cQs0yX_u1P2ngCLcBGAsYHQ/s1200/Beautiful%2Band%2BGorgeous%2BSexy%2BGirls%2BPictures%2B%25289%2529.jpg')),
              gradient: LinearGradient(begin: Alignment.bottomRight, colors: [
                Colors.black.withOpacity(0.9),
                Colors.black.withOpacity(0.8),
                Colors.black.withOpacity(0.4),
                Colors.black.withOpacity(0.1),
              ])),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _controller4!.forward();
          Navigator.of(context).pushNamed("UI5");
        },
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}
