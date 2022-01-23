import 'package:animation_examples/router/router.dart';
import 'package:flutter/material.dart';

const darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: darkBlue,
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouterUtil.generateRoute,
      initialRoute: homeRoute,
    );
  }
}
