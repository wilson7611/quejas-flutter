// import 'package:flutter/material.dart';

// void main() => runApp(App());

// class App extends StatelessWidget {
//   const App({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Quejas',
//       home: Quejas(),
//     );
//   }
// }

// class Quejas extends StatefulWidget {
//   const Quejas({super.key});

//   @override
//   State<Quejas> createState() => _QuejasState();
// }

// class _QuejasState extends State<Quejas> {
//   final _quejasController = TextEditingController();
//   List<String> _quejasList = [];

//   void _enviarQueja() {
//     String queja = _quejasController.text;
//     if (queja.isNotEmpty) {
//       setState(() {
//         _quejasList.add(queja);
//         _quejasController.clear();
//       });
//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => VerQuejas(quejas: _quejasList),
//         ),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Quejas'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(45.0),
//         child: Column(
//           children: <Widget>[
//             TextField(
//               controller: _quejasController,
//               decoration: InputDecoration(labelText: 'Introduzca su queja'),
//             ),
//             SizedBox(height: 20),
            
//             ElevatedButton(
//               onPressed: _enviarQueja,
//               child: Text('Enviar Queja'),
              
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class VerQuejas extends StatelessWidget {
//   final List<String> quejas;

//   const VerQuejas({super.key, required this.quejas});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Todas las quejas'),
//       ),
//       body: ListView.builder(
//         itemCount: quejas.length,
//         itemBuilder: (context, index) {
//           return ListTile(
//             title: Text(quejas[index]),
//           );
//         },
//       ),
//     );
//   }
// }





import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quejas',
      home: Quejas(),
    );
  }
}

class Quejas extends StatefulWidget {
  const Quejas({super.key});

  @override
  State<Quejas> createState() => _QuejasState();
}

class _QuejasState extends State<Quejas> {
  final _quejasController = TextEditingController();
  List<String> _quejasList = [];

  void _enviarQueja() {
    String queja = _quejasController.text;
    if (queja.isNotEmpty) {
      setState(() {
        _quejasList.add(queja);
        _quejasController.clear();
      });
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => VerQuejas(quejas: _quejasList),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quejas'),
      ),
      drawer: Drawer(  
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
                
              ),
              child: Text(
                'Menú',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Página Principal'),
              onTap: () {
                Navigator.pop(context); 
              },
            ),
             ListTile(
              leading: Icon(Icons.new_releases_outlined),
              title: Text('Nueva Queja'),
              onTap: () {
                Navigator.pop(context); 
              },
            ),
            ListTile(
              leading: Icon(Icons.list),
              title: Text('Ver Quejas'),
              onTap: () {
                Navigator.pop(context); 
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => VerQuejas(quejas: _quejasList),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(45.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _quejasController,
              decoration: InputDecoration(labelText: 'Introduzca su queja'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _enviarQueja,
              child: Text('Enviar queja'),
            ),
          ],
        ),
      ),
    );
  }
}

class VerQuejas extends StatelessWidget {
  final List<String> quejas;

  const VerQuejas({super.key, required this.quejas});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todas las quejas'),
      ),
      body: ListView.builder(
        itemCount: quejas.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(quejas[index]),
          );
        },
      ),
    );
  }
}