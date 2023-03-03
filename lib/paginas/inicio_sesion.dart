import 'package:flutter/material.dart';
import 'package:flutter_application_1/Utils/LoginUtil.dart';
import 'package:flutter_application_1/paginas/home.dart';
import 'package:flutter_application_1/paginas/registro.dart';
import 'dart:developer' as developer;

// ignore: camel_case_types
class inicio_sesion extends StatefulWidget {
  const inicio_sesion({super.key});

  @override
  State<inicio_sesion> createState() => _inicio_sesionState();
}

// ignore: camel_case_types
class _inicio_sesionState extends State<inicio_sesion> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: ListView(
        children: [Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // ignore: prefer_const_constructors
            Container(
              height: 180,
              alignment: Alignment.bottomLeft,
              child: const Image(image: NetworkImage("https://previews.123rf.com/images/creativika/creativika1605/creativika160500078/57318436-fondo-abstracto-con-c%C3%ADrculos-naranjas-ilustraci%C3%B3n-vectorial.jpg")),
            ),
            sesion(),
            boton_sesion(context),
            const SizedBox(height: 10),
            boton_sesion_google(context),
            cuenta_existente(context),
          ],
        ),
        ]
      ),
    );
  }
}


Widget campoUsuario(){
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
        hintText: "Usuario",
        prefixIcon: Icon(Icons.account_circle,color: Colors.black87),
        // fillColor: Color.fromARGB(214, 214, 214, 214),
        filled: true
      ),
    ),
  );
}
Widget campoContrasena(){
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
    child: const TextField(
      obscureText: true,
      decoration: InputDecoration(
        focusedBorder: InputBorder.none,
        enabledBorder: OutlineInputBorder(
          borderRadius: 
            BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide(
              style: BorderStyle.none),
        ),
        hintText: "Contraseña",
        prefixIcon: Icon(Icons.password,color: Colors.black87),
        // fillColor: Color.fromARGB(214, 214, 214, 214),
        filled: true
      ),
    ),
  );
}

Widget sesion(){
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 20),
    child: Column(children: [
      Container(
            // width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: const Image(image: NetworkImage("https://es.pov21.com/wp-content/uploads/2020/04/Qu%C3%A9-aprend%C3%AD-de-las-personas.jpeg")),
            // child: Image(image: FileImage(File("D:\\Documentos\\Cualquier cosa\\System\\WhatsApp Image 2020-12-14 at 15.36.05.jpeg"))),
          ),
      const Text("Bienvenido de vuelta!", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
      campoUsuario(),
      campoContrasena(),
      TextButton(onPressed: () =>{}, child: const Text("¿Olvidaste tu contraseña?"))
    ],),
    // decoration: BoxDecoration(border: Border.all(color: Color.fromARGB(255, 255, 161, 21))),
    
  );
}

// ignore: non_constant_identifier_names
Widget cuenta_existente(context){
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      const Text("¿No tienes una cuenta? "),
      TextButton(onPressed: () =>{Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=>const registro())
                )}, child: const Text("Registrate"))
    ],
  );
}

// ignore: non_constant_identifier_names
Widget boton_sesion(context){
  return SizedBox(
    width: MediaQuery.of(context).size.width*0.8,
    height: 50,
    child: ElevatedButton(
      onPressed: () {Navigator.push(
        context,
        MaterialPageRoute(builder: (context)=>const Home())
      ); },
      style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 255, 161, 21),textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)), 
      child: const Text("Iniciar Sesión") 
      ),
  );
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
              // developer.log(user as String);
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