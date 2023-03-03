import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/paginas/inicio_sesion.dart';
import 'package:flutter_application_1/paginas/registro.dart';

void main() => runApp(const MiApp());


class MiApp extends StatelessWidget {
  const MiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Mi App",
      home: Inicio(),
    );
  }
}

class Inicio extends StatefulWidget {
  const Inicio({super.key});

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  @override
  Widget build(BuildContext context) {
    final Future<FirebaseApp>_inicio_firebase = Firebase.initializeApp();
    return Scaffold(
      // appBar: AppBar(),
      body: FutureBuilder(
        future: _inicio_firebase,
        builder: (context, snapshot) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 200,
                alignment: Alignment.topLeft,
                child: const Image(image: NetworkImage("https://previews.123rf.com/images/creativika/creativika1605/creativika160500078/57318436-fondo-abstracto-con-c%C3%ADrculos-naranjas-ilustraci%C3%B3n-vectorial.jpg")),
              ),
              Container(
                // width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 60),
                child: const Image(image: NetworkImage("https://es.pov21.com/wp-content/uploads/2020/04/Qu%C3%A9-aprend%C3%AD-de-las-personas.jpeg")),
                // child: Image(image: FileImage(File("D:\\Documentos\\Cualquier cosa\\System\\WhatsApp Image 2020-12-14 at 15.36.05.jpeg"))),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width*0.8,
                child: ElevatedButton(
                  onPressed: () =>{
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context)=>const registro())
                    )
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 255, 161, 21), textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)), 
                  child: const Text("Únete a nuestra comunidad") 
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width*0.8,
                child: ElevatedButton(
                  onPressed: () =>{
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context)=>const inicio_sesion())
                    )
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 255, 161, 21),textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)), 
                  child: const Text("Inicia Sesión") 
                  ),
              ),
              // ignore: prefer_const_constructors
              SizedBox(
                height: 50,
              ),
              Container(
                height: 200,
                alignment: Alignment.bottomRight,
                child: const Image(image: NetworkImage("https://previews.123rf.com/images/creativika/creativika1605/creativika160500078/57318436-fondo-abstracto-con-c%C3%ADrculos-naranjas-ilustraci%C3%B3n-vectorial.jpg")),
              )
            ],
          );
        }
      )
    );
  }
}


