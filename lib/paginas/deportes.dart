import 'package:flutter/material.dart';

class Deportes extends StatefulWidget {
  const Deportes({super.key});

  @override
  State<Deportes> createState() => _DeportesState();
}

class _DeportesState extends State<Deportes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [ 
          const Text("Recreación y Deportes!", style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),),
          TextButton(onPressed: (){}, child: const Text("hola mundo"))
        ]),
        ],
      ),
    );
  }
}