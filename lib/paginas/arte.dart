import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Arte extends StatefulWidget {
  const Arte({super.key});

  @override
  State<Arte> createState() => _MusicaState();
}

class _MusicaState extends State<Arte> {
  @override
  Widget build(BuildContext context) {

    
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("¡Arte y Cultura!", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
        backgroundColor: const Color.fromARGB(255, 4, 146, 23),),
      body: ListView(
        children: [Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [ 
            Row(children: [
              infoMemorias(context),
              imagenMemorias()
            ],),
          botonIpiales(context),
            Row(children: [
              infoSur(context),
              imagenSur()
            ],),
          botonCasona(context),
        ]),
        ],
      ),
    );
  
}

Widget infoMemorias(context){
  return const Padding(
    padding: EdgeInsets.only(top: 30,left: 40,right: 20),
    child: Column(
      children: [
        Row(
          children: [
            Column(children: [
                Text("25", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                Text("ABR", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
              ],),
            SizedBox(width: 15),
            Column(children: [
                Text("Memorias del Pueblo", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                Text("mar, 2:00", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
              ],),
          ]
        ),
      ],
    ),
  );
}

Widget imagenMemorias(){
  return Padding(
    padding: const EdgeInsets.only(top: 30),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: const Image(image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSJAtofRl1wPJPLlgCPYSb91hAhY1H6GKDzgbi_5O_Kyw&s=10"),width: 80, height: 60),
    ),
  );
}

Set<Marker>  _marcadorIpiales(){
  var tmp = <Marker>{};

  tmp.add( const Marker(
    markerId:MarkerId("sanFelipe"),
    position: LatLng(0.8298055791437331, -77.62610321798512),
    infoWindow: InfoWindow( //popup info 
      title: 'Club Autopanamericano S.A.',
      snippet: 'Av. Panamericana N. 1A-100, Ipiales, Nariño',
    ),
  ));
  
  return tmp;
}

Widget botonIpiales(context){
  return TextButton(
    onPressed: (){
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) {
            return GoogleMap(initialCameraPosition:  const CameraPosition(
              target: LatLng(0.8298055791437331, -77.62610321798512),
              zoom: 20.0),
                // ignore: no_leading_underscores_for_local_identifiers
              myLocationButtonEnabled: true,
              myLocationEnabled: true,
              markers: _marcadorIpiales()
            );
          },
        ),
      );
    }, 
    child: const Text("Ver Ubicación")
  );
}
Widget infoSur(context){
  return const Padding(
    padding: EdgeInsets.only(top: 30,left: 40,right: 20),
    child: Column(
      children: [
        Row(
          children: [
            Column(children: [
                Text("20", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                Text("MAY", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
              ],),
            SizedBox(width: 30),
            Column(children: [
                Text("El sur y su Historia", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                Text("sáb, 17:00", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
              ],),
          ]
        ),
      ],
    ),
  );
}

Widget imagenSur(){
  return Padding(
    padding: const EdgeInsets.only(top: 30),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: const Image(image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRXwnFgk-nms828UEsp-3LWMOspNGymPgLAxo0Pd-aqCAt4flJ7mHSWEIk4bA&s"),width: 80, height: 60),
    ),
  );
}
Set<Marker>  _marcadorCasona(){
  var tmp = <Marker>{};

  tmp.add( const Marker(
    markerId:MarkerId("sanFelipe"),
    position: LatLng(1.2153107217466002, -77.28430824417904),
    infoWindow: InfoWindow( //popup info 
      title: 'Museo Taminango',
      snippet: 'Cra. 29 -13 , Pasto, Nariño',
    ),
  ));
  
  return tmp;
}

Widget botonCasona(context){
  return TextButton(
    onPressed: (){
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) {
            return GoogleMap(initialCameraPosition:  const CameraPosition(
              target: LatLng(1.2153107217466002, -77.28430824417904),
              zoom: 20.0),
                // ignore: no_leading_underscores_for_local_identifiers
              myLocationButtonEnabled: true,
              myLocationEnabled: true,
              markers: _marcadorCasona()
            );
          },
        ),
      );
    }, 
    child: const Text("Ver Ubicación")
  );
}
}