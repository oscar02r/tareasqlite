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
  var edit;
  String _title = 'Registrar';

  @override
  Widget build(BuildContext context) {
    final ContactModel _contact = ModalRoute.of(context).settings.arguments;
    edit = _contact;
    if (edit != null) {
      _name.text = _contact.name;
      _lastName.text = _contact.lastName;
      _phone.text = _contact.phone;
      _title = 'Editar';
    }

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
          _createPhone(),
          Divider(),
          _createButton(_contact)
        ],
      ),
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

  Widget _createButton(ContactModel contact) {
    final Color color = Colors.white;
    return RaisedButton(
      color: Theme.of(context).backgroundColor,
      child: Text(_title, style: TextStyle(color: color)),
      onPressed: () {
        if (_name.text.isNotEmpty &&
            _lastName.text.isNotEmpty &&
            _phone.text.isNotEmpty &&
            contact == null) {
          final contact = ContactModel(
              name: _name.text, lastName: _lastName.text, phone: _phone.text);

          DBProvider.db.insertContact(contact);
        } else {
          final editContact = ContactModel(
              id: contact.id,
              name: _name.text,
              lastName: _lastName.text,
              phone: _phone.text);
          DBProvider.db.updateContact(editContact);
           
        }

        _name.clear();
        _lastName.clear();
        _phone.clear();
        contact.name = null;
        contact.lastName = null;
        contact.phone = null;
         edit = null;
         
        
      },
    );
  }
}
