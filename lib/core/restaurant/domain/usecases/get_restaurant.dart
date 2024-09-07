import 'package:dartz/dartz.dart';

import '../../../../shared/error/failure.dart';
import '../entities/restaurant.dart';
import '../repositories/restaurant_repository.dart';

class GetRestaurantListUseCase {
  final RestaurantRepository repository;

  GetRestaurantListUseCase(this.repository);

  Future<Either<Failure, List<Restaurant>>> call() async {
    return repository.getRestaurants();
  }
}
