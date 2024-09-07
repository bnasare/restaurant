import 'package:flutter_riverpod/flutter_riverpod.dart'; // Import for Riverpod state management
import 'package:restaurant/injection_container.dart'; // Import for dependency injection container

import '../../domain/entities/restaurant.dart'; // Import for the Restaurant entity
import 'restaurant_bloc.dart'; // Import for RestaurantBloc

// Provider for RestaurantBloc instance
final restaurantProvider =
    Provider<RestaurantBloc>((ref) => sl<RestaurantBloc>());

// FutureProvider to fetch the list of restaurants using RestaurantBloc
final restaurantsProvider = FutureProvider<List<Restaurant>>((ref) async {
  // Retrieve RestaurantBloc instance from the provider
  final bloc = ref.watch(restaurantProvider);

  // Use RestaurantBloc to fetch restaurants
  final result = await bloc.getRestaurants();

  // Handle the result of fetching restaurants
  return result.fold(
    (failure) => throw failure, // Throw failure if there is an error
    (restaurants) =>
        restaurants, // Return the list of restaurants if successful
  );
});

// StateProvider to manage the filtered list of restaurants
final filteredRestaurantsProvider = StateProvider<List<Restaurant>>((ref) {
  // Watch the restaurantsProvider to get the current state of restaurants
  final restaurantsAsyncValue = ref.watch(restaurantsProvider);

  // Provide the filtered list based on the current state
  return restaurantsAsyncValue.when(
    data: (restaurants) =>
        restaurants, // Return restaurants when data is available
    loading: () => [], // Return an empty list while loading
    error: (_, __) => [], // Return an empty list in case of an error
  );
});
