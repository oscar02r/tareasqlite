import 'package:flutter/material.dart';
import 'package:sqliteapp/src/providers/db_provider.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _lastName = TextEditingController();
  final TextEditingController _phone = TextEditingController();

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
      controller: _name,
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
      controller: _lastName,
      autofocus: false,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        hintText: 'Apellido',
        labelText: 'Apellido',
        contentPadding: EdgeInsets.all(10.0),
      ),
    );
  }

  Widget _createPhone() {
    return TextField(
      controller: _phone,
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
          if (_name.text.isNotEmpty &&
              _lastName.text.isNotEmpty &&
              _phone.text.isNotEmpty) {
            final contact = ContactModel(
                name: _name.text, lastName: _lastName.text, phone: _phone.text);

            DBProvider.db.insertContact(contact);
            _name.clear();
            _lastName.clear();
            _phone.clear();
          }
        });
  }
}
