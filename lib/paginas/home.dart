import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [campoBuscar(),
          const Text("Diviertete!", style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),),]
        )
        ],
      ),
    );
  }
}


Widget campoBuscar(){
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
    child: const TextField(
      decoration: InputDecoration(
        focusedBorder: InputBorder.none,
        enabledBorder: OutlineInputBorder(
          borderRadius: 
            BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide(
              style: BorderStyle.none),
        ),
        hintText: "Buscar",
        prefixIcon: Icon(Icons.account_circle,color: Colors.black87),
        // fillColor: Color.fromARGB(214, 214, 214, 214),
        filled: true
      ),
    ),
  );
}