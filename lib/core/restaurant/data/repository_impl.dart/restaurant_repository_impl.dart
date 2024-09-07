import 'package:dartz/dartz.dart';
import 'package:restaurant/core/restaurant/domain/entities/restaurant.dart';
import 'package:restaurant/core/restaurant/domain/repositories/restaurant_repository.dart';
import 'package:restaurant/shared/error/exception.dart';

import '../../../../shared/error/failure.dart';
import '../database/restaurant_local_database.dart';

/// Repository implementation for handling restaurant data.
class RestaurantRepositoryImpl implements RestaurantRepository {
  final RestaurantLocalDatabase localDatabase;

  RestaurantRepositoryImpl({required this.localDatabase});

  /// Fetches restaurants from the local database.
  /// Returns a [Right] with data on success, or [Left] with failure.
  @override
  Future<Either<Failure, List<Restaurant>>> getRestaurants() async {
    try {
      final response = await localDatabase.getRestaurants();
      return Right(response);
    } on DeviceException catch (error) {
      return Left(Failure(error.message));
    } catch (error) {
      return Left(Failure(error.toString()));
    }
  }
}
