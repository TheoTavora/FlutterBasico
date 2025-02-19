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
      home: Contador(contadordecliques: 0),
    );
  }
}

// Lista de contatos:

/*
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
        itemBuilder:
            (context, index) => ListTile(
              leading: Icon(Icons.person_2_outlined),
              title: Text(contatos[index]),
              trailing: Container(
                width: 60,
                child: Row(
                  children: [
                    Icon(Icons.edit),
                    SizedBox(width: 4),
                    Icon(Icons.delete),
                  ],
                ),
              ),
            ),
        itemCount: contatos.length,
      ),
    );
  }
}
*/

// Mudar texto na tela:

/*
class Info extends StatelessWidget {
  const Info({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text(text),
        ),
      ),
    );
  }
}
*/

// Contador de cliques:

/*
class Info extends StatefulWidget {
  const Info({super.key, required this.texto});

  final String texto;

  @override
  State<Info> createState() => _InfoState();
}

class _InfoState extends State<Info> {
  String texto = '';

  @override
  void initState() {
    texto = widget.texto;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(texto)),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            texto = 'Meu outro texto';
          });
        },
        child: Icon(Icons.track_changes),
      ),
    );
  }
}
*/

class Contador extends StatefulWidget {
  const Contador({super.key, required this.contadordecliques});

  final int contadordecliques;

  @override
  State<Contador> createState() => _ContadorState();
}

class _ContadorState extends State<Contador> {
  int contadordecliques = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Vezes que você clicou no botão:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              '$contadordecliques',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  contadordecliques = 0;
                });
              },
              child: Text('Zerar Contador'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            contadordecliques++;
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
