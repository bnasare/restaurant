import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restaurant/core/restaurant/presentation/riverpod/restaurant_provider.dart';

import '../../domain/entities/restaurant.dart';

mixin RestaurantMixin {
  List<Restaurant> searchRestaurants(
      String query, List<Restaurant> restaurants, WidgetRef ref) {
    final bloc = ref.read(restaurantProvider);
    return bloc.searchRestaurants(query, restaurants);
  }
}
