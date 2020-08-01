import 'package:flutter/material.dart';
import 'package:sqliteapp/src/pages/contact_page.dart';
import 'package:sqliteapp/src/pages/register_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _page = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _callPage(_page),
      bottomNavigationBar: _createBottomNavigation(),
    );
  }

  Widget _callPage(int currentPage) {
    switch (currentPage) {
      case 0:
        return RegisterPage();
      case 1:
        return ContactPage();

      default:
        return RegisterPage();
    }
  }

  Widget _createBottomNavigation() {
    return BottomNavigationBar(
      currentIndex: _page,
      onTap: (index) {
        setState(() {
         _page = index;
         
        });
      },
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.account_circle), title: Text('Registrar')),
        BottomNavigationBarItem(
            icon: Icon(Icons.contacts), title: Text('Contactos'))
      ],
    );
  }
}
