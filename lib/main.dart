import 'package:flutter/material.dart';
import 'package:queue/home_screen.dart';
import 'package:queue/result.dart';
import 'package:queue/splash_screen.dart';

import 'deterministic.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/homescreen':(context) => HomeScreen(),
        'deterministic' :(context) => Deterministic(),
        'result':(context) => Result()
      },
      home: SplashScreen() ,
    );
  }
}
