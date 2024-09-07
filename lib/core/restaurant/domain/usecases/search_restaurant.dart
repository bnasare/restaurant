import '../entities/restaurant.dart'; // Import for the Restaurant entity
import '../repositories/restaurant_repository.dart'; // Import for the restaurant repository

// Use case class to handle searching restaurants based on a query
class SearchRestaurantUseCase {
  final RestaurantRepository repository;

  // Constructor for injecting the RestaurantRepository dependency
  SearchRestaurantUseCase(this.repository);

  // Method to search restaurants based on the query
  List<Restaurant> call(String query, List<Restaurant> restaurants) {
    // Filters the list of restaurants where the name contains the query (case-insensitive)
    return restaurants
        .where((restaurant) =>
            restaurant.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
}
