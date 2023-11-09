import 'package:flutter/material.dart';
// import 'package:flutter_application_1/screens/Dato_de_matenimiento.dart';
import 'package:flutter_application_1/screens/listamantenimiento.dart';




class Historial_mantenimiento extends StatelessWidget {
  // const Historial_mantenimiento({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Historial de mantenimiento',
      routes: {
        ListadoMantenimiento.nombrepagina : (BuildContext context) => ListadoMantenimiento()
      },
      home: ListadoMantenimiento()
      );
  }
}
  