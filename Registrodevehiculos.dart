import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Vehiculo {
  final String marcca;
  final String descripcion;
  final double anio;
  final int id_usuario;

  Vehiculo({
    required this.marcca  ,
    required this.descripcion,
    required this.anio,
    required this.id_usuario,
  });

}
class RegistroVehiculo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro de vehiculos'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: RegistroGastosForm(),
      ),
    );
  }
}

class RegistroGastosForm extends StatefulWidget {
  @override
  _RegistroGastosFormState createState() => _RegistroGastosFormState();
}

class _RegistroGastosFormState extends State<RegistroGastosForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _anioController = TextEditingController();
  final TextEditingController _marcaController = TextEditingController();
  final TextEditingController _modeloController = TextEditingController();
  final TextEditingController _idusuarioController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: _marcaController,
            decoration: const InputDecoration(labelText: 'Marca del vehiculo'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor, ingresa la marca del vehiculo';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _modeloController,
            decoration:  const InputDecoration(labelText: 'Modelo del vehiculo'),
            
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor, ingresa el modelo del vehiculo';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _anioController,
            decoration: InputDecoration(labelText: 'Año del vehiculo'),
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor, ingresa el año del vehiculo';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _idusuarioController,
            decoration: InputDecoration(labelText: 'ID del usuario'),
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor, ingresa el ID del usuario';
              }
              return null;
            },
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                // Envía los datos al servidor para registrar el gasto
                registrarGasto();
              }
            },
            child: Text('Registrar Gasto'),
          ),
        ],
      ),
    );
  }

  void registrarGasto() async {
    final int anio = int.parse(_anioController.text);
    final String Marca = _marcaController.text;
    final String Modelo = _modeloController.text;
    final int id_usuario = int.parse(_idusuarioController.text);

    final response = await http.post(
      Uri.parse('http://192.168.1.24:8080/api/Automovil'),
      body: jsonEncode({
        'modelo': Modelo,
        'marca': Marca,
        'anio':anio ,
        'id_usuario': id_usuario,
      }),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      // Gasto registrado con éxito
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Gasto registrado con éxito'),
      ));
    } else {
      // Error al registrar el gasto
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Error al registrar el gasto'),
      ));
    }
  }
}
