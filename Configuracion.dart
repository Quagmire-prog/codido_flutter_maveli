import 'package:flutter/material.dart';
// import 'package:flutter_application_1/screens/Inicio_de_sesion.dart';

class Configuration extends StatelessWidget {
  const Configuration({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Configuración'),
          // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(10.0),
          child: Center(
              child: Column(
            children: [
              perfil(),
            ],
          )),
        ),
      ),
    );
  }
}

Widget perfil() {
  return Card(
    child: InkWell(
      onTap: () {
        
      },
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
        child: const Text('Perfil'),
      ),
    ),
  );
}
