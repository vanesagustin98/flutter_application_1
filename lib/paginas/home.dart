import 'package:flutter/material.dart';
import 'package:flutter_application_1/Utils/LoginUtil.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/paginas/Musica.dart';
import 'package:flutter_application_1/paginas/arte.dart';
import 'package:flutter_application_1/paginas/comida.dart';
import 'package:flutter_application_1/paginas/deportes.dart';

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
          children: [ 
          const Text("Diviertete!", style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),),
          const SizedBox(height: 20),
          iconos(context),
          const SizedBox(height: 30),
          cerrar_sesion_google(context)]
        )
        ],
      ),
    );
  }
}

// ignore: non_constant_identifier_names
Widget cerrar_sesion_google(context){
  return SizedBox(
    width: MediaQuery.of(context).size.width*0.8,
    height: 50,
    child: 
      ElevatedButton(
        onPressed: () {
          LoginUtil().signOutGoogle();
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context){
              return const MiApp();
            })
          );
        },
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.black,
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)), 
        child: const Center(child: 
          Text("Cerrar Sesión")
        ) 
        
      ),
      
      
  );
}
Widget iconos(context){
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
      const Text("Explora", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
        ), 
        child:
          const Image(image: NetworkImage("https://upload.wikimedia.org/wikipedia/commons/8/83/San_Juan_de_Pasto_de_noche.jpg"),width: 340, height: 150,)
      ),
    ],),
    
    
    const SizedBox(height: 20,),
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
      Column(children: [
        const Text("Musica", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return const Musica();
                  },
                ),
              );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white
          ), 
          child:const Image(image: NetworkImage("https://cdn-icons-png.flaticon.com/512/195/195123.png"), width: 150, height: 150,),),
          ],),
      const SizedBox(width: 10,),
      Column(children: [
        const Text("Arte y Cultura", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return const Arte();
                  },
                ),
              );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white
          ), 
          child:const Image(image: NetworkImage("https://cdn-icons-png.flaticon.com/512/201/201610.png"), width: 150, height: 150,),),
          ],),
    ],),
    const SizedBox(height: 20,),
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
      Column(children: [
        const Text("Comida y Bebidas", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return const Comida();
                  },
                ),
              );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
          ), 
          child:const Image(image: NetworkImage("https://cdn-icons-png.flaticon.com/512/3565/3565597.png"), width: 150, height: 150,),),
          ],),
    
      const SizedBox(width: 10,),
      Column(children: [
        const Text("Recreación y Deportes", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return const Deportes();
                  },
                ),
              );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
          ), 
          child:const Image(image: NetworkImage("https://cdn-icons-png.flaticon.com/512/857/857455.png"), width: 150, height: 150,),),
          ],),
    ],),
    
    
  ],);
}

