import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ListaContatos(
        contatos: [
        'Rodrigo',
        'Lara',
        'Théo',
        'Vitor'
      ]),
    );
  }
}

class ListaContatos extends StatelessWidget {
  const ListaContatos({super.key, required this.contatos});

  final List<String> contatos;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de contatos'),
        leading: Icon(Icons.contact_phone),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => ListTile(
          leading: Icon(Icons.person_2_outlined),
          title: Text(contatos[index]
          ),
          trailing: Container(
            width: 60,
            child: Row(children: [
              Icon(Icons.edit),
              SizedBox(
                width: 4
              ),
              Icon(Icons.delete)
            ],
            )
            )
          ),
        itemCount: contatos.length,
      ),
    );
  }
}
