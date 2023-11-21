import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/Configuracion.dart';
// import 'package:flutter_application_1/screens/Agenda.dart';
import 'package:flutter_application_1/screens/Dato_de_vehiculo.dart';
import 'package:flutter_application_1/screens/Historial_de_mantenimientos.dart';
// import 'package:flutter_application_1/screens/Historial_de_mantenimientos.dart';
import 'package:flutter_application_1/screens/Inicio_de_sesion.dart';
import 'package:flutter_application_1/screens/Registro.dart';
// import 'package:flutter_application_1/screens/Perfil_usuario.dart';
import 'package:flutter_application_1/screens/Registro_de_gastos.dart';
import 'package:flutter_application_1/screens/Registrodeproducto.dart';
import 'package:flutter_application_1/screens/Registrodevehiculos.dart';
import 'package:flutter_application_1/screens/TalleresMecanicos.dart';
import 'package:flutter_application_1/screens/listadetiendas.dart';
import 'package:flutter_application_1/screens/registo_afiliado.dart';
// import 'package:flutter_application_1/screens/TalleresMecanicos.dart';
// import 'package:flutter_application_1/screens/Inicio_de_sesion.dart';
// import 'package:flutter_application_1/screens/Tienda.dart';
// import 'package:flutter_application_1/screens/Talleres_mecanico.dart';
// import 'package:flutter_application_1/screens/Configuracion.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      //  routes: {
      // '/home': (context) => MyApp(),
      // },
      home: SBottomNavigationBar(),
    );
  }
}

class SBottomNavigationBar extends StatefulWidget {
  const SBottomNavigationBar({Key? key}) : super(key: key);

  @override
  _SBottomNavigationBarState createState() => _SBottomNavigationBarState();
}

class _SBottomNavigationBarState extends State<SBottomNavigationBar> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    Datos_vehiculos(),
    Talleres_Mecanicos(),
    Datos_tienda(),
    Iniciosesion(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today),
              label: 'Agenda',
              backgroundColor: Colors.brown),
          BottomNavigationBarItem(
              icon: Icon(Icons.motorcycle_sharp),
              label: 'Talleres Mecanicos',
              backgroundColor: Colors.orange),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag),
              label: 'Tienda',
              backgroundColor: Colors.lightBlue),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings_outlined),
              label: 'Configuracion',
              backgroundColor: Colors.lightBlue),
          // BottomNavigationBarItem(
          //     icon: Icon(Icons.calendar_view_month_sharp),
          //     label: 'Agenda2',
          //     backgroundColor: Color.fromARGB(255, 244, 3, 140)),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color.fromARGB(255, 128, 8, 240),
        onTap: _onItemTapped,
      ),
    );
  }
}
