import 'package:flutter/material.dart';
import 'package:flutter_application_1/paginas/inicio_sesion.dart';

// ignore: camel_case_types
class registro extends StatefulWidget {
  const registro({super.key});

  @override
  State<registro> createState() => _registroState();
}

// ignore: camel_case_types
class _registroState extends State<registro> {
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
            registrarse(),
            SizedBox(
              width: MediaQuery.of(context).size.width*0.8,
              height: 50,
              child: ElevatedButton(
                onPressed: () { },
                style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 255, 161, 21),textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)), 
                child: const Text("Registrarse") 
                ),
            ),
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

Widget registrarse(){
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 20),
    child: Column(children: [
      const Text("Registrate!", style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),),
      campoUsuario(),
      campoUsuario(),
      campoContrasena(),
      campoContrasena()
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
      const Text("¿Ya tienes una cuenta? "),
      TextButton(onPressed: () =>{Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=>const inicio_sesion())
                )}, child: const Text("Inicia Sesión"))
    ],
  );
}
