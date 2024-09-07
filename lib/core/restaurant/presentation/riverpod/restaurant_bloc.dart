import 'package:dartz/dartz.dart';
import 'package:restaurant/core/restaurant/domain/usecases/get_restaurant.dart';
import 'package:restaurant/core/restaurant/domain/usecases/search_restaurant.dart';

import '../../../../shared/error/failure.dart';
import '../../domain/entities/restaurant.dart';

class RestaurantBloc {
  final GetRestaurantListUseCase getRestaurantListUseCase;
  final SearchRestaurantUseCase searchRestaurantUseCase;

  RestaurantBloc(
      {required this.getRestaurantListUseCase,
      required this.searchRestaurantUseCase});

  Future<Either<Failure, List<Restaurant>>> getRestaurants() async {
    return getRestaurantListUseCase.call();
  }

  List<Restaurant> searchRestaurants(
      String query, List<Restaurant> restaurants) {
    return searchRestaurantUseCase.call(query, restaurants);
  }
}
