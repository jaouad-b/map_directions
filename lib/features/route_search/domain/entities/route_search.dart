
import 'package:equatable/equatable.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class RouteSearch extends Equatable {
  final LatLngBounds bounds;
  final List<PointLatLng> polylinePoints;
  final String totalDistance;
  final String totalDuration;


  const RouteSearch({
    required this.bounds,
    required this.polylinePoints,
    required this.totalDistance,
    required this.totalDuration,
  });

  @override
  List<Object> get props => [bounds, polylinePoints, totalDistance, totalDuration];
}