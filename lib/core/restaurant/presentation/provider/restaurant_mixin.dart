import 'package:restaurant/injection_container.dart';
import 'package:restaurant/shared/presentation/widgets/snackbar.dart';

import '../../domain/entities/restaurant.dart';
import 'restaturant_provider.dart';

mixin RestaurantMixin {
  final provider = sl<RestaturantProvider>();

  Future<List<Restaurant>?> searchRestaurants(context, String query) async {
    final result = await provider.getRestaurants();
    return result.fold(
      (failure) {
        SnackBarHelper.showErrorSnackBar(context, failure.message);
        return null;
      },
      (restaurants) {
        return provider.searchRestaurants(query, restaurants);
      },
    );
  }

  Future<List<Restaurant>?> getRestaurants(context) async {
    final result = await provider.getRestaurants();
    return result.fold(
      (failure) {
        SnackBarHelper.showErrorSnackBar(context, failure.message);
        return null;
      },
      (restaurants) {
        return restaurants;
      },
    );
  }
}
