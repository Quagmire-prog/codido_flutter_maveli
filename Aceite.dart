import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/Catalogo.dart';

class Aceites extends StatelessWidget {
  //const tienda({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Tienda",
      home: homeAceites(),
    );
  }
}

class homeAceites extends StatefulWidget {
  homeAceites({super.key});
  @override
  _homeAceiteState createState() => _homeAceiteState();
}

class _homeAceiteState extends State<homeAceites> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: BackButton(
            onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) =>catalogo()));
        },
          ),
          title: const Text('Catalogo'),
        ),
        body: SingleChildScrollView(
        padding: EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            children: <Widget>[
              _aceiteaceitoso(),
              _aceititino(),
              _aceiteichon()

            ],
          ),
        ),
      ),
      );
  }
}
Widget _aceiteaceitoso(){
  return Card(
      
        child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
          child: const Column(
            children: <Widget>[
              Text(
                "Aceite Aceitoso",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(
                height: 20,
              ),
              Text("20w50 200 Cordobas"),
            ],
          ),
        ),
      
    );
}
Widget _aceititino(){
  return Card(
      
        child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
          child: const Column(
            children: <Widget>[
              Text(
                "Aceitino",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(
                height: 20,
              ),
              Text("15w50 250 Cordobas"),
            ],
          ),
        ),
      
    );
}
Widget _aceiteichon(){
  return Card(
      
        child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
          child: const Column(
            children: <Widget>[
              Text(
                "Aceiteichon",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(
                height: 20,
              ),
              Text("15w20 250 Cordobas"),
            ],
          ),
        ),
      
    );
}