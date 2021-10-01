import 'package:demo/core/error/exception.dart';
import 'package:demo/features/route_search/data/models/route_search_model.dart';
import 'package:dio/dio.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class RouteSearchDataSourceImpl {
  final Dio _dio = Dio();
  static const String googleAPIKey = 'AIzaSyDsP35iYUcbvMoC881uRN5XtKGG0icq-zY';
  static const String _baseUrl =
      'https://maps.googleapis.com/maps/api/directions/json?';

  RouteSearchDataSourceImpl();


  Future<RouteSearchModel> getRouteImpl(Marker origin, Marker destination) =>
     _getRouteFromUrl(_baseUrl, origin, destination);

  Future<RouteSearchModel> _getRouteFromUrl(String url, Marker origin, Marker destination) async {
    final response = await _dio.get(
      url,
      queryParameters: {
        'origin': '${origin.position.latitude},${origin.position.longitude}',
        'destination': '${destination.position.latitude},${destination.position.longitude}',
        'key': googleAPIKey,
      },
    );

    if (response.statusCode == 200) {
      return RouteSearchModel.fromMap(response.data);
    } else {
      throw RequestException();
    }
  }
}