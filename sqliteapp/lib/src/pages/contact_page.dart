import 'package:flutter/material.dart';

class ContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title: Text('Contactos'),
            centerTitle: true,
            ),
          body: ListView(
            children: <Widget>[
              ListTile(
                title: Text('Nombre'),
                subtitle: Text('Telefono'),
              )
            ],
      ),
    );
  }
}