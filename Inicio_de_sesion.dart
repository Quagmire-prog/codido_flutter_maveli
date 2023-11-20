import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/screens/Registro.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

enum UserType { admin, usuarios, talleres, tienda }

class Usuario {
  String email;
  String password;

  Usuario({required this.email, required this.password});
  factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario(
      email: json['username'],
      password: json['password'],
      
      
    );
  }
}

Future<List<Usuario>> historial() async {

  
  final response = await http.get( Uri.parse('http://172.16.144.157:8080/api/Gastos'));
  
  
  if (response.statusCode == 200) {
    List<dynamic> data = json.decode(response.body);
    return data.map((json) => Usuario.fromJson(json)).toList();
  } else {
    throw Exception('Error al cargar los gastos');
  }
}

class Iniciosesion extends StatefulWidget {
  Iniciosesion({Key? key}) : super(key: key);

  @override
  _IniciosesionState createState() => _IniciosesionState();
}

class _IniciosesionState extends State<Iniciosesion> {
  final TextEditingController correoController = TextEditingController();
  final TextEditingController constrasenaController = TextEditingController();
  final List<Usuario> usuarios = [];

  String _errorMessage = '';
  @override
  void dispose() {
    correoController.dispose();
    constrasenaController.dispose();
    super.dispose();
  }

  void _handleLogin() async {
    final String email = correoController.text;
    final String password = constrasenaController.text;

    if (email.isEmpty || password.isEmpty) {
      setState(() {
        _errorMessage = 'Ingrese su correo electrónico y contraseña.';
      });
      return;
    }

    // final UserType userType = await _checkUser(email, password);

    // if (userType == null) {
    //   setState(() {
    //     _errorMessage = 'Usuario o contraseña incorrectos.';
    //   });
    //   return;
    // }
    // Navegar a la pantalla correspondiente según el tipo de usuario
    // Navigator.pushReplacementNamed(context, '/${userType.name}');
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLoggedIn', true);
    // prefs.setString('userType', userType.name);
    
  }
  // Future<UserType?> _checkUser(String email, String password) async {
  //   // Implementar la lógica para chequear al usuario en la base de datos
  //   // Devuelve el tipo de usuario o null si las credenciales son incorrectas
  //   return Future.delayed(Duration(seconds: 1), () => UserType.regular);
  // }
//  final UserType userType = await _checkUser(email, password);

//     if (userType == null) {
//       setState(() {
//         _errorMessage = 'Usuario o contraseña incorrectos.';
//       });
//       return;
//     }


  // TextEditingController get username => correoController;

  // TextEditingController get password => constrasenaController;
  // void inicioUsuario() {
  //   final usuario = Usuario(
  //       email: correoController.text, password: constrasenaController.text);

  //   setState(() {
  //     usuarios.add(usuario);
  //   });

  //   correoController.clear();

  //   constrasenaController.clear();
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
            child: Column(
          children: [
            Container(
              child: cuerpo(),
            ),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
              child: TextField(
                controller: correoController,
                decoration: const InputDecoration(
                  hintText: "Correo electronico",
                  fillColor: Colors.white,
                  filled: true,
                ),
              ),
            ),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
              child: TextField(
                controller: constrasenaController,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: "Contraseña",
                  fillColor: Colors.white,
                  filled: true,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: _handleLogin,
              child: Text('Iniciar sesión'),
            ),
            if (_errorMessage.isNotEmpty)
              Text(
                _errorMessage,
                style: TextStyle(color: Colors.red),
              ),
            CupertinoButton(
                child: Container(
                  margin: const EdgeInsets.only(top: 30),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 5.0),
                  child: const Text(
                    "Crear una cuenta",
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => registrar()));
                })
          ],
        )),
      ),
    );
  }
}

Widget cuerpo() {
  return Container(
    decoration: BoxDecoration(
      image: DecorationImage(image: NetworkImage("")),
    ),
    child: Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        nombre(),
      ]),
    ),
  );
}

Widget nombre() {
  return const Text(
    "Iniciar sesion",
    style: TextStyle(
      color: Colors.black,
      fontSize: 30.0,
      fontWeight: FontWeight.bold,
    ),
  );
}

Future<void> login(String username, String password) async {
  final response = await http.post(
    Uri.parse('http://192.168.1.24:8080/api/login'),
    headers: <String, String>{
      'Content-Type': 'application/json',
    },
    body: jsonEncode(<String, String>{
      'username': username,
      'password': password,
    }),
  );

  if (response.statusCode == 200) {
    // Procesar la respuesta exitosa (puede ser un token de acceso)
    print('Inicio de sesión exitoso');
  } else {
    // Procesar la respuesta de error
    print('Error en el inicio de sesión: ${response.statusCode}');
  }
}

String accessToken = '...'; // token recibido después del inicio de sesión

Future<void> fetchData() async {
  final response = await http.get(
    Uri.parse('http://tu-backend.com/tu-endpoint'),
    headers: <String, String>{
      'Authorization': 'Bearer $accessToken',
    },
  );

  if (response.statusCode == 200) {
    // Procesar la respuesta exitosa
    print('Datos recibidos: ${response.body}');
  } else {
    // Procesar la respuesta de error
    print('Error al obtener datos: ${response.statusCode}');
  }
}
