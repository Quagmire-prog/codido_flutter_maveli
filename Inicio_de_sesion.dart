import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/screens/Registro.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

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

class Iniciosesion extends StatefulWidget {
  Iniciosesion({Key? key}) : super(key: key);

  @override
  _IniciosesionState createState() => _IniciosesionState();
}

class _IniciosesionState extends State<Iniciosesion> {
  final TextEditingController correoController = TextEditingController();
  final TextEditingController constrasenaController = TextEditingController();
  String _errorMessage = '';

  @override
  void dispose() {
    correoController.dispose();
    constrasenaController.dispose();
    super.dispose();
  }

  Future<void> _handleLogin() async {
    final String email = correoController.text;
    final String password = constrasenaController.text;

    if (email.isEmpty || password.isEmpty) {
      setState(() {
        _errorMessage = 'Ingrese su correo electrónico y contraseña.';
      });
      return;
    }

    try {
      final token = await login(email, password);

      // Guardar el token en SharedPreferences
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('token', token);

      // Navegar a la pantalla principal después del inicio de sesión
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MyApp()),
      );
    } catch (e) {
      setState(() {
        _errorMessage = 'Error en el inicio de sesión: $e';
      });
    }
  }

  Future<String> login(String username, String password) async {
    final response = await http.post(
      Uri.parse('http://172.16.144.157:8080/api/Login'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, String>{
        'email': username,
        'clave_acceso': password,
      }),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      final String token = responseData['token'];

      // Decodificar el token JWT
      final parts = token.split('.');
      if (parts.length != 3) {
        throw Exception('El token JWT no tiene el formato esperado.');
      }

      final payload = json.decode(
        utf8.decode(base64Url.decode(parts[1])),
      );

      // Acceder a la información de la carga útil (payload)
      final String username = payload['username'];
      final String role = payload['role'];

      print('Inicio de sesión exitoso');
      print('Nombre de usuario: $username');
      print('Rol: $role');

      return token;
    } else {
      // Procesar la respuesta de error
      throw Exception('Error en el inicio de sesión: ${response.statusCode}');
    }
  }

  Future<String?> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      
      home: Scaffold(
        appBar: AppBar(
          title: Text('Inicio de sesion'),
          leading: BackButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyApp()),
              );
            },
          ),),
        body: Center(
          child: Column(
            children: [
              Container(
                child: cuerpo(),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 15.0, vertical: 5.0),
                child: TextField(
                  controller: correoController,
                  decoration: const InputDecoration(
                    hintText: "Correo electrónico",
                    fillColor: Colors.white,
                    filled: true,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 15.0, vertical: 5.0),
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
                    MaterialPageRoute(builder: (context) => registrar()),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
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
      "Iniciar sesión",
      style: TextStyle(
        color: Colors.black,
        fontSize: 30.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
