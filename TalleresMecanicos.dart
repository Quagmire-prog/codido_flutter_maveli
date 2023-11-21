import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
class Talleres_Mecanicos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Datos_talleres(),
    );
  }
}

class Taller {
  final int id;
  final String nombre;
  final String direccion;
  final int telefono;
  final String propietario;
  final String password;
  final String email;

  Taller({
    required this.id,
    required this.nombre,
    required this.direccion,
    required this.telefono,
    required this.propietario,
    required this.email,
    required this.password
  });
  factory Taller.fromJson(Map<String, dynamic> json) {
  
    return Taller(
        id: json['id_negocio'],
        nombre: json['propietario'],
        propietario: json['nombre_negocio'],
        direccion: json['direccion'],
        telefono: json['telefono_negoc'],
        email: json['email'],
        password: json ['clave_acceso']
        );
  }
}
Future<List<Taller>> Listaafiliados() async {
  try {
    final response =
        await http.get(Uri.parse('http://172.16.144.157:8080/api/Negocio'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => Taller.fromJson(json)).toList();
    } else {
      throw Exception('Error al cargar los gastos');
    }
  } catch (error) {
    print('Error en la solicitud HTTP: $error');
    return [];
  }
}


class Datos_talleres extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "vehiculos",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Talleres"),
        ),
        body: FutureBuilder<List<Taller>>(
          future: Listaafiliados(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              List<Taller> listaafiliados = snapshot.data!;

              if (listaafiliados.isEmpty) {
                // Si no hay vehículos, muestra el mensaje en una tarjeta
                return Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Card(
                        child: Container(
                          padding: const EdgeInsets.all(16.0),
                          child: const Text('No se encontró ningún taller'),
                        ),
                      ),
                    ),
                  ],
                );
              }

              // Si hay vehículos, muestra la lista en tarjetas
              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: listaafiliados.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            // Navegar a la nueva pantalla cuando se toca un elemento
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => listaproductos(),
                            //   ),
                            // );
                          },
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListTile(
                                title: Text(listaafiliados[index].propietario),
                                subtitle: Column(
                                  children: [
                                    Text(listaafiliados[index].direccion),
                                    Text(
                                        '${listaafiliados[index].telefono.toString()}'),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: FloatingActionButton(
                        onPressed: () {
                          // Acciones cuando se presiona el botón flotante
                          _launchWhatsApp();
                        },
                        child: Icon(Icons.message),
                      ),
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }

   void _launchWhatsApp() async {
    String phoneNumber = '82353613';
    String message = 'Hola, ¿cómo estás?';

    // Si tienes un mensaje específico, puedes utilizar esta URL
    String url = 'https://wa.me/$phoneNumber/?text=${Uri.encodeFull(message)}';

    // Si solo quieres abrir WhatsApp sin un mensaje específico, usa esta URL
    // String url = 'https://wa.me/$phoneNumber';

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'No se pudo abrir WhatsApp.';
    }
  }
}
