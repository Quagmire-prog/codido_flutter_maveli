import 'package:flutter/material.dart';

void main() {
  runApp(PerfilUsuario());
}

class PerfilUsuario extends StatelessWidget {
  const PerfilUsuario({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Tienda",
      home: homePerfinUsusario(),
    );
  }
}

class homePerfinUsusario extends StatefulWidget {
  homePerfinUsusario({super.key});
  @override
  _homePerfinUsusarioState createState() => _homePerfinUsusarioState();
}

class _homePerfinUsusarioState extends State<homePerfinUsusario> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Mi cuenta'),
        ),
        body: Card(
          child: InkWell(
            onTap: () {},
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
              alignment: Alignment.center,
              width: double.infinity,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  Text("Informacion de la cuenta",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  Text("usuario: Carlos Enrique Rios Torrez"),
                  SizedBox(height: 10),
                  Text("Telefono: 00000000"),
                  SizedBox(height: 10),
                  Text("Correo: maveli@gmail.com"),
                  SizedBox(height: 10),
                  Text("Cedula: 000-000000-0000A"),
                  SizedBox(height: 10),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: cerrar,
                      child: Text('Cerrar sesion'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

Widget cerrar() {
  return Text("sesion cerrada");
}
