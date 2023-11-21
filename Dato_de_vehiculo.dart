import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/Historial_de_mantenimientos.dart';
import 'package:flutter_application_1/screens/Registrodevehiculos.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Vehiculo {
  final String marca;
  final String modelo;
  final int anio;
  // final int id_usuario;

  Vehiculo({
    required this.marca,
    required this.modelo,
    required this.anio,
    // required this.id_usuario,
  });
  factory Vehiculo.fromJson(Map<String, dynamic> json) {
    return Vehiculo(
      marca: json['marca'],
      modelo: json['modelo'],
      anio: json['anio'],
      // id_usuario: json['id_usuario'],
    );
  }
}

Future<void> fetchData(int id) async {
  final url =
      'http://192.168.1.24:8080/api/Automovil/Usuario'; // Reemplaza con la URL de tu backend y ruta correspondiente

  try {
    final response = await http.post(
      Uri.parse(url),
      body: {'id': id.toInt()}, // Envía el ID al backend
    );

    if (response.statusCode == 200) {
      // La solicitud fue exitosa
      final Map<String, dynamic> data = json.decode(response.body);

      
      // ... imprime u opera sobre otros valores
    } else {
      // Si la solicitud no fue exitosa, maneja el error
      print('Error en la solicitud: ${response.statusCode}');
      print('Mensaje de error: ${response.body}');
    }
  } catch (e) {
    // Manejo de errores generales
    print('Error en la solicitud: $e');
  }
}

Future<List<Vehiculo>> historial() async {
  try {
    final response =
        await http.get(Uri.parse('http://172.16.144.157:8080/api/Automovil'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => Vehiculo.fromJson(json)).toList();
    } else {
      // Manejar casos de respuesta no exitosa según tus necesidades
      print('Error al cargar los vehículos: ${response.statusCode}');
      return []; // Devolver una lista vacía en caso de error
    }
  } catch (e) {
    // Manejar errores generales durante la solicitud
    print('Error en la solicitud: $e');

    return []; // Devolver una lista vacía en caso de error
  }

  //final response =
  //     await http.get(Uri.parse('http://192.168.1.24:8080/api/Automovil'));

  // if (response.statusCode == 200) {
  //   List<dynamic> data = json.decode(response.body);
  //   return data.map((json) => Vehiculo.fromJson(json)).toList();
  // } else {
  //   throw Exception('Error al cargar los gastos');
  // }
}
class Datos_vehiculos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "vehiculos",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Vehiculos"),
        ),
        body: FutureBuilder<List<Vehiculo>>(
          future: historial(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              List<Vehiculo> vehicles = snapshot.data!;

              if (vehicles.isEmpty) {
                // Si no hay vehículos, muestra el mensaje en una tarjeta
                return Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Card(
                        child: Container(
                          padding: const EdgeInsets.all(16.0),
                          child: const Text('No se encontró ningún vehículo'),
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
                      itemCount: vehicles.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            // Navegar a la nueva pantalla cuando se toca un elemento
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HistorialDeGastos(),
                              ),
                            );
                          },
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListTile(
                                title: Text(vehicles[index].marca),
                                subtitle: Column(
                                  children: [
                                    Text(vehicles[index].modelo),
                                    Text('${vehicles[index].anio.toString()}'),
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RegistroVehiculo(),
                            ),
                          );
                        },
                        child: Icon(Icons.add),
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
}
