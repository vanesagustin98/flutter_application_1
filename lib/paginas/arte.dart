import 'package:flutter/material.dart';

class Arte extends StatefulWidget {
  const Arte({super.key});

  @override
  State<Arte> createState() => _ArteState();
}

class _ArteState extends State<Arte> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [ 
          const Text("Arte y Cultura!", style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),),
          TextButton(onPressed: (){}, child: const Text("hola mundo"))
        ]),
        ],
      ),
    );
  }
}