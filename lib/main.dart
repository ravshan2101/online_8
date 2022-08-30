import 'package:flutter/material.dart';
import 'package:online_8/Page/home_page.dart';
import 'package:online_8/Page/ui2.dart';
import 'package:online_8/Page/ui3.dart';
import 'package:online_8/Page/ui4.dart';
import 'package:online_8/Page/ui5.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        'UI2': (context) => const Ui2(),
        'UI3': (context) => const UI3(),
        'UI4': (context) => const UI4(),
        "UI5": (context) => const UI5(),
        'Home': (context) => const HomePage()
      },
      initialRoute: 'Home',
    );
  }
}
