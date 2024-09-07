import 'package:dartz/dartz.dart'; // Import for functional programming utilities (e.g., Either)
import 'package:restaurant/core/restaurant/domain/usecases/get_restaurant.dart'; // Import for GetRestaurantListUseCase
import 'package:restaurant/core/restaurant/domain/usecases/search_restaurant.dart'; // Import for SearchRestaurantUseCase

import '../../../../shared/error/failure.dart'; // Import for handling errors
import '../../domain/entities/restaurant.dart'; // Import for the Restaurant entity

// Business Logic Component (BLoC) for managing restaurant-related operations
class RestaurantBloc {
  final GetRestaurantListUseCase getRestaurantListUseCase;
  final SearchRestaurantUseCase searchRestaurantUseCase;

  // Constructor to inject use cases into the BLoC
  RestaurantBloc({
    required this.getRestaurantListUseCase, // Required use case for getting restaurant list
    required this.searchRestaurantUseCase, // Required use case for searching restaurants
  });

  // Method to fetch the list of restaurants
  Future<Either<Failure, List<Restaurant>>> getRestaurants() async {
    return getRestaurantListUseCase
        .call(); // Call the use case to get restaurants
  }

  // Method to search for restaurants based on a query
  List<Restaurant> searchRestaurants(
      String query, List<Restaurant> restaurants) {
    return searchRestaurantUseCase.call(
        query, restaurants); // Call the use case to search restaurants
  }
}
