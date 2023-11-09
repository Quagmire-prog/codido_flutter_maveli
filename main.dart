import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/Agenda.dart';
// import 'package:flutter_application_1/screens/Historial_de_mantenimientos.dart';
import 'package:flutter_application_1/screens/Inicio_de_sesion.dart';
// import 'package:flutter_application_1/screens/Inicio_de_sesion.dart';
import 'package:flutter_application_1/screens/Tienda.dart';
import 'package:flutter_application_1/screens/Talleres_mecanico.dart';
import 'package:flutter_application_1/screens/Configuracion.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
      //"/inicio" : bui
      },
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
    
    const Agenda(),
    const TalleresMecanicos(),
    const tienda(),
    const Configuration(),
    Iniciosesion()
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
              BottomNavigationBarItem(
              icon: Icon(Icons.calendar_view_month_sharp),
              label: 'Agenda2',
              backgroundColor: Color.fromARGB(255, 244, 3, 140)),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color.fromARGB(255, 128, 8, 240),
        onTap: _onItemTapped,
      ),
    );
  }
}
