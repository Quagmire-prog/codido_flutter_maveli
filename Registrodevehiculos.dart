import 'package:flutter/material.dart';

class registrovehiculo extends StatelessWidget {
  const registrovehiculo({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Regitro vehiculo",
      home: HomeRegistrovehiculo(),
    );
  }
}

class HomeRegistrovehiculo extends StatefulWidget {
  const HomeRegistrovehiculo({super.key});

  @override
  State<HomeRegistrovehiculo> createState() => _HomeRegistrovehiculoState();
}

class _HomeRegistrovehiculoState extends State<HomeRegistrovehiculo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: ListView(
        children: [
          
        ],
      ),
    );
  }
}
