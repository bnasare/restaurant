import 'package:dartz/dartz.dart';

import '../../../../shared/error/failure.dart'; // Import for handling errors
import '../entities/restaurant.dart'; // Import for the Restaurant entity
import '../repositories/restaurant_repository.dart'; // Import for the restaurant repository

// Use case class to handle fetching the list of restaurants
class GetRestaurantListUseCase {
  final RestaurantRepository repository;

  // Constructor for injecting the RestaurantRepository dependency
  GetRestaurantListUseCase(this.repository);

  // Method to fetch the list of restaurants
  Future<Either<Failure, List<Restaurant>>> call() async {
    // Calls the repository method to get restaurants and returns the result
    return repository.getRestaurants();
  }
}
