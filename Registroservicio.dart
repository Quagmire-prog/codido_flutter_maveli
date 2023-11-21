import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class tiposervico {
  final String Tipo_servicio;
  final String descripcion;
  final double costo;
  final int id_afiliado;

  tiposervico({
    required this.Tipo_servicio,
    required this.descripcion,
    required this.costo,
    required this.id_afiliado,
  });
}

class Registroservicio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro de servicio'),
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
  final TextEditingController tiposervicioController = TextEditingController();
  final TextEditingController descripcionController = TextEditingController();
  final TextEditingController costoController = TextEditingController();
  final TextEditingController _idafiliadoController = TextEditingController();
  final TextEditingController id_vehiculoController = TextEditingController();
  final TextEditingController id_tiposervicioController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: tiposervicioController,
            decoration: const InputDecoration(labelText: 'Tipo de servicio'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor, ingresa el tipo de servicio';
              }
              return null;
            },
          ),
          TextFormField(
            controller: descripcionController,
            decoration: const InputDecoration(labelText: 'Modelo del vehiculo'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor, ingresa la descipcion';
              }
              return null;
            },
          ),
          TextFormField(
            controller: costoController,
            decoration: InputDecoration(labelText: 'Costo del servicio'),
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor, ingresa el costo del servicio';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _idafiliadoController,
            decoration: InputDecoration(labelText: 'ID del afiliado'),
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor, ingresa el ID del usuario';
              }
              return null;
            },
          ),
           TextFormField(
            controller: id_tiposervicioController,
            decoration: InputDecoration(labelText: 'ID del tipo de servicio'),
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor, ingresa el ID del tipo servicio';
              }
              return null;
            },
          ),
           TextFormField(
            controller: id_vehiculoController,
            decoration: InputDecoration(labelText: 'ID del vehiculo'),
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor, ingresa el ID del vehiculo';
              }
              return null;
            },
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                // Envía los datos al servidor para registrar el gasto
                Registrotiposervicio();
                Registroservicio();
              }
            },
            child: Text('Registrar Gasto'),
          ),
        ],
      ),
    );
  }

  void Registrotiposervicio() async {
    final int idafiliado = int.parse(_idafiliadoController.text);
    final String descripcion = descripcionController.text;
    final String tiposervicio = tiposervicioController.text;
    final double costo = double.parse(costoController.text);

    final response = await http.post(
      Uri.parse('http://172.16.144.157:8080/api/tipo_servicio'),
      body: jsonEncode({
        'tipo_servicio': tiposervico,
        'descripcion': descripcion,
        'costo': costo,
        'id_afiliado': idafiliado,
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

  void Registroservicio() async {
    final int idtiposervico = int.parse(id_tiposervicioController.text);
    final int idvehiculo = int.parse(id_vehiculoController.text);
   

    final response = await http.post(
      Uri.parse('http://172.16.144.157:8080/api/servicio'),
      body: jsonEncode({
        'id_tiposervicio': idtiposervico,
        'id_vehiculo': idvehiculo ,        
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
