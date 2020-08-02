import 'package:flutter/material.dart';
import 'package:sqliteapp/src/providers/db_provider.dart';

class ContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Contactos'),
          centerTitle: true,
        ),
        body: FutureBuilder(
            future: DBProvider.db.getContacts(),
            builder: (context, AsyncSnapshot<List<ContactModel>> snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              final contacts = snapshot.data;

              if (contacts.length == 0) {
                return Center(
                  child: Text('No hay informacion'),
                );
              }

              return ListView.builder(
                  itemCount: contacts.length,
                  itemBuilder: (context, index) => Dismissible(
                        key: UniqueKey(),
                        background: Container(
                          color: Colors.redAccent,
                        ),
                        onDismissed: (direction) =>
                            DBProvider.db.deleteContact(contacts[index].id),
                        child: ListTile(
                          leading: Icon(Icons.contact_phone),
                          title: Text(
                              '${contacts[index].name} ${contacts[index].lastName}'
                              ),
                          subtitle: Text(contacts[index].phone),
                          trailing: Icon(Icons.arrow_right),
                          onTap: () {
                            Navigator.pushNamed(context, 'home', arguments: contacts[index] );
                          },
                        ),
                      ));
            }));
  }
}
