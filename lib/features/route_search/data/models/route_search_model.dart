import 'package:demo/features/route_search/domain/entities/route_search.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class RouteSearchModel extends RouteSearch {

  const RouteSearchModel({
    required bounds,
    required polylinePoints,
    required totalDistance,
    required totalDuration,
  }) : super(bounds : bounds, polylinePoints : polylinePoints , 
                      totalDistance : totalDistance , totalDuration : totalDuration);

  factory RouteSearchModel.fromMap(Map<String, dynamic> map) {
    // Check if route is not available
    if ((map['routes'] as List).isEmpty) {
      return RouteSearchModel(bounds: null,polylinePoints: null,
                                    totalDistance: '',totalDuration: '');
    }

    // Get route information
    final data = Map<String, dynamic>.from(map['routes'][0]);

    // Bounds
    final northeast = data['bounds']['northeast'];
    final southwest = data['bounds']['southwest'];
    final bounds = LatLngBounds(
      northeast: LatLng(northeast['lat'], northeast['lng']),
      southwest: LatLng(southwest['lat'], southwest['lng']),
    );

    // Distance & Duration
    String distance = '';
    String duration = '';
    if ((data['legs'] as List).isNotEmpty) {
      final leg = data['legs'][0];
      distance = leg['distance']['text'];
      duration = leg['duration']['text'];
    }

    return RouteSearchModel(
      bounds: bounds,
      polylinePoints:
          PolylinePoints().decodePolyline(data['overview_polyline']['points']),
      totalDistance: distance,
      totalDuration: duration,
    );
  }
}