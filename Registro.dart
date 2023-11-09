import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/Inicio_de_sesion.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/screens/registo_afiliado.dart';

class Client {
  String nombres;
  String apellidos;
  String telefono;
  String correoElectronico;
  String ubicacion;
  String cedula;
  String contrasena;
  String confirmarcontrasena;

  Client(
      {required this.nombres,
      required this.apellidos,
      required this.telefono,
      required this.correoElectronico,
      required this.ubicacion,
      required this.cedula,
      required this.contrasena,
      required this.confirmarcontrasena,
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
  final TextEditingController contrasenaController = TextEditingController();
  final TextEditingController confirmarContrasenaController = TextEditingController();

  final List<Client> clients = [];

  void registerClient() {
    final client = Client(
        nombres: nombresController.text,
        apellidos: apellidosController.text,
        telefono: telefonoController.text,
        correoElectronico: correoController.text,
        ubicacion: ubicacionController.text,
        cedula: cedulaController.text,
        contrasena: contrasenaController.text,
        confirmarcontrasena: confirmarContrasenaController.text);

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
    contrasenaController.clear();
    confirmarContrasenaController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: BackButton(
            //boton para regresar a la pagina anterior
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Iniciosesion()));
            },
          ),
          title: const Text('Registro'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
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
                child:  TextField(
                  controller: contrasenaController, 
                  obscureText: true,
                  decoration: const InputDecoration(
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
                child:  TextField(
                  controller: confirmarContrasenaController,
                  obscureText: true,
                  decoration:const InputDecoration(
                    hintText: "Confirme su contraseña",
                    fillColor: Colors.white,
                    filled: true,
                  ),
                ),
              ),
              Center(
                child: Column(
                  children: [
                    ElevatedButton(
                      onPressed: registerClient,
                      child: const Text('Registrar'),
                    ),
                    CupertinoButton(
              child: Container(
                margin: const EdgeInsets.only(top: 30),
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
                child: const Text(
                  "Crear una cuenta como afiliado",
                ),
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => RegistrodeAfiliados() ));
              },
            )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
