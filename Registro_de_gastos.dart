import 'package:flutter/material.dart';

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
        title: const Text('Registro de gastos'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            children: <Widget>[
              sevicio(),
              precio(),
              fecha(),
              Cantidad(),
            ],
          ),
        ),
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
              fillColor: Colors.white,
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
          child: const Text("Servico:"),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
          child: const TextField(
            // controller: constrasenaController,
            obscureText: true,
            decoration: InputDecoration(
              hintText: "Tipo de servicio",
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
          child: const Text("Servico:"),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
          child: const TextField(
            // controller: constrasenaController,
            obscureText: true,
            decoration: InputDecoration(
              hintText: "Tipo de servicio",
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
          child: const Text("Servico:"),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
          child: const TextField(
            // controller: constrasenaController,
            obscureText: true,
            decoration: InputDecoration(
              hintText: "Tipo de servicio",
              fillColor: Colors.white,
              filled: true,
            ),
          ),
        ),
      ],
    );
  }
}
