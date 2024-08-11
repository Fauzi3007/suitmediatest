import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suitmedia_test/app_state.dart';
import 'package:suitmedia_test/pages/first_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => AppState(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: FirstScreen(),
    );
  }
}
