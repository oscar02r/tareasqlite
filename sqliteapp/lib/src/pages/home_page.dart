import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Registrar contacto'),
          centerTitle: true,
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
          children: <Widget>[
            _createName(),
            Divider(),
            _createLastName(),
            Divider(),
            _createPhone()
          ],
        ));
  }

  Widget _createName() {
    return TextField(
      autofocus: false,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Nombre',
          labelText: 'Nombre',
          contentPadding: EdgeInsets.all(10.0)),
    );
  }

  Widget _createLastName() {
    return TextField(
      autofocus: false,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Apellido',
          labelText: 'Apellido',
          contentPadding: EdgeInsets.all(10.0),
          ),
      onChanged: (value) {
        setState(() {
          print(value);
        });
      },
    );
  }

  Widget _createPhone() {
    return TextField(
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Teléfono',
          labelText: 'Teléfono',
          contentPadding: EdgeInsets.all(10.0)),
    );
  }
}
