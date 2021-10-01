import 'package:demo/features/route_search/data/dataSources/route_search_data_source.dart';
import 'package:demo/features/route_search/domain/entities/route_search.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// class RouteSearchRepositoryImpl extends RouteSearchRepository{
class RouteSearchRepositoryImpl{

  late final RouteSearchDataSourceImpl dataSource;
  
  RouteSearchRepositoryImpl();

  Future<RouteSearch> getRoute(
     Marker origin,
     Marker destination,
  ){
    return RouteSearchDataSourceImpl().getRouteImpl(origin, destination);
  }
}