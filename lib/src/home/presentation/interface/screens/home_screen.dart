import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restaurant/shared/constants/app_sizes.dart';
import 'package:restaurant/shared/constants/app_text.dart';
import 'package:restaurant/src/home/presentation/interface/widgets/search_bar.dart';

import '../../../../../core/restaurant/presentation/riverpod/restaurant_mixin.dart';
import '../../../../../core/restaurant/presentation/riverpod/restaurant_provider.dart';
import '../widgets/error_view.dart';
import '../widgets/restaurant_list.dart';

class HomeScreen extends ConsumerWidget with RestaurantMixin {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final restaurantsAsyncValue = ref.watch(restaurantsProvider);
    final filteredRestaurants = ref.watch(filteredRestaurantsProvider);

    void onSearchChanged(String query) {
      if (query.isEmpty) {
        ref.read(filteredRestaurantsProvider.notifier).state =
            restaurantsAsyncValue.when(
          data: (restaurants) => restaurants,
          loading: () => [],
          error: (_, __) => [],
        );
      } else {
        ref.read(filteredRestaurantsProvider.notifier).state =
            searchRestaurants(query, restaurantsAsyncValue.value ?? [], ref);
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
              onPressed: () => ref.refresh(restaurantsProvider),
            ),
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1.0),
            child: Divider(
              height: 1.0,
              thickness: 1.0,
              color: Colors.grey[300],
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(AppSizes.contentPadding),
          child: Column(
            children: [
              SearchBox(onSearchChanged: onSearchChanged),
              const SizedBox(height: 16),
              Expanded(
                child: restaurantsAsyncValue.when(
                  data: (_) => RestaurantList(restaurants: filteredRestaurants),
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  error: (error, _) => ErrorView(
                    error: error.toString(),
                    onRetry: () => ref.refresh(restaurantsProvider),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
