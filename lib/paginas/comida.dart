import 'package:flutter/material.dart';

class Comida extends StatefulWidget {
  const Comida({super.key});

  @override
  State<Comida> createState() => _ComidaState();
}

class _ComidaState extends State<Comida> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [ 
          const Text("Comida y Bebidas!", style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),),
          TextButton(onPressed: (){}, child: const Text("hola mundo"))
        ]),
        ],
      ),
    );
  }
}