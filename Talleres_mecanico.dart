import 'package:flutter/material.dart';

class TalleresMecanicos extends StatelessWidget {
  const TalleresMecanicos({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Talleres mecanico",
      home: HomeTalleresMecanicos(),
    );
  }
}

class HomeTalleresMecanicos extends StatefulWidget {
  HomeTalleresMecanicos({super.key});
  @override
  _HomeTalleresMecanicosState createState() => _HomeTalleresMecanicosState();
}

class _HomeTalleresMecanicosState extends State<HomeTalleresMecanicos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Talleres Mecanicos'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            children: <Widget>[
              _mecanicsolutions(),
              _carfixing(),
              _Autorestorege(),
              _mecanicsolutions()
            ],
          ),
        ),
      ),
    );
  }
  
  Widget _mecanicsolutions() {
    return Card(
      
        child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
          child: const Column(
            children: <Widget>[
              Text(
                "mecanicsolutions",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(
                height: 20,
              ),
              Text("Los Mejores precios"),
            ],
          ),
        ),
      
    );
  }
  
  Widget _carfixing() {
    return Card(
      
        child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
          child: const Column(
            children: <Widget>[
              Text(
                "carfixing",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(
                height: 20,
              ),
              Text("Tu solucion aqui"),
            ],
          ),
        ),
      
    );
  }
  
  Widget _Autorestorege() {
    return Card(
      child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
          child: const Column(
            children: <Widget>[
              Text(
                "Autorestorege",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(
                height: 20,
              ),
              Text("Problemas?, Te los solucionamos"),
            ],
          ),
        ),
      
    );
    }
  Widget _Tallergonzales() {
    return Card(
      child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
          child: const Column(
            children: <Widget>[
              Text(
                "Tallergonzales",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(
                height: 20,
              ),
              Text("soluciones tres B, bueno, bonito y barato"),
            ],
          ),
        ),
      
    );
    }
}