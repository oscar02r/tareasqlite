import 'package:flutter/material.dart';
import 'package:sqliteapp/src/pages/home_page.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sqlite App',
      home: HomePage()
    );
  }
}