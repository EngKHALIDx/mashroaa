import 'package:flutter/material.dart';
import 'package:mashroaa/NAVIGATION/final_view.dart';
import 'package:mashroaa/core/themeWidget.dart';

Future<void> main() async => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      
      
      debugShowCheckedModeBanner: false,
      
      theme: ThemeWidget.themeData,
      
      home: FinalView(),
    );
  }
}
