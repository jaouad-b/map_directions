import 'package:demo/features/route_search/data/repositories/route_search_repository_impl.dart';
import 'package:demo/features/route_search/domain/entities/route_search.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class MapPage extends StatefulWidget{
  const MapPage({Key? key}) : super(key: key);
  
  @override
  State<StatefulWidget> createState() => RouteSearchPage();
}
// ignore: must_be_immutable
class RouteSearchPage extends State<MapPage> {


  late GoogleMapController mapController;
  List <Marker> originDestination = [];
  final LatLng _center =  const LatLng(45.521563, -122.677433);
  RouteSearch result = RouteSearch(bounds: LatLngBounds(northeast: const LatLng(0,0),southwest: const LatLng(0,0)), polylinePoints: const [], totalDistance: '', totalDuration: '');
  bool isDraw = false;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    final double heightMax =  MediaQuery.of(context).size.height;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Maps Sample App'),
          backgroundColor: Colors.green[700],
        ),
        body:  Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
              height:heightMax *0.76,
              alignment: Alignment.centerLeft,
              color: Colors.cyan,
              child : GoogleMap(
                          onMapCreated: _onMapCreated,
                          initialCameraPosition: CameraPosition(
                            target: _center,
                            zoom: 11.0,
                            
                          ),
                          markers: Set.from(originDestination),
                          onTap: _handleTap,
                          polylines: {
                            if(true == isDraw)
                            Polyline(
                              polylineId: const PolylineId('overview_polyline'),
                              color: Colors.red,
                              width: 5,
                              points: result.polylinePoints
                                  .map((e) => LatLng(e.latitude, e.longitude))
                                  .toList(),
                                ),
                            },

                      )
          ),
          Container(
              height: heightMax*0.04,
              alignment: Alignment.centerLeft,
              child :Text(
                  ' Distance :  ${result.totalDistance}',
                  style: const TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w600,
                              ),
                    ),      
          ),
          Container(
              height: heightMax*0.04,
              alignment: Alignment.centerLeft,
              child :Text(
                  ' Duration : ${result.totalDuration}',
                  style: const TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w600,
                              ),
                    ),      
          ),
                ],
      ),
      ),
    );
  }
 _handleTap(LatLng latLng) async
  {
    setState(() {
      if(2 == originDestination.length)
      {
        originDestination.clear();
        isDraw = false;

      }

      originDestination.add(Marker(markerId: MarkerId(latLng.toString()),
              position: latLng));
      
    });
    if(2 == originDestination.length)
    {
      isDraw = true;
      drawRoute();
    }

  }

  drawRoute() async{
   final directions = await RouteSearchRepositoryImpl().getRoute(originDestination[0], originDestination[1]);
    setState(() => result = directions);
  }
}
