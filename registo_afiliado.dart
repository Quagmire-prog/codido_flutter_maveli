import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/Registro.dart';

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
  final TextEditingController num_cel_negocioController =
      TextEditingController();
  final TextEditingController direccionController = TextEditingController();
  final TextEditingController email_negocioController = TextEditingController();
  final TextEditingController tipo_servontroller = TextEditingController();
  final TextEditingController contrasenaController = TextEditingController();
  final TextEditingController confirmarContrasenaController =
      TextEditingController();

  final List<registroafiliado> Afiliado = [];

  void registerafiliado() {
    final Afili = registroafiliado(
      nombrenegocio: nombrenegocioController.text,
      nombrepropietario: nombrepropietarioController.text,
      num_cel_negoc: num_cel_negocioController.text,
      email_negocio: email_negocioController.text,
      contra: contrasenaController.text,
      confircontra: confirmarContrasenaController.text,
      direccion: direccionController.text,
      tipo_serv: tipo_servontroller.text,
    );

    setState(() {
      Afiliado.add(Afili);
    });

    // Aquí puedes realizar acciones adicionales, como guardar en una base de datos.

    // Limpiar los campos del formulario después de registrar.
    nombrenegocioController.clear();
    nombrepropietarioController.clear();
    num_cel_negocioController.clear();
    email_negocioController.clear();
    direccionController.clear();
    tipo_servontroller.clear();
    contrasenaController.clear();
    confirmarContrasenaController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          //boton para regresar a la pagina anterior
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Registro()));
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
            const Text('Numero de telefono del negocio'),
            TextField(controller: num_cel_negocioController),
            const SizedBox(height: 10),
            const Text('Correo Electrónico'),
            TextField(controller: email_negocioController),
            const SizedBox(height: 10),
            const Text('Direccion de su negocio'),
            TextField(controller: direccionController),
            const SizedBox(height: 10),
            const Text('Tipo de negocio'),
            TextField(controller: tipo_servontroller),
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
                onPressed: registerafiliado,
                child: const Text('Registrar'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
