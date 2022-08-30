import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
  Animation<double>? animation;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2400));
    animation = CurvedAnimation(parent: controller!, curve: Curves.easeIn);
  }

  @override
  void dispose() {
    super.dispose();
    controller!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(title: Text("UI")),
      body: Center(
        child: FadeTransition(
          opacity: animation!,
          child: Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                gradient: LinearGradient(begin: Alignment.bottomRight, colors: [
                  Colors.white.withOpacity(0.9),
                  Colors.red.withOpacity(0.8),
                  Colors.yellow.withOpacity(0.6),
                  Colors.green.withOpacity(0.2)
                ]),
                image: const DecorationImage(
                    image: NetworkImage(
                        'https://cdn3.iconfinder.com/data/icons/inficons/512/apple.png'))),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            controller!.forward();
            Navigator.of(context).pushNamed("UI2");
          },
          child: const Icon(Icons.play_arrow)),
    );
  }
}
