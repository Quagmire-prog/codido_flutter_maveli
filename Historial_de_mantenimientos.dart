import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class gastos {
  final String fecha;
  final String descripcion;
  final double monto;

  gastos({
    required this.fecha,
    required this.descripcion,
    required this.monto,
  });
  factory gastos.fromJson(Map<String, dynamic> json) {
    return gastos(
      descripcion: json['descripcion'],
      fecha: json['fecha'],
      monto: json['monto'],
      
    );
  }
}

Future<List<gastos>> historial() async {
  try {
    final response = await http.get(Uri.parse('http://192.168.1.24:8080/api/Gastos'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => gastos.fromJson(json)).toList();
    } else {
      throw Exception('Error al cargar los gastos');
    }
  } catch (error) {
    // Aquí puedes manejar el error de manera personalizada, imprimir un mensaje o lanzar otra excepción según sea necesario.
    print('Error en la solicitud HTTP: $error');
    throw Exception('Hubo un problema al obtener el historial de gastos');
  }
}
class Historialdegastos extends StatelessWidget {
  const Historialdegastos({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      
      child: Scaffold(
        appBar: AppBar(
          
          title: Text( 'Historial de gastos',)
          ),
          body: Historial_gastos(),
        ),
    );
  }
}
class Historial_gastos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<gastos>>(
      future: historial(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          // Mostrar una tarjeta indicando que no hay historial de gastos.
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
          List<gastos> expenses = snapshot.data!;

          if (expenses.isEmpty) {
            // Mostrar una tarjeta indicando que no hay historial de gastos.
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'No hay historial de gastos disponible.',
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
            );
          }

          // Construye la interfaz de usuario con la lista de gastos
          return ListView.builder(
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
                    // Otros detalles de la interfaz de usuario
                  ),
                ),
              );
            },
          );
        }
      },
    );
  }
}



