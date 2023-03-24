import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Deportes extends StatefulWidget {
  const Deportes({super.key});

  @override
  State<Deportes> createState() => _MusicaState();
}

class _MusicaState extends State<Deportes> {
  @override
  Widget build(BuildContext context) {

    
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("¡Deportes y Recreación!", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
        backgroundColor: const Color.fromARGB(255, 230, 197, 10),),
      body: ListView(
        children: [Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [ 
            Row(children: [
              infoMotocross(context),
              imagenMotocross()
            ],),
          botonChachagui(context),
            Row(children: [
              infoChaza(context),
              imagenChaza()
            ],),
          botonTuquerres(context),
        ]),
        ],
      ),
    );
  
}

Widget infoMotocross(context){
  return const Padding(
    padding: EdgeInsets.only(top: 30,left: 40,right: 10),
    child: Column(
      children: [
        Row(
          children: [
            Column(children: [
                Text("9", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                Text("ABR", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
              ],),
            SizedBox(width: 20),
            Column(children: [
                Text("Carrera de Motocross", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                Text("dom, 9:00", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
              ],),
          ]
        ),
      ],
    ),
  );
}

Widget imagenMotocross(){
  return Padding(
    padding: const EdgeInsets.only(top: 30),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: const Image(image: NetworkImage("https://upload.wikimedia.org/wikipedia/commons/9/95/MotoX_racing03_edit.jpg"),width: 80, height: 60),
    ),
  );
}

Set<Marker>  _marcadorChachagui(){
  var tmp = <Marker>{};

  tmp.add( const Marker(
    markerId:MarkerId("sanFelipe"),
    position: LatLng(1.359082736026052, -77.27716972362389),
    infoWindow: InfoWindow( //popup info 
      title: 'Health Garden Tours',
      snippet: 'Barrio vergel alto, casa 9, Chachagüí, Nariño',
    ),
  ));
  
  return tmp;
}

Widget botonChachagui(context){
  return TextButton(
    onPressed: (){
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) {
            return GoogleMap(initialCameraPosition:  const CameraPosition(
              target: LatLng(1.359082736026052, -77.27716972362389),
              zoom: 15.0),
                // ignore: no_leading_underscores_for_local_identifiers
              myLocationButtonEnabled: true,
              myLocationEnabled: true,
              markers: _marcadorChachagui()
            );
          },
        ),
      );
    }, 
    child: const Text("Ver Ubicación")
  );
}
Widget infoChaza(context){
  return const Padding(
    padding: EdgeInsets.only(top: 30,left: 40,right: 10),
    child: Column(
      children: [
        Row(
          children: [
            Column(children: [
                Text("20", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                Text("MAY", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
              ],),
            SizedBox(width: 10),
            Column(children: [
                Text("Campeonato de Chaza", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                Text("sáb, 10:00", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
              ],),
          ]
        ),
      ],
    ),
  );
}

Widget imagenChaza(){
  return Padding(
    padding: const EdgeInsets.only(top: 30),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: const Image(image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRXwnFgk-nms828UEsp-3LWMOspNGymPgLAxo0Pd-aqCAt4flJ7mHSWEIk4bA&s"),width: 80, height: 60),
    ),
  );
}
Set<Marker>  _marcadorTuquerres(){
  var tmp = <Marker>{};

  tmp.add( const Marker(
    markerId:MarkerId("sanFelipe"),
    position: LatLng(1.0878949501872397, -77.61214463404157),
    infoWindow: InfoWindow( //popup info 
      title: 'Coliseo de Tuquerres',
      snippet: 'a 22-125,, Cra. 20 #221, Túquerres, Nariño',
    ),
  ));
  
  return tmp;
}

Widget botonTuquerres(context){
  return TextButton(
    onPressed: (){
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) {
            return GoogleMap(initialCameraPosition:  const CameraPosition(
              target: LatLng(1.0878949501872397, -77.61214463404157),
              zoom: 15.0),
                // ignore: no_leading_underscores_for_local_identifiers
              myLocationButtonEnabled: true,
              myLocationEnabled: true,
              markers: _marcadorTuquerres()
            );
          },
        ),
      );
    }, 
    child: const Text("Ver Ubicación")
  );
}
}