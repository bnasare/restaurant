import 'dart:developer';

import 'package:restaurant/injection_container.dart';
import 'package:restaurant/shared/presentation/widgets/snackbar.dart';

import '../../domain/entities/restaurant.dart';
import 'restaurant_bloc.dart';

mixin RestaurantMixin {
  final bloc = sl<RestaurantBloc>();

  Future<List<Restaurant>?> getRestaurants(context) async {
    final result = await bloc.getRestaurants();
    return result.fold(
      (failure) {
        SnackBarHelper.showErrorSnackBar(context, failure.message);
        log(failure.message);
        return null;
      },
      (restaurants) {
        return restaurants;
      },
    );
  }

  List<Restaurant> searchRestaurants(
      String query, List<Restaurant> restaurants) {
    return bloc.searchRestaurants(query, restaurants);
  }
}
