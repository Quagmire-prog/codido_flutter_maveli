import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Gasto {
  
  final String descripcion;
  final double monto;
  final int idAuto;

  Gasto({
    
    required this.descripcion,
    required this.monto,
    required this.idAuto,
  });
}

class RegistroGastosScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro de Gastos'),
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
  // final TextEditingController _fechaController = TextEditingController();
  final TextEditingController _descripcionController = TextEditingController();
  final TextEditingController _montoController = TextEditingController();
  final TextEditingController _idAutoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: _descripcionController,
            decoration: InputDecoration(labelText: 'Descripción'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor, ingresa la descripción';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _montoController,
            decoration: InputDecoration(labelText: 'Monto'),
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor, ingresa el monto';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _idAutoController,
            decoration: InputDecoration(labelText: 'ID del Auto'),
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor, ingresa el ID del auto';
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
    // final String fecha = _fechaController.text;
    final String descripcion = _descripcionController.text;
    final double monto = double.parse(_montoController.text);
    final int id_vehiculo = int.parse(_idAutoController.text);

    final response = await http.post(
      Uri.parse('http://192.168.1.24:8080/api/Gastos'),
      body: jsonEncode({
        
        'descripcion': descripcion,
        'fecha':DateTime.now().toIso8601String(),
        'monto': monto,
        'id_vehiculo': id_vehiculo,
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
