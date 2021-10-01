import 'package:demo/core/usecases/usecase.dart';
import 'package:demo/features/route_search/data/repositories/route_search_repository_impl.dart';
import 'package:demo/features/route_search/domain/entities/route_search.dart';
import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class GetRoute implements UseCase<RouteSearch, Params> {

  GetRoute();

  @override
  Future<RouteSearch> call(Params params) async {
    return await RouteSearchRepositoryImpl().getRoute(params.origin, params.destination);
  }
}

class Params extends Equatable {
  final Marker origin;
  final Marker destination;

  const Params({required this.origin, required this.destination});

  @override
  List<Object> get props => [origin, destination];
}