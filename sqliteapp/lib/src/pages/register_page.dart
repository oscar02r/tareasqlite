import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: _createFloatingAction(),
    );
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

  Widget _createFloatingAction() {
    return FloatingActionButton(
     backgroundColor: Theme.of(context).backgroundColor,
      child: Icon(Icons.add),
       onPressed: () {

       });
  }
}
