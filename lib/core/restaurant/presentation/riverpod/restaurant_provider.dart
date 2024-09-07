import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restaurant/injection_container.dart';

import '../../domain/entities/restaurant.dart';
import 'restaurant_bloc.dart';

final restaurantProvider =
    Provider<RestaurantBloc>((ref) => sl<RestaurantBloc>());

final restaurantsProvider = FutureProvider<List<Restaurant>>((ref) async {
  final bloc = ref.watch(restaurantProvider);
  final result = await bloc.getRestaurants();
  return result.fold(
    (failure) => throw failure,
    (restaurants) => restaurants,
  );
});

final filteredRestaurantsProvider = StateProvider<List<Restaurant>>((ref) {
  final restaurantsAsyncValue = ref.watch(restaurantsProvider);
  return restaurantsAsyncValue.when(
    data: (restaurants) => restaurants,
    loading: () => [],
    error: (_, __) => [],
  );
});
