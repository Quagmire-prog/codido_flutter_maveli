import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/Dato_de_vehiculo.dart';
import 'package:flutter_application_1/screens/Registro_de_gastos.dart';
import 'package:flutter_application_1/screens/Registroservicio.dart';
import 'package:http/http.dart' as http;

class Gastos {
  final String fecha;
  final String descripcion;
  final double monto;

  Gastos({
    required this.fecha,
    required this.descripcion,
    required this.monto,
  });

  factory Gastos.fromJson(Map<String, dynamic> json) {
    return Gastos(
      descripcion: json['descripcion'],
      fecha: json['fecha'],
      monto: json['monto'],
    );
  }
}

Future<List<Gastos>> historial() async {
  try {
    final response =
        await http.get(Uri.parse('http://172.16.144.157:8080/api/Gastos'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => Gastos.fromJson(json)).toList();
    } else {
      throw Exception('Error al cargar los gastos');
    }
  } catch (error) {
    print('Error en la solicitud HTTP: $error');
    return [];
  }
}
class HistorialDeGastos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Historial de Gastos",
      home: Scaffold(
        appBar: AppBar(
          title: Text('Historial de Gastos'),
          leading: BackButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Datos_vehiculos()),
              );
            },
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: HistorialGastos(),
            ),
            SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegistroGastosScreen()),
                      );
                    },
                    child: Text('Registro de Gastos'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Registroservicio()),
                      );
                    },
                    child: Text('Registro de Servicio'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HistorialGastos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Gastos>>(
      future: historial(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'No se pudo cargar el historial de gastos. Por favor, verifica tu conexión.',
                style: TextStyle(fontSize: 16.0),
              ),
            ),
          );
        } else {
          List<Gastos> expenses = snapshot.data!;

          if (expenses.isEmpty) {
            return Container(
              width: MediaQuery.of(context).size.width,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'No hay historial de gastos disponible.',
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
              ),
            );
          }

          return Expanded(
            child: ListView.builder(
              itemCount: expenses.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      title: Text(expenses[index].descripcion),
                      subtitle: Column(
                        children: [
                          Text(expenses[index].fecha),
                          Text('\$${expenses[index].monto.toString()}'),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        }
      },
    );
  }
}

