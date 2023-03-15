import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/paginas/home.dart';
import 'dart:developer' as developer;

import 'Utils/LoginUtil.dart';

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
    WidgetsFlutterBinding.ensureInitialized();
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
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 40),
                child: const Image(image: NetworkImage("https://es.pov21.com/wp-content/uploads/2020/04/Qu%C3%A9-aprend%C3%AD-de-las-personas.jpeg")),
                // child: Image(image: FileImage(File("D:\\Documentos\\Cualquier cosa\\System\\WhatsApp Image 2020-12-14 at 15.36.05.jpeg"))),
              ),
              boton_sesion_google(context),
              const SizedBox(height: 10),
              boton_sesion_facebook(context),
              // ignore: prefer_const_constructors
              SizedBox(height: 30),
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

// ignore: non_constant_identifier_names
Widget boton_sesion_google(context){
  return SizedBox(
    width: MediaQuery.of(context).size.width*0.8,
    height: 50,
    child: 
      ElevatedButton(
        onPressed: () {
          LoginUtil().signInWithGoogle().then((user) {
            //a pulir!!!
            if (user != null) {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return const Home();
                  },
                ),
              );
            } else {
              developer.log("loginScreen-build()ERROR user viene nulo");
            }
          });
        },
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.black,
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)), 
        child: const Row(children: [
          Image(image: NetworkImage("https://lh3.googleusercontent.com/StND2cg3sSbR6l-AHr3VdxKziIhEP4kYHQiTppD-aKc6gwn7PVdht1YqzjWSmwf5JLWf=w200-rwa"),
          height: 40,
          width: 40),
          SizedBox(width: 10,),
          Text("Iniciar Sesión con Google")
        ]) 
        
      ),
      
      
  );
}
// ignore: non_constant_identifier_names
Widget boton_sesion_facebook(context){
  return SizedBox(
    width: MediaQuery.of(context).size.width*0.8,
    height: 50,
    child: 
      ElevatedButton(
        onPressed: () {
          LoginUtil().signInWithFacebook();
          Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return const Home();
                  },
                ),
              );

          

        },
        style: ElevatedButton.styleFrom(
          foregroundColor: const Color.fromARGB(255, 53, 118, 202),
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)), 
        child: const Row(children: [
          Image(image: NetworkImage("https://cdn-icons-png.flaticon.com/512/124/124010.png"),
          height: 40,
          width: 40),
          SizedBox(width: 10,),
          Text("Iniciar Sesión con Facebook")
        ]) 
        
      ),
      
      
  );
}



