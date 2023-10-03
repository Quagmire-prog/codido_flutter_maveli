import 'package:flutter/material.dart';


void main() {
  runApp(Iniciosesion());
}
class Usuario {
  String correoElectronico;
  String contrasena;

  Usuario({required this.correoElectronico, required this.contrasena});
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
  void inicioUsuario() {
    final usuario = Usuario(
        correoElectronico: correoController.text,
        contrasena: constrasenaController.text);

    setState(() {
      usuarios.add(usuario);
    });
    
    correoController.clear();
  
    constrasenaController.clear();
  }

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
                padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
                child: const TextField(
                  
                  decoration: InputDecoration(
                    
                    hintText: "Correo electronico",
                    fillColor: Colors.white,
                    filled: true,
                    
                  ),
                ),
              ),
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
                  child: const TextField(
                   // controller: constrasenaController,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Contraseña",
                      fillColor: Colors.white,
                      filled: true,
                    ),
                  ),
                ),
                
                ElevatedButton(
                    onPressed: inicioUsuario,
                    child: Text("Iniciar sesion"),
                  )
                ],
              ),
            )));
  }
}

Widget cuerpo() {
  
  return Container(
    decoration: BoxDecoration(
      image: DecorationImage(image: NetworkImage("")
      ),
    ),
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
         children: [
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

