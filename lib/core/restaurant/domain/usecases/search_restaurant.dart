import '../entities/restaurant.dart';
import '../repositories/restaurant_repository.dart';

class SearchRestaurantUseCase {
  final RestaurantRepository repository;

  SearchRestaurantUseCase(this.repository);

  List<Restaurant> call(String query, List<Restaurant> restaurants) {
    return restaurants
        .where((restaurant) =>
            restaurant.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
}
