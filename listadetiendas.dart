import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/Registrodeproducto.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

// Modelo para los productos
class Product {
  final int id;
  final String nombre;
  final String marca;
  final String numero_parte;
  final String categoria;
  final Float costo;
  final int cantidad_stock;
  final int anio_fabricacion;
  final String modelo_auto;

  Product({
    required this.id,
    required this.nombre,
    required this.marca,
    required this.numero_parte,
    required this.categoria,
    required this.costo,
    required this.cantidad_stock,
    required this.anio_fabricacion,
    required this.modelo_auto,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        id: json['id_producto'],
        nombre: json['nombre'],
        marca: json['marca'],
        numero_parte: json['numero_parte'],
        categoria: json['categoria'],
        costo: json['costo'],
        cantidad_stock: json['cantidad_stock'],
        anio_fabricacion: json['anio_fabricacion'],
        modelo_auto: json['modelo_auto']);
  }
}

// Modelo para los catálogos
class Catalog {
  final String categoria;
  final List<Product> products;

  Catalog({required this.categoria, required this.products});

  factory Catalog.fromJson(Map<String, dynamic> json) {
    var productList = json['products'] as List;
    List<Product> products =
        productList.map((product) => Product.fromJson(product)).toList();

    return Catalog(
      categoria: json['categoria'],
      products: products,
    );
  }
}

// Modelo para las tiendas
class Store {
  final int id;
  final String nombre;
  final String propietario;
  final String direccion;
  final int telefono;
  final String password;
  final String email;

  Store(
      {required this.id,
      required this.nombre,
      required this.propietario,
      required this.direccion,
      required this.telefono,
      required this.email,
      required this.password});

  factory Store.fromJson(Map<String, dynamic> json) {
    // var catalogList = json['catalogs'] as List;
    // List<Catalog> catalogs =
    // catalogList.map((catalog) => Catalog.fromJson(catalog)).toList();

    return Store(
        id: json['id_negocio'],
        nombre: json['propietario'],
        propietario: json['nombre_negocio'],
        direccion: json['direccion'],
        telefono: json['telefono_negoc'],
        email: json['email'],
        password: json['clave_acceso']);
  }
}

Future<List<Store>> Listaafiliados() async {
  try {
    final response =
        await http.get(Uri.parse('http://172.16.144.157:8080/api/Negocio'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => Store.fromJson(json)).toList();
    } else {
      throw Exception('Error al cargar los gastos');
    }
  } catch (error) {
    print('Error en la solicitud HTTP: $error');
    return [];
  }
}

class Datos_tienda extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "vehiculos",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Tienda"),
        ),
        body: FutureBuilder<List<Store>>(
          future: Listaafiliados(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              List<Store> listaafiliados = snapshot.data!;

              if (listaafiliados.isEmpty) {
                // Si no hay vehículos, muestra el mensaje en una tarjeta
                return Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Card(
                        child: Container(
                          padding: const EdgeInsets.all(16.0),
                          child: const Text('No se encontró ningúna tienda'),
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
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => listaproductos(),
                              ),
                            );
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
                  // Padding(
                  //   padding: const EdgeInsets.all(16.0),
                  //   child: Align(
                  //     alignment: Alignment.bottomRight,
                  //     child: FloatingActionButton(
                  //       onPressed: () {
                  //         // Acciones cuando se presiona el botón flotante
                  //         Navigator.push(
                  //           context,
                  //           MaterialPageRoute(
                  //             builder: (context) => RegistroVehiculo(),
                  //           ),
                  //         );
                  //       },
                  //       child: Icon(Icons.add),
                  //     ),
                  //   ),
                  // ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}

Future<List<Product>> lista_producto() async {
  try {
    final response =
        await http.get(Uri.parse('http://172.16.144.157:8080/api/productos'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception('Error al cargar los gastos');
    }
  } catch (error) {
    print('Error en la solicitud HTTP: $error');
    return [];
  }
}

class listaproductos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "vehiculos",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Productos"),
          leading: BackButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Datos_tienda()),
              );
            },
          ),
        ),
        body: FutureBuilder<List<Product>>(
          future: lista_producto(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              List<Product> Productos = snapshot.data!;

              if (Productos.isEmpty) {
                // Si no hay vehículos, muestra el mensaje en una tarjeta
                return Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Card(
                        child: Container(
                          padding: const EdgeInsets.all(16.0),
                          child: const Text('No se encontró ningún producto'),
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
                      itemCount: Productos.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {},
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListTile(
                                title: Text(Productos[index].nombre),
                                subtitle: Column(
                                  children: [
                                    Text(Productos[index].marca),
                                    Text(
                                        '${Productos[index].anio_fabricacion.toString()}'),
                                    Text(Productos[index].numero_parte),
                                    Text(Productos[index].categoria),
                                    Text(Productos[index].modelo_auto),
                                    Text(Productos[index].marca),
                                    Text(
                                        '${Productos[index].costo.toString()}'),
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
                              builder: (context) => RegistrarProductos(),
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
