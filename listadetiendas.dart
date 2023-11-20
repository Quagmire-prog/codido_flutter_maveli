import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
// Modelo para los productos
class Product {
  final String id;
  final String name;
  final double price;

  Product({required this.id, required this.name, required this.price});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      price: json['price'].toDouble(),
    );
  }
}

// Modelo para los catálogos
class Catalog {
  final String id;
  final String name;
  final List<Product> products;

  Catalog({required this.id, required this.name, required this.products});

  factory Catalog.fromJson(Map<String, dynamic> json) {
    var productList = json['products'] as List;
    List<Product> products = productList.map((product) => Product.fromJson(product)).toList();

    return Catalog(
      id: json['id'],
      name: json['name'],
      products: products,
    );
  }
}

// Modelo para las tiendas
class Store {
  final String id;
  final String name;
  final List<Catalog> catalogs;

  Store({required this.id, required this.name, required this.catalogs});

  factory Store.fromJson(Map<String, dynamic> json) {
    var catalogList = json['catalogs'] as List;
    List<Catalog> catalogs = catalogList.map((catalog) => Catalog.fromJson(catalog)).toList();

    return Store(
      id: json['id'],
      name: json['name'],
      catalogs: catalogs,
    );
  }
}

Future<List<Store>> fetchStoresFromBackend() async {
  final response = await http.get(Uri.parse('http://192.168.1.24:8080/api/afiliados'));

  if (response.statusCode == 200) {
    List<dynamic> data = json.decode(response.body);
    return data.map((json) => Store.fromJson(json)).toList();
  } else {
    throw Exception('Error al cargar las tiendas desde el backend');
  }
}
