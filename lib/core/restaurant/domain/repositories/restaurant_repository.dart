import 'package:dartz/dartz.dart';
import '../../../../shared/error/failure.dart';
import '../entities/restaurant.dart';

/// Abstract class defining the contract for restaurant data operations.
abstract class RestaurantRepository {
  /// Fetches a list of restaurants.
  /// Returns an [Either] containing a [Failure] on the left if there's an error,
  /// or a list of [Restaurant] on the right if successful.
  Future<Either<Failure, List<Restaurant>>> getRestaurants();
}
