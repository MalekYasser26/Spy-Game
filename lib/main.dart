import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spy_game/Providers/sharedlogic.dart';
import 'package:spy_game/view/Home/HomeScreen.dart';

void main() {
  runApp( MultiProvider(
      providers: [
       ChangeNotifierProvider(create: (context) => SharedLogic(),)
      ],
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: Homescreen(),
    );
  }
}
