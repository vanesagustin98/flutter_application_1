import 'package:flutter/material.dart';

class Musica extends StatefulWidget {
  const Musica({super.key});

  @override
  State<Musica> createState() => _MusicaState();
}

class _MusicaState extends State<Musica> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [ 
          const Text("Musica!", style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),),
          TextButton(onPressed: (){}, child: const Text("hola mundo"))
        ]),
        ],
      ),
    );
  }
}