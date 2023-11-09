import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';

void main() {
  runApp(Registrogasto());
}

class Registrogasto extends StatelessWidget {
  const Registrogasto({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Talleres mecanico",
      home: HomeRegistrogasto(),
    );
  }
}

class HomeRegistrogasto extends StatefulWidget {
  HomeRegistrogasto({super.key});
  @override
  _HomeRegistrogastoState createState() => _HomeRegistrogastoState();
}

class _HomeRegistrogastoState extends State<HomeRegistrogasto> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         leading: BackButton(
          //boton para regresar a la pagina anterior
          onPressed: () {
            Navigator.push(       context, MaterialPageRoute(builder: (context) => MyApp()));
          },
         ),
        title: const Text('Registro de gastos'),
      ),
      body: 
      ListView(
        
        padding: EdgeInsets.all(10.0),
        children:  <Widget>[
              sevicio(),
              precio(),
              fecha(),
              Cantidad(),
            ],
      ),
    );
  }

  Widget sevicio() {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
          child: const Text("Servico:"),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
          child: const TextField(
            // controller: constrasenaController,
            obscureText: true,
            decoration: InputDecoration(
              hintText: "Tipo de servicio",
              fillColor: Colors.black12,
              filled: true,
            ),
          ),
        ),
      ],
    );
  }

  Widget precio() {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
          child: const Text("Precio:"),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
          child: const TextField(
            // controller: constrasenaController,
            obscureText: true,
            decoration: InputDecoration(
              hintText: "Precio del servicio",
              fillColor: Colors.white,
              filled: true,
            ),
          ),
        ),
      ],
    );
  }

  Widget fecha() {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
          child: const Text("Fecha:"),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
          child: const TextField(
            // controller: constrasenaController,
            obscureText: true,
            decoration: InputDecoration(
              hintText: "Fecha del servicio",
              fillColor: Colors.white,
              filled: true,
            ),
          ),
        ),
      ],
    );
  }

  Widget Cantidad() {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
          child: const Text("Cantidad:"),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
          child: const TextField(
            // controller: constrasenaController,
            obscureText: true,
            decoration: InputDecoration(
              hintText: "Cantidad",
              fillColor: Colors.white,
              filled: true,
            ),
          ),
        ),
      ],
    );
  }
}
