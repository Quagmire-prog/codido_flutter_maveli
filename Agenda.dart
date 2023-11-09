import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/agenda2.dart';

class Agenda extends StatelessWidget {
  const Agenda({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "Agenda",
      home: _homeAgenda(),
    );
  }
}
class _homeAgenda extends StatefulWidget {
  const _homeAgenda({super.key});

  @override
  State<_homeAgenda> createState() => __homeAgendaState();
}

class __homeAgendaState extends State<_homeAgenda> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Agenda"),
      ),
      body: _Agenda(),
    );
  }
}
Widget _Agenda(){
  return InkWell(
    onTap: ()=>Agenda2(),
    child: Container(
      child: const Text("Genesis GXT 200")),
  );
}
// Widget _Datos(){
//   return Column(
//     children: [
//       Container(
//         child: const Text("dueno: norlan urbina"),
//       )
//     ],
//   );
// }