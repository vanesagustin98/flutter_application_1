import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Mapa extends StatefulWidget {
  const Mapa({super.key});

  @override
  State<Mapa> createState() => _MapaState();
}

class _MapaState extends State<Mapa> {
  CameraPosition _posicion = posicion_inicial;
  bool _estaMapaCreado = false;
  MapType _tipoMapa = MapType.normal;
  bool _traficoActivado = false;
  late GoogleMapController _controller;
  bool _modoNocturno = false;
  // ignore: constant_identifier_names
  static const CameraPosition posicion_inicial = CameraPosition(
    target: LatLng(1.214403, -77.278435),
    zoom: 9.0);
  @override
  
  Widget build(BuildContext context) {
    const LatLng parqueNarino = LatLng(1.214403, -77.278435);
    const LatLng museoOro = LatLng(1.211513, -77.276580);
    const LatLng museoCarnaval = LatLng(1.230465, -77.286509);
    const LatLng iglesiaSanFelipe = LatLng(1.214007, -77.284878);
    const LatLng plazaCarnaval = LatLng(1.210587, -77.276457);
    const LatLng iglesiaCatedral = LatLng(1.215586, -77.279721);
    const LatLng tetroImperial = LatLng(1.214467, -77.282228);
    const LatLng museoTaminango = LatLng(1.2152290726490371, -77.2842767558374);
    const LatLng teatroAleph = LatLng(1.2190562813147645, -77.28443949279264);
    const LatLng estadio = LatLng(1.198163860786403, -77.27785954464824);
    const LatLng laCocha = LatLng(1.0972409741899913, -77.14194657296908);
    const LatLng lasLajas = LatLng(0.8054742330883032, -77.58586412794543);
    const LatLng chimayoy = LatLng(1.2615260401492119, -77.28481374457448);
    // ignore: no_leading_underscores_for_local_identifiers
    Set<Marker>  _marcadores(){
      var tmp = <Marker>{};

      tmp.add( const Marker(
        markerId:MarkerId("Parque Nariño"),
        position: parqueNarino,
        infoWindow: InfoWindow( //popup info 
          title: 'Parque Nariño',
          snippet: 'Cl 19 #25-02, Pasto, Nariño',
        ),
      ));
      tmp.add( const Marker(
        markerId:MarkerId("museoOro"),
        position: museoOro,
        infoWindow: InfoWindow( //popup info 
          title: 'Museo del Oro',
          snippet: 'Cl 19 # 21-27, Pasto, Nariño',
        ),
      ));
      tmp.add( const Marker(
        markerId: MarkerId("museoCarnaval"),
        position: museoCarnaval,
        infoWindow: InfoWindow( //popup info 
          title: 'Museo Del Carnaval De Negros Y Blancos De Pasto',
          snippet: 'Cl 19 #42-60, Pasto, Nariño',
        ),
      ));
      tmp.add( const Marker(
        markerId:MarkerId("iglesiaSanFelipe"),
        position: iglesiaSanFelipe,
        infoWindow: InfoWindow( //popup info 
          title: 'Iglesia San Felipe',
          snippet: 'Cra. 27 #12-41, Pasto, Nariño',
        ),
      ));
      tmp.add(const Marker(
        markerId: MarkerId("plazaCarnaval"),
        position: plazaCarnaval,
        infoWindow: InfoWindow( //popup info 
          title: 'Plaza del Carnaval',
          snippet: 'entre Cra.20 y Cl 18, Pasto, Nariño',
        ),
      ));
      tmp.add(const Marker(
        markerId: MarkerId("iglesiaCatedral"),
        position: iglesiaCatedral,
        infoWindow: InfoWindow( //popup info 
          title: 'Iglesia Catedral',
          snippet: 'Cra. 26 #17-23, Pasto, Nariño',
        ),
      ));
      tmp.add(const Marker(
        markerId: MarkerId("tetroImperial"),
        position: tetroImperial,
        infoWindow: InfoWindow( //popup info 
          title: 'Teatro Imperial de La Universidad de Nariño',
          snippet: 'Cra. 26 #59, Pasto, Nariño',
        ),
      ));
      tmp.add(const Marker(
        markerId: MarkerId("museoTaminango"),
        position: museoTaminango,
        infoWindow: InfoWindow( //popup info 
          title: 'Museo Taminango',
          snippet: 'Cra. 29 #13, Pasto, Nariño',
        ),
      ));
      tmp.add(const Marker(
        markerId: MarkerId("teatroAleph"),
        position: teatroAleph,
        infoWindow: InfoWindow( //popup info 
          title: 'Fundación Aleph Teatro',
          snippet: 'Cl. 16 #32-28, Pasto, Nariño',
        ),
      ));
      tmp.add(const Marker(
        markerId: MarkerId("estadio"),
        position: estadio,
        infoWindow: InfoWindow( //popup info 
          title: 'Estadio Departamental Libertad',
          snippet: 'Cl. 12b, Pasto, Nariño',
        ),
      ));
      tmp.add(const Marker(
        markerId: MarkerId("laCocha"),
        position: laCocha,
        infoWindow: InfoWindow( //popup info 
          title: 'Laguna De La Cocha',
          snippet: 'El Encano, Nariño',
        ),
      ));
      tmp.add(const Marker(
        markerId: MarkerId("lasLajas"),
        position: lasLajas,
        infoWindow: InfoWindow( //popup info 
          title: 'Las Lajas',
          snippet: 'Potosí, Nariño',
        ),
      ));
      tmp.add(const Marker(
        markerId: MarkerId("chimayoy"),
        position: chimayoy,
        infoWindow: InfoWindow( //popup info 
          title: 'Centro Ambiental Chimayoy',
          snippet: 'Salida Norte, Pasto, Nariño',
        ),
      ));
      return tmp;
    }
    final GoogleMap googleMap = GoogleMap(
      onMapCreated: onMapCreated,
      initialCameraPosition: posicion_inicial,
      mapType: _tipoMapa,
      rotateGesturesEnabled: true,
      scrollGesturesEnabled: true,
      tiltGesturesEnabled: true,
      zoomGesturesEnabled: true,
      zoomControlsEnabled: true,
      indoorViewEnabled:true,
      myLocationEnabled: true,
      myLocationButtonEnabled: true,
      trafficEnabled: _traficoActivado,
      onCameraMove: _actualizarPosicionCamara,
      markers: _marcadores(),
    );

  

    final List<Widget> columChildren = <Widget>[
      const SizedBox(height: 40),

      Padding(padding: const EdgeInsets.only(top: 10),
      child: Center(
        child: SizedBox(
          width: 400.0,
          height: 400.0,
          child: googleMap,
        ),
      ),
      )
    ];
    if (_estaMapaCreado) {
      columChildren.add(
        Expanded(child: 
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage("https://static.vecteezy.com/system/resources/previews/008/493/080/non_2x/abstract-orange-circles-overlay-with-transparent-background-png.png"),alignment: Alignment.bottomCenter,fit: BoxFit.cover),
            ),
            child: ListView(
              children: <Widget>[
                // Text(),
                _botonTipoMapa(),
                _botonMiTrafico(),
                _botonModoNocturno()
              ],
            ),
          )
        )
      );
    }
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("¡Explora Nariño!", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
        backgroundColor: const Color.fromARGB(255, 255, 127, 7),),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: columChildren,
        ),
      );
  }

  Widget _botonTipoMapa() {
    final MapType siguienteTipo =
        MapType.values[(_tipoMapa.index + 1) % MapType.values.length];
    return TextButton(
      style: TextButton.styleFrom(foregroundColor: Colors.black),
      onPressed: (){
        setState(() {
          _tipoMapa = siguienteTipo;
        });
      },
      child: const Text ('Cambiar tipo de mapa'),
    );
  }


  Widget _botonMiTrafico() {
    return TextButton(
      style: TextButton.styleFrom(foregroundColor: Colors.black),
      child: Text('${_traficoActivado ? 'Desactivar' : 'Activar'} tráfico'),
      onPressed: () {
        setState(() {
          _traficoActivado = !_traficoActivado;
        });
      },
    );
  }

  Future<String> _leerFichero(String ruta) async {
    return await rootBundle.loadString(ruta);
  }
  
  void _cargarMapaEstilos(String mapaEstilos) {
    setState(() {
      _modoNocturno = true;
      _controller.setMapStyle(mapaEstilos);
    });
  }
  
  Widget _botonModoNocturno() {
    assert(_estaMapaCreado);
    return TextButton(
      style: TextButton.styleFrom(foregroundColor: Colors.black),
      child: Text('${_modoNocturno ? 'Desactivar' : 'Activar'} modo nocturno'),
      onPressed: () {
        if (_modoNocturno) {
          _modoNocturno = false;
          _controller.setMapStyle(null);
        }
        else {
          _leerFichero("assets/night_mode.json").then(_cargarMapaEstilos);
        }
      },
    );
  }

  void _actualizarPosicionCamara(CameraPosition posicion){
    setState(() {
      _posicion = posicion;
    });
  }
  void onMapCreated(GoogleMapController controller){
    setState(() {
      _controller = controller;
      _estaMapaCreado = true;
    });
  }
}