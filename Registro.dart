import 'package:flutter/material.dart';

void main() {
  runApp(Registro());
}

class Client {
  String nombres;
  String apellidos;
  String telefono;
  String correoElectronico;
  String ubicacion;
  String cedula;

  Client({
    required this.nombres,
    required this.apellidos,
    required this.telefono,
    required this.correoElectronico,
    required this.ubicacion,
    required this.cedula,
  });
}

class Registro extends StatefulWidget {
  Registro({Key? key}) : super(key: key);

  @override
  _RegistroState createState() => _RegistroState();
}

class _RegistroState extends State<Registro> {
  final TextEditingController nombresController = TextEditingController();
  final TextEditingController apellidosController = TextEditingController();
  final TextEditingController telefonoController = TextEditingController();
  final TextEditingController correoController = TextEditingController();
  final TextEditingController ubicacionController = TextEditingController();
  final TextEditingController cedulaController = TextEditingController();

  final List<Client> clients = [];

  void registerClient() {
    final client = Client(
      nombres: nombresController.text,
      apellidos: apellidosController.text,
      telefono: telefonoController.text,
      correoElectronico: correoController.text,
      ubicacion: ubicacionController.text,
      cedula: cedulaController.text,
    );

    setState(() {
      clients.add(client);
    });

    // Aquí puedes realizar acciones adicionales, como guardar en una base de datos.

    // Limpiar los campos del formulario después de registrar.
    nombresController.clear();
    apellidosController.clear();
    telefonoController.clear();
    correoController.clear();
    ubicacionController.clear();
    cedulaController.clear();
    //constrasenaController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Registro'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Nombres '),
              TextField(controller: nombresController),
              const SizedBox(height: 10),
              const Text('Apellidos'),
              TextField(controller: apellidosController),
              const SizedBox(height: 10),
              const Text('Teléfono'),
              TextField(controller: telefonoController),
              const SizedBox(height: 10),
              const Text('Correo Electrónico'),
              TextField(controller: correoController),
              const SizedBox(height: 10),
              const Text("Contraseña"),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
                child: const TextField(
                  //controller: constrasenaController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Contraseña",
                    fillColor: Colors.white,
                    filled: true,
                  ),
                ),
              ),
              const Text("Confirme su contraseña"),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
                child: const TextField(
                  // controller: constrasenaController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Confirme su contraseña",
                    fillColor: Colors.white,
                    filled: true,
                  ),
                ),
              ),
              Center(
                child: ElevatedButton(
                  onPressed: registerClient,
                  child: const Text('Registrar'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
