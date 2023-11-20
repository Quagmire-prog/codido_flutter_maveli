import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class productos{
   final String nombre;
  final String marca;
  final String numero_parte;
  final String categoria;
  final Float costo;
  final int cantidad_stock;
  final int anio_fabricacion;
  final String modelo_auto;
  final int id_afiliado;
  productos({
    required this.nombre,
    required this.marca,
    required this.numero_parte,
    required this.categoria,
    required this.costo,
    required this.cantidad_stock,
    required this.anio_fabricacion,
    required this.modelo_auto,
    required this.id_afiliado
  });
}

class RegistrarProductos extends StatelessWidget {
  const RegistrarProductos({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Registro Producto',
      home: HomeRegistroProducto(),
    );
  }
}

class HomeRegistroProducto extends StatefulWidget {
  const HomeRegistroProducto({super.key});

  @override
  State<HomeRegistroProducto> createState() => _HomeRegistroProductoState();
}

class _HomeRegistroProductoState extends State<HomeRegistroProducto> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nombreproductoController = TextEditingController();
  final TextEditingController marcaController = TextEditingController();
  final TextEditingController numeroparteController = TextEditingController();
  final TextEditingController categoriaController = TextEditingController();
  final TextEditingController costoController = TextEditingController();
  final TextEditingController cantidadStockController = TextEditingController();
  final TextEditingController aniofabricacionController = TextEditingController();
  final TextEditingController modeloautoController = TextEditingController();
  final TextEditingController idafiliadoController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Registro de productos'),
      ),
      body: Form(
        key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: nombreproductoController,
            decoration: const InputDecoration(labelText: 'Nombre del producto'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor, ingresa el nombre del producto';
              }
              return null;
            },
          ),
          TextFormField(
            controller: marcaController,
            decoration:  const InputDecoration(labelText: 'Modelo del vehiculo'),
            
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor, ingresa el modelo del vehiculo';
              }
              return null;
            },
          ),
          TextFormField(
            controller: numeroparteController,
            decoration: InputDecoration(labelText: 'Numéro de parte'),
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor, ingresa el numéro de parte';
              }
              return null;
            },
          ),
          TextFormField(
            controller: categoriaController,
            decoration: InputDecoration(labelText: 'Categoria'),
           
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor, ingresa la categoria';
              }
              return null;
            },
          ),
          TextFormField(
            controller: costoController,
            decoration: InputDecoration(labelText: 'Costo'),
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor, ingresa el Costo';
              }
              return null;
            },
          ),
          TextFormField(
            controller: cantidadStockController,
            decoration: InputDecoration(labelText: 'Cantidad en Stock'),
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor, ingrese la cantidad en stock';
              }
              return null;
            },
          ),
          TextFormField(
            controller: aniofabricacionController,
            decoration: InputDecoration(labelText: 'Año de fabricación'),
             keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor, ingresa el año de fabricacion';
              }
              return null;
            },
          ),
          TextFormField(
            controller: modeloautoController,
            decoration: InputDecoration(labelText: 'Modelo de auto'),
           
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor, ingresa el modelo del auto';
              }
              return null;
            },
          ),
          TextFormField(
            controller: idafiliadoController,
            decoration: InputDecoration(labelText: 'ID del afiliado'),
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor, ingresa el ID del afiliado';
              }
              return null;
            },
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                // Envía los datos al servidor para registrar el gasto
                RegistrarProductos();
              }
            },
            child: Text('Registrar Gasto'),
          ),
        ],
      ),
    ),
    );
  }
  void RegistrarProductos() async {
    
    final String nombre = nombreproductoController.text;
  final String marca = marcaController.text;
  final String numero_parte = numeroparteController.text;
  final String categoria = categoriaController.text;
  final double costo = double.parse(costoController.text);
  final int cantidad_stock = int.parse(cantidadStockController.text);
  final int anio_fabricacion = int.parse(aniofabricacionController.text);
  final String modelo_auto = modeloautoController.text;
  final int id_afiliado = int.parse(idafiliadoController.text);
    final response = await http.post(
      Uri.parse('http://192.168.1.24:8080/api/Productos'),
      body: jsonEncode({
        'nombre':nombre,
        'marca':marca,
        'numero_parte':numero_parte,
        'categoria': categoria,
        'costo':costo,
        'cantidad_stock':cantidad_stock,
        'anio_fabricacion':anio_fabricacion,
        'modelo_auto': modelo_auto,
        'id_afiliado': id_afiliado
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
