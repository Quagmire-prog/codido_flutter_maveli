import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/Inicio_de_sesion.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/screens/registo_afiliado.dart';

class registrar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RegisterScreen(),
    );
  }
}

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController nombre1Controller = TextEditingController();
  TextEditingController nombre2Controller = TextEditingController();
  TextEditingController apellido1Controller = TextEditingController();
  TextEditingController apellido2Controller = TextEditingController();
  TextEditingController telefonoController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController contrasenaController = TextEditingController();

  Future registerUser() async {
    //http://172.16.144.157:8080
    final url = 'http://192.168.1.24:8080/api/Usuarios';

    String telefonoText = telefonoController.text;
    int? telefono = int.tryParse(telefonoText);

    if (telefono == null) {
      // Manejar el caso en que el valor no sea un número válido
      print('El teléfono debe ser un número válido.');
    } else {
      Map<String, dynamic> userData = {
        'nombre1': nombre1Controller.text,
        'nombre2': nombre2Controller.text,
        'apellido1': apellido1Controller.text,
        'apellido2': apellido2Controller.text,
        'telefono': telefono,
        'email': emailController.text,
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
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Gasto registrado con éxito'),
      ));
    } else {
      // Error al registrar el gasto
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Error al registrar el usuario'),
      ));
    }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro de Usuario'),
        leading: BackButton(
          //boton para regresar a la pagina anterior
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Iniciosesion()));
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child:ListView(
         
          children: [
            TextField(
              controller: nombre1Controller,
              decoration: const InputDecoration(labelText: 'Nombre 1'),
            ),
            TextField(
              controller: nombre2Controller,
              decoration: const InputDecoration(labelText: 'Nombre 2'),
            ),
            TextField(
              controller: apellido1Controller,
              decoration: InputDecoration(labelText: 'Apellido 1'),
            ),
            TextField(
              controller: apellido2Controller,
              decoration: InputDecoration(labelText: 'Apellido 2'),
            ),
            TextField(
              controller: telefonoController,
              decoration: InputDecoration(labelText: 'Teléfono'),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Correo Electrónico'),
            ),
            TextField(
              controller: contrasenaController,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Contraseña'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                registerUser();
              },
              child: Text('Registrarse'),
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
    );
  }
}














// class Client {
//   String nombres;
//   String apellidos;
//   String telefono;
//   String correoElectronico;
//   String ubicacion;
//   String cedula;
//   String contrasena;
//   String confirmarcontrasena;

//   Client(
//       {required this.nombres,
//       required this.apellidos,
//       required this.telefono,
//       required this.correoElectronico,
//       required this.ubicacion,
//       required this.cedula,
//       required this.contrasena,
//       required this.confirmarcontrasena,
//       });
// }

// class Registro extends StatefulWidget {
//   Registro({Key? key}) : super(key: key);

//   @override
//   _RegistroState createState() => _RegistroState();
// }

// class _RegistroState extends State<Registro> {
//   final TextEditingController nombresController = TextEditingController();
//   final TextEditingController apellidosController = TextEditingController();
//   final TextEditingController telefonoController = TextEditingController();
//   final TextEditingController correoController = TextEditingController();
//   final TextEditingController ubicacionController = TextEditingController();
//   final TextEditingController cedulaController = TextEditingController();
//   final TextEditingController contrasenaController = TextEditingController();
//   final TextEditingController confirmarContrasenaController = TextEditingController();

//   final List<Client> clients = [];

//   void registerClient() {
//     final client = Client(
//         nombres: nombresController.text,
//         apellidos: apellidosController.text,
//         telefono: telefonoController.text,
//         correoElectronico: correoController.text,
//         ubicacion: ubicacionController.text,
//         cedula: cedulaController.text,
//         contrasena: contrasenaController.text,
//         confirmarcontrasena: confirmarContrasenaController.text);

//     setState(() {
//       clients.add(client);
//     });

//     // Aquí puedes realizar acciones adicionales, como guardar en una base de datos.

//     // Limpiar los campos del formulario después de registrar.
//     nombresController.clear();
//     apellidosController.clear();
//     telefonoController.clear();
//     correoController.clear();
//     ubicacionController.clear();
//     cedulaController.clear();
//     contrasenaController.clear();
//     confirmarContrasenaController.clear();
//   }
//   Future registerData() async {
//     final url = 'https://172.16.148.182:8080/api/Usuario'; // Reemplaza con la URL de tu servidor

//     // Datos que deseas enviar al servidor
//     Map<String, String> data = {
//       'nombre': 'Ejemplo',
//       'correo': 'ejemplo@correo.com',
//       // Agrega más campos según tus necesidades
//     };

//     final response = await http.post(
//       Uri.parse(url),
//       body: json.encode(data),
//       headers: {'Content-Type': 'application/json'},
//     );

//     if (response.statusCode == 201) {
//       // Si la solicitud es exitosa, puedes manejar la respuesta del servidor
//       Map<String, dynamic> responseData = json.decode(response.body);
//       print('Registro exitoso: $responseData');
//     } else {
//       // Si la solicitud no es exitosa, imprime el código de estado
//       print('Error en el registro: ${response.statusCode}');
//     }
//   }
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(
//           leading: BackButton(
//             //boton para regresar a la pagina anterior
//             onPressed: () {
//               Navigator.push(context,
//                   MaterialPageRoute(builder: (context) => Iniciosesion()));
//             },
//           ),
//           title: const Text('Registro'),
//         ),
//         body: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: ListView(
//             children: [
//               const Text('Nombres '),
//               TextField(controller: nombresController),
//               const SizedBox(height: 10),
//               const Text('Apellidos'),
//               TextField(controller: apellidosController),
//               const SizedBox(height: 10),
//               const Text('Teléfono'),
//               TextField(controller: telefonoController),
//               const SizedBox(height: 10),
//               const Text('Correo Electrónico'),
//               TextField(controller: correoController),
//               const SizedBox(height: 10),
//               const Text("Contraseña"),
//               Container(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
//                 child:  TextField(
//                   controller: contrasenaController, 
//                   obscureText: true,
//                   decoration: const InputDecoration(
//                     hintText: "Contraseña",
//                     fillColor: Colors.white,
//                     filled: true,
//                   ),
//                 ),
//               ),
//               const Text("Confirme su contraseña"),
//               Container(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
//                 child:  TextField(
//                   controller: confirmarContrasenaController,
//                   obscureText: true,
//                   decoration:const InputDecoration(
//                     hintText: "Confirme su contraseña",
//                     fillColor: Colors.white,
//                     filled: true,
//                   ),
//                 ),
//               ),
//               Center(
//                 child: Column(
//                   children: [
//                     ElevatedButton(
//                       onPressed: registerClient,
//                       child: const Text('Registrar'),
//                     ),
            //         CupertinoButton(
            //   child: Container(
            //     margin: const EdgeInsets.only(top: 30),
            //     padding:
            //         const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
            //     child: const Text(
            //       "Crear una cuenta como afiliado",
            //     ),
            //   ),
            //   onPressed: () {
            //     Navigator.push(context,
            //         MaterialPageRoute(builder: (context) => RegistrodeAfiliados() ));
            //   },
            // )
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
