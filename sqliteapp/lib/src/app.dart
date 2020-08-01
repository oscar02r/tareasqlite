import 'package:flutter/material.dart';
import 'package:sqliteapp/src/pages/contact_page.dart';
import 'package:sqliteapp/src/pages/home_page.dart';





class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sqlite App',
      initialRoute: 'home',
      routes: {
        'home'    :(BuildContext context) => HomePage(),
        'contact' :( BuildContext context) => ContactPage(),
      },
      theme: ThemeData(
        primaryColor: Colors.redAccent,
        backgroundColor: Colors.redAccent,
        
      ),
    );
  }
}
