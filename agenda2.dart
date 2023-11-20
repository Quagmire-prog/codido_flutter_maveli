// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/screens/Historial_de_mantenimientos.dart';
// import 'package:flutter_application_1/screens/Registro_de_gastos.dart';


// class Agenda2 extends StatelessWidget {
//   const Agenda2({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: STabBar(),
//     );
//   }
// }




// ///[STabBar] class describe the [TabBar] widget details code
// ///******************************************************************
// class STabBar extends StatelessWidget {
//   const STabBar({Key? key}) : super(key: key);
  
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       initialIndex: 1,
//       length: 3,
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text('TabBar Widget'),
//           bottom: const TabBar(
//             tabs: <Widget>[
//               Tab(
//                 icon: Icon(Icons.cloud_outlined),
//               ),
//               Tab(
//                 icon: Icon(Icons.beach_access_sharp),
//               ),
//               Tab(
//                 icon: Icon(Icons.brightness_5_sharp),
//               ),
//             ],
//           ),
//         ),
//         body:  TabBarView(
//           children: <Widget>[
//             Historial_mantenimiento(),
//             Registrogasto()
//             ,
//           ],
//         ),
//       ),
//     );
//   }
// }