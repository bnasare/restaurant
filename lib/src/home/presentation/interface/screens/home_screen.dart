import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:restaurant/shared/constants/app_sizes.dart';
import 'package:restaurant/shared/constants/app_text.dart';
import 'package:restaurant/src/home/presentation/interface/widgets/search_bar.dart';

import '../../../../../core/restaurant/domain/entities/restaurant.dart';
import '../../../../../core/restaurant/presentation/riverpod/restaurant_mixin.dart';
import '../widgets/error_view.dart';
import '../widgets/restaurant_list.dart';

class HomeScreen extends HookWidget with RestaurantMixin {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final restaurants = useState<List<Restaurant>?>(null);
    final filteredRestaurants = useState<List<Restaurant>?>(null);
    final isLoading = useState(true);
    final error = useState<String?>(null);

    Future<void> loadRestaurants() async {
      try {
        isLoading.value = true;
        error.value = null;
        final fetchedRestaurants = await getRestaurants(context);
        restaurants.value = fetchedRestaurants;
        filteredRestaurants.value = fetchedRestaurants;
      } catch (e) {
        error.value = 'Failed to load restaurants. Please try again.';
      } finally {
        isLoading.value = false;
      }
    }

    useEffect(() {
      loadRestaurants();
      return null;
    }, []);

    void onSearchChanged(String query) {
      if (restaurants.value != null) {
        if (query.isEmpty) {
          filteredRestaurants.value = restaurants.value;
        } else {
          filteredRestaurants.value =
              searchRestaurants(query, restaurants.value!);
        }
      }
    }

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const AppText.large('Restaurants'),
          actions: [
            IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: loadRestaurants,
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(AppSizes.contentPadding),
          child: Column(
            children: [
              SearchBox(onSearchChanged: onSearchChanged),
              const SizedBox(height: 16),
              Expanded(
                child: isLoading.value
                    ? const Center(child: CircularProgressIndicator())
                    : error.value != null
                        ? ErrorView(
                            error: error.value!, onRetry: loadRestaurants)
                        : RestaurantList(
                            restaurants: filteredRestaurants.value),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
