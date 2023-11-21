import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/Inicio_de_sesion.dart';
import 'package:flutter_application_1/screens/Registro.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class registroafiliado {
  var nombrenegocio;
  var nombrepropietario;
  var num_cel_negoc;
  var email_negocio;
  var contra;
  var confircontra;
  var direccion;
  var tipo_serv;
  registroafiliado(
      {required this.nombrenegocio,
      required this.nombrepropietario,
      required this.num_cel_negoc,
      required this.email_negocio,
      required this.contra,
      required this.confircontra,
      required this.direccion,
      required this.tipo_serv});
}

class RegistrodeAfiliados extends StatelessWidget {
  const RegistrodeAfiliados({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Material App', home: Registroafili());
  }
}

class Registroafili extends StatefulWidget {
  const Registroafili({super.key});

  @override
  State<Registroafili> createState() => _RegistroafiliState();
}

class _RegistroafiliState extends State<Registroafili> {
  final TextEditingController nombrenegocioController = TextEditingController();
  final TextEditingController nombrepropietarioController =
      TextEditingController();
  final TextEditingController telefonoController = TextEditingController();
  final TextEditingController direccionController = TextEditingController();
  final TextEditingController email_negocioController = TextEditingController();
  final TextEditingController tipo_servcioController = TextEditingController();
  final TextEditingController contrasenaController = TextEditingController();
  final TextEditingController tipoController = TextEditingController();
  final TextEditingController confirmarContrasenaController =
      TextEditingController();

  final List<registroafiliado> Afiliado = [];
  Future registerafiliado() async {
    //http://172.16.144.157:8080
    final url = 'http://172.16.144.157:8080/api/Negocio';

    String telefonoText = telefonoController.text;
    int? telefono = int.tryParse(telefonoText);

    Map<String, dynamic> userData = {
      'nombre_negocio': nombrenegocioController.text,
      'propietario': nombrepropietarioController.text,
      'telefono_negoc': telefono,
      'direccion': direccionController.text,
      'tipo': tipoController.text,
      'email': email_negocioController.text,
      'clave_acceso': contrasenaController.text,
    };

    final response = await http.post(
      Uri.parse(url),
      body: json.encode(userData),
      headers: {
        'Connection': 'keep-alive',
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      },
    );

    if (response.statusCode == 201) {
      // Gasto registrado con éxito
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(' registrado con éxito'),
      ));
    } else {
      // Error al registrar el gasto
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('El codigo a fallado con exito!!!'),
      ));
    }
  }

  // void registerafiliado() {
  //   final Afili = registroafiliado(
  //     nombrenegocio: nombrenegocioController.text,
  //     nombrepropietario: nombrepropietarioController.text,
  //     num_cel_negoc: num_cel_negocioController.text,
  //     email_negocio: email_negocioController.text,
  //     contra: contrasenaController.text,
  //     confircontra: confirmarContrasenaController.text,
  //     direccion: direccionController.text,
  //     tipo_serv: tipo_servontroller.text,
  //   );

  //   setState(() {
  //     Afiliado.add(Afili);
  //   });

  //   // Aquí puedes realizar acciones adicionales, como guardar en una base de datos.

  //   // Limpiar los campos del formulario después de registrar.
  //   nombrenegocioController.clear();
  //   nombrepropietarioController.clear();
  //   num_cel_negocioController.clear();
  //   email_negocioController.clear();
  //   direccionController.clear();
  //   tipo_servontroller.clear();
  //   contrasenaController.clear();
  //   confirmarContrasenaController.clear();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          //boton para regresar a la pagina anterior
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => registrar()));
          },
        ),
        title: const Text('Registro de Afiliado'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Text('Nombres del negocio'),
            TextField(controller: nombrenegocioController),
            const SizedBox(height: 10),
            const Text('Nombre del propitario'),
            TextField(controller: nombrepropietarioController),
            const SizedBox(height: 10),
            TextFormField(
              controller: telefonoController,
              decoration: InputDecoration(labelText: 'Telefono del negocio'),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, ingresa el ID del auto';
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
            const Text('Correo Electrónico'),
            TextField(controller: email_negocioController),
            const SizedBox(height: 10),
            const Text('Direccion de su negocio'),
            TextField(controller: direccionController),
            TextFormField(
              controller: tipoController,
              decoration:
                  InputDecoration(labelText: 'tipo de negocio del negocio'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, ingresa el ID del auto';
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
            const Text("Contraseña"),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
              child: TextField(
                controller: contrasenaController,
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
              child: TextField(
                controller: confirmarContrasenaController,
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
                onPressed: () {
                  registerafiliado();
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Iniciosesion() ));
                },
                child: const Text('Registrar'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
