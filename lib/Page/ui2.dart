import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Ui2 extends StatefulWidget {
  const Ui2({Key? key}) : super(key: key);

  @override
  State<Ui2> createState() => _Ui2State();
}

class _Ui2State extends State<Ui2> with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation? _animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    _animation = Tween<Size>(begin: Size(300, 300), end: Size(320, 320))
        .animate(CurvedAnimation(parent: _controller!, curve: Curves.bounceIn));

    _controller!.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) {
        _controller!.repeat();
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("UI2")),
        body: Center(
          child: AnimatedBuilder(
              animation: _animation!,
              builder: ((context, child) => Container(
                    width: _animation!.value.width,
                    height: _animation!.value.height,
                    child: Image.network(
                        'https://1.bp.blogspot.com/-LNTwvLZGyI0/YVAM7Nhc6hI/AAAAAAAAx0A/aZnBOD0-KJ44p3SLQz5-cQs0yX_u1P2ngCLcBGAsYHQ/s1200/Beautiful%2Band%2BGorgeous%2BSexy%2BGirls%2BPictures%2B%25289%2529.jpg'),
                  ))),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _controller!.forward();
            Navigator.of(context).pushNamed("UI3");
          },
          child: const Icon(
            Icons.play_arrow,
          ),
        ));
  }
}
