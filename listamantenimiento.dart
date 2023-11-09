import 'package:flutter/material.dart';

class ListadoMantenimiento extends StatelessWidget {
  const ListadoMantenimiento({super.key});
  static final nombrepagina = 'listado';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Historial de mantenimiento',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Historial de mantenimiento'),
        ),
        body:ListView(
          children: _crearitem()
        )
        ),
      
    );
  }
  
  _crearitem() {

    
  }
}
