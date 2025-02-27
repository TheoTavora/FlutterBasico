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
      home: ListaContatos(),
    );
  }
}

// Lista de contatos:
class ListaContatos extends StatefulWidget {
  const ListaContatos({super.key});

  @override
  _ListaContatosState createState() => _ListaContatosState();
}

class _ListaContatosState extends State<ListaContatos> {
  List<String> contatos = [];

  void _adicionarContato() {
    TextEditingController controller = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Adicionar Contato'),
          content: TextField(
            controller: controller,
            decoration: InputDecoration(hintText: 'Nome do contato'),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                if (controller.text.isNotEmpty) {
                  setState(() {
                    contatos.add(controller.text);
                  });
                  Navigator.pop(context);
                }
              },
              child: Text('Adicionar'),
            ),
          ],
        );
      },
    );
  }

  void _editarContato(int index) {
    TextEditingController controller = TextEditingController(text: contatos[index]);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Editar Contato'),
          content: TextField(
            controller: controller,
            decoration: InputDecoration(hintText: 'Nome do contato'),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                if (controller.text.isNotEmpty) {
                  setState(() {
                    contatos[index] = controller.text;
                  });
                  Navigator.pop(context);
                }
              },
              child: Text('Salvar'),
            ),
          ],
        );
      },
    );
  }

  void _removerContato(int index) {
    setState(() {
      contatos.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Contatos'),
        leading: Icon(Icons.contact_phone),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: contatos.length,
        itemBuilder: (context, index) => ListTile(
          leading: Icon(Icons.person_2_outlined),
          title: Text(contatos[index]),
          trailing: Container(
            width: 90,
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => _editarContato(index),
                  child: Icon(Icons.edit),
                ),
                SizedBox(width: 4),
                GestureDetector(
                  onTap: () => _removerContato(index),
                  child: Icon(Icons.delete),
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _adicionarContato,
        child: Icon(Icons.add),
        tooltip: 'Adicionar Contato',
      ),
    );
  }
}

// Contador de cliques
/*
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
  */
