import 'package:dartz/dartz.dart';

import '../../../../shared/error/failure.dart';
import '../entities/restaurant.dart';

abstract class RestaurantRepository {
  Future<Either<Failure, List<Restaurant>>> getRestaurants();
}
