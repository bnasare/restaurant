import 'package:flutter_riverpod/flutter_riverpod.dart'; // Import for Riverpod state management
import 'package:restaurant/core/restaurant/presentation/riverpod/restaurant_provider.dart'; // Import for Riverpod providers

import '../../domain/entities/restaurant.dart'; // Import for the Restaurant entity

// Mixin to add restaurant-related functionality
mixin RestaurantMixin {
  // Method to search for restaurants based on a query
  List<Restaurant> searchRestaurants(
      String query, List<Restaurant> restaurants, WidgetRef ref) {
    // Read the RestaurantBloc instance from the Riverpod provider
    final bloc = ref.read(restaurantProvider);

    // Use RestaurantBloc to perform the search and return the result
    return bloc.searchRestaurants(query, restaurants);
  }
}
