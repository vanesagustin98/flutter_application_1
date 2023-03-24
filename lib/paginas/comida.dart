import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Comida extends StatefulWidget {
  const Comida({super.key});

  @override
  State<Comida> createState() => _MusicaState();
}

class _MusicaState extends State<Comida> {
  @override
  Widget build(BuildContext context) {

    
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("¡Comida y Bebidas!", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
        backgroundColor: const Color.fromARGB(255, 255, 0, 0),),
      body: ListView(
        children: [Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [ 
            Row(children: [
              infoComic(context),
              imagenComic()
            ],),
          botonComic(context),
            Row(children: [
              infoBBC(context),
              imagenBBC()
            ],),
          botonBBC(context),
        ]),
        ],
      ),
    );
  
}

Widget infoComic(context){
  return const Padding(
    padding: EdgeInsets.only(top: 30,left: 40,right: 40),
    child: Column(
      children: [
        Row(
          children: [
            Column(children: [
                Text("25", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                Text("MAR", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
              ],),
            SizedBox(width: 30),
            Column(children: [
                Text("2x1 Alitas BBQ", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                Text("sab, 19:00", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
              ],),
          ]
        ),
      ],
    ),
  );
}

Widget imagenComic(){
  return Padding(
    padding: const EdgeInsets.only(top: 30),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: const Image(image: NetworkImage("https://d1uz88p17r663j.cloudfront.net/original/e26626fe54e6671ff1d31bd97526c8d9_Alitas_BBQ_2.jpg"),width: 80, height: 60),
    ),
  );
}

Set<Marker>  _marcadorComic(){
  var tmp = <Marker>{};

  tmp.add( const Marker(
    markerId:MarkerId("sanFelipe"),
    position: LatLng(1.2260916269861677, -77.28153999999999),
    infoWindow: InfoWindow( //popup info 
      title: 'Comic House Pasto',
      snippet: 'Cra. 34a #20-41, Pasto, Nariño',
    ),
  ));
  
  return tmp;
}

Widget botonComic(context){
  return TextButton(
    onPressed: (){
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) {
            return GoogleMap(initialCameraPosition:  const CameraPosition(
              target: LatLng(1.2260916269861677, -77.28153999999999),
              zoom: 20.0),
                // ignore: no_leading_underscores_for_local_identifiers
              myLocationButtonEnabled: true,
              myLocationEnabled: true,
              markers: _marcadorComic()
            );
          },
        ),
      );
    }, 
    child: const Text("Ver Ubicación")
  );
}
Widget infoBBC(context){
  return const Padding(
    padding: EdgeInsets.only(top: 30,left: 40,right: 40),
    child: Column(
      children: [
        Row(
          children: [
            Column(children: [
                Text("18", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                Text("MAR", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
              ],),
            SizedBox(width: 50),
            Column(children: [
                Text("San Patricio", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                Text("sáb, 20:00", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
              ],),
          ]
        ),
      ],
    ),
  );
}

Widget imagenBBC(){
  return Padding(
    padding: const EdgeInsets.only(top: 30),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: const Image(image: NetworkImage("https://cloudfront-us-east-1.images.arcpublishing.com/prisaradioco/PZMM2KNXW5PZ5DWB6NYYZLJDXI.jpg"),width: 80, height: 60),
    ),
  );
}
Set<Marker>  _marcadorBBC(){
  var tmp = <Marker>{};

  tmp.add( const Marker(
    markerId:MarkerId("sanFelipe"),
    position: LatLng(1.2277695060351121, -77.28262665767161),
    infoWindow: InfoWindow( //popup info 
      title: 'BBC- PUB PASTO',
      snippet: 'Calle 20 37-08 Pasto NAR',
    ),
  ));
  
  return tmp;
}

Widget botonBBC(context){
  return TextButton(
    onPressed: (){
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) {
            return GoogleMap(initialCameraPosition:  const CameraPosition(
              target: LatLng(1.2277695060351121, -77.28262665767161),
              zoom: 20.0),
                // ignore: no_leading_underscores_for_local_identifiers
              myLocationButtonEnabled: true,
              myLocationEnabled: true,
              markers: _marcadorBBC()
            );
          },
        ),
      );
    }, 
    child: const Text("Ver Ubicación")
  );
}
}