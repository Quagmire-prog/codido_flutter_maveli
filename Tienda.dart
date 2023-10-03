import 'package:flutter/material.dart';
//import 'package:flutter_application_1/screens/Catalogo.dart';
import 'package:flutter_application_1/screens/Registro_de_gastos.dart';

void main() {
  runApp(tienda());
}

class tienda extends StatelessWidget {
  //const tienda({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Tienda",
      home: homeTienda(),
    );
  }
}

class homeTienda extends StatefulWidget {
  homeTienda({super.key});
  @override
  _homeTiendaState createState() => _homeTiendaState();
}

class _homeTiendaState extends State<homeTienda> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('tienda'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            children: <Widget>[
              _repuestobenito(),
              _repuestoasura(),
              _repuestobegarito()
            ],
          ),
        ),
      ),
    );
  }

  Widget _repuestobenito() {
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const Registrogasto()));
        },
        child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
          child: const Column(
            children: <Widget>[
              Text(
                "Repuesto Benito",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(
                height: 20,
              ),
              Text("Repuesto a la alcance de su mano"),
            ],
          ),
        ),
      ),
    );
  }

  Widget _repuestoasura() {
    return Card(
      child: InkWell(
        onTap: () {
          //Navigator.push(     context, MaterialPageRoute(builder: (context) => catalogo()));
        },
        child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
          child: const Column(
            children: <Widget>[
              Text(
                "Repuesto Asura",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(
                height: 20,
              ),
              Text("Repuesto a la alcance de su mano"),
            ],
          ),
        ),
      ),
    );
  }

  Widget _repuestobegarito() {
    return Card(
      child: InkWell(
        onTap: () {
          //Navigator.push(      context, MaterialPageRoute(builder: (context) => catalogo()));
        },
        child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
          child: const Column(
            children: <Widget>[
              Text(
                "Repuesto Begarito",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(
                height: 20,
              ),
              Text("Repuesto a la alcance de su mano"),
            ],
          ),
        ),
      ),
    );
  }
}
