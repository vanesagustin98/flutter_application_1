import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Musica extends StatefulWidget {
  const Musica({super.key});

  @override
  State<Musica> createState() => _MusicaState();
}

class _MusicaState extends State<Musica> {
  @override
  Widget build(BuildContext context) {

    
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("¡Música!", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
        backgroundColor: const Color.fromARGB(255, 8, 147, 165),),
      body: ListView(
        children: [Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [ 
            Row(children: [
              infoPetit(context),
              imagenPetit()
            ],),
          botonSanfe(context),
            Row(children: [
              infoCuarteto(context),
              imagenCuarteto()
            ],),
          botonSanfe(context),
            Row(children: [
              infoJuliana(context),
              imagenJuliana()
            ],),
          botonTeatro(context),
            Row(children: [
              infoTetto(context),
              imagenTetto()
            ],),
          botonChampa(context),
        ]),
        ],
      ),
    );
  
}

Widget infoPetit(context){
  return const Padding(
    padding: EdgeInsets.only(top: 30,left: 40,right: 50),
    child: Column(
      children: [
        Row(
          children: [
            Column(children: [
                Text("24", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                Text("JUN", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
              ],),
            SizedBox(width: 40),
            Column(children: [
                Text("Lospetitfellas", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                Text("sáb, 20:00", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
              ],),
          ]
        ),
      ],
    ),
  );
}

Widget imagenPetit(){
  return Padding(
    padding: const EdgeInsets.only(top: 30),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: const Image(image: NetworkImage("https://radionacional-v3.s3.amazonaws.com/s3fs-public/senalradio/articulo-noticia/galeriaimagen/lospetitfellas_2020_5.jpg"),width: 80, height: 60),
    ),
  );
}

Set<Marker>  _marcadorSanfe(){
  var tmp = <Marker>{};

  tmp.add( const Marker(
    markerId:MarkerId("sanFelipe"),
    position: LatLng(1.2056713519352664, -77.29442336245317),
    infoWindow: InfoWindow( //popup info 
      title: 'Colegio San Felipe Neri',
      snippet: 'a 26-48, Dg. 5a Sur #26-2, Pasto, Nariño',
    ),
  ));
  
  return tmp;
}

Widget botonSanfe(context){
  return TextButton(
    onPressed: (){
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) {
            return GoogleMap(initialCameraPosition:  const CameraPosition(
              target: LatLng(1.2056713519352664, -77.29442336245317),
              zoom: 20.0),
                // ignore: no_leading_underscores_for_local_identifiers
              myLocationButtonEnabled: true,
              myLocationEnabled: true,
              markers: _marcadorSanfe()
            );
          },
        ),
      );
    }, 
    child: const Text("Ver Ubicación")
  );
}
Widget infoCuarteto(context){
  return const Padding(
    padding: EdgeInsets.only(top: 30,left: 40,right: 30),
    child: Column(
      children: [
        Row(
          children: [
            Column(children: [
                Text("1", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                Text("MAY", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
              ],),
            SizedBox(width: 30),
            Column(children: [
                Text("Cuarteto de Nos", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                Text("lun, 17:00", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
              ],),
          ]
        ),
      ],
    ),
  );
}

Widget imagenCuarteto(){
  return Padding(
    padding: const EdgeInsets.only(top: 30),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: const Image(image: NetworkImage("https://caracoltv.brightspotcdn.com/dims4/default/1f6ee7b/2147483647/strip/false/crop/1500x1016+0+0/resize/1200x813!/quality/90/?url=http%3A%2F%2Fcaracol-brightspot.s3.amazonaws.com%2F2f%2F19%2Fdf566ae7446288e2ca8f8c5529b7%2Fcuarteto-de-nos.jpg"),width: 80, height: 60),
    ),
  );
}


Widget infoJuliana(context){
  return const Padding(
    padding: EdgeInsets.only(top: 30,left: 40,right: 60),
    child: Column(
      children: [
        Row(
          children: [
            Column(children: [
                Text("14", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                Text("ABR", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
              ],),
            SizedBox(width: 60),
            Column(children: [
                Text("Juliana", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                Text("vie, 20:00", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
              ],),
          ]
        ),
      ],
    ),
  );
}

Widget imagenJuliana(){
  return Padding(
    padding: const EdgeInsets.only(top: 30),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: const Image(image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5WiZ5k2vtHT8nZVVG01ABzf18IbaX53JPoMEdUDcW0wEFc2TO4FMbqxW4Ig&s"),width: 80, height: 60),
    ),
  );
}

Set<Marker>  _marcadorTeatro(){
  var tmp = <Marker>{};

  tmp.add( const Marker(
    markerId:MarkerId("sanFelipe"),
    position: LatLng(1.2146456388708273, -77.28226436441767),
    infoWindow: InfoWindow( //popup info 
      title: 'Teatro Imperial de La Universidad de Nariño',
      snippet: 'Cra. 26 #59, Pasto, Nariño',
    ),
  ));
  
  return tmp;
}

Widget botonTeatro(context){
  return TextButton(
    onPressed: (){
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) {
            return GoogleMap(initialCameraPosition:  const CameraPosition(
              target: LatLng(1.2146456388708273, -77.28226436441767),
              zoom: 20.0),
                // ignore: no_leading_underscores_for_local_identifiers
              myLocationButtonEnabled: true,
              myLocationEnabled: true,
              markers: _marcadorTeatro()
            );
          },
        ),
      );
    }, 
    child: const Text("Ver Ubicación")
  );
}
Widget infoTetto(context){
  return const Padding(
    padding: EdgeInsets.only(top: 40,left: 40,right: 60),
    child: Column(
      children: [
        Row(
          children: [
            Column(children: [
                Text("15", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                Text("ABR", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
              ],),
            SizedBox(width: 60),
            Column(children: [
                Text("Don Tetto", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                Text("sáb, 20:00", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
              ],),
          ]
        ),
      ],
    ),
  );
}

Widget imagenTetto(){
  return Padding(
    padding: const EdgeInsets.only(top: 40),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: const Image(image: NetworkImage("https://caracol.com.co/resizer/qrp6DLQhjhrXfEZZBJw7s3PuZ-8=/650x488/filters:format(jpg):quality(70)/cloudfront-us-east-1.images.arcpublishing.com/prisaradioco/EA54FPZ335NS7LGPEMB3NV63XE.jpg"),width: 80, height: 60),
    ),
  );
}

Set<Marker>  _marcadorChampa(){
  var tmp = <Marker>{};

  tmp.add( const Marker(
    markerId:MarkerId("Instituto Champagnat Pasto"),
    position: LatLng(1.2035185691110317, -77.27623343558234),
    infoWindow: InfoWindow( //popup info 
      title: 'Instituto Champagnat Pasto',
      snippet: 'Cra. 14 # 15-28, Pasto, Nariño',
    ),
  ));
  
  return tmp;
}

Widget botonChampa(context){
  return TextButton(
    onPressed: (){
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) {
            return GoogleMap(initialCameraPosition:  const CameraPosition(
              target: LatLng(1.2035185691110317, -77.27623343558234),
              zoom: 20.0),
                // ignore: no_leading_underscores_for_local_identifiers
              myLocationButtonEnabled: true,
              myLocationEnabled: true,
              markers: _marcadorChampa()
            );
          },
        ),
      );
    }, 
    child: const Text("Ver Ubicación")
  );
}
}