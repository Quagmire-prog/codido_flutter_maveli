//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_application_1/screens/Aceite.dart';
import 'package:flutter_application_1/screens/Tienda.dart';

class catalogo extends StatelessWidget {
  //const tienda({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Tienda",home: homeCatalogo(),
      
    );
  }
}

class homeCatalogo extends StatefulWidget {
  const homeCatalogo({super.key});
  @override
  _homeCatalogoState createState() => _homeCatalogoState();
}

class _homeCatalogoState extends State<homeCatalogo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          //boton para regresar a la pagina anterior
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => tienda()));
          },
        ),
        title: const Text('Catalogo'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            children: <Widget>[
              Descripcioncasarepuesto(),
              _Aceite()

              // _aceite(),
            ],
          ),
        ),
      ),
    );
  }
}

Widget Descripcioncasarepuesto() {
  return Card(
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
          Text("Tu repuesto a la mano"),
        ],
      ),
    ),
  );
}

Widget _Aceite() {
  return Card(
    child: InkWell(
      onTap: () {
        //Navigator.push(context,MaterialPageRoute(builder: (context) =>  Aceites()));
      },
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
        child: const Column(
          children: <Widget>[
            Text(
              "Aceite",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
                "Recurda hacer el cambio de aceite con el kilometraje indicado por el fabricante"),
          ],
        ),
      ),
    ),
  );
}
