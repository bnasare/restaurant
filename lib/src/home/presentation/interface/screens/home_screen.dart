import 'package:flutter/material.dart'; // Import for Flutter material design components
import 'package:flutter_riverpod/flutter_riverpod.dart'; // Import for Riverpod state management
import 'package:restaurant/shared/constants/app_sizes.dart'; // Import for app size constants
import 'package:restaurant/shared/constants/app_text.dart'; // Import for app text constants
import 'package:restaurant/src/home/presentation/interface/widgets/search_bar.dart'; // Import for SearchBox widget

import '../../../../../core/restaurant/presentation/riverpod/restaurant_mixin.dart'; // Import for RestaurantMixin
import '../../../../../core/restaurant/presentation/riverpod/restaurant_provider.dart'; // Import for Riverpod providers
import '../../../../../shared/presentation/theme/extra_colors.dart'; // Import for extra colors
import '../widgets/error_view.dart'; // Import for ErrorView widget
import '../widgets/restaurant_list.dart'; // Import for RestaurantList widget

// HomeScreen widget, which is a ConsumerWidget with RestaurantMixin functionality
class HomeScreen extends ConsumerWidget with RestaurantMixin {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the state of restaurantsProvider
    final restaurantsAsyncValue = ref.watch(restaurantsProvider);

    // Watch the state of filteredRestaurantsProvider
    final filteredRestaurants = ref.watch(filteredRestaurantsProvider);

    // Method to handle search query changes
    void onSearchChanged(String query) {
      if (query.isEmpty) {
        // If query is empty, show all restaurants
        ref.read(filteredRestaurantsProvider.notifier).state =
            restaurantsAsyncValue.when(
          data: (restaurants) => restaurants,
          loading: () => [],
          error: (_, __) => [],
        );
      } else {
        // Otherwise, filter restaurants based on the search query
        ref.read(filteredRestaurantsProvider.notifier).state =
            searchRestaurants(query, restaurantsAsyncValue.value ?? [], ref);
      }
    }

    return GestureDetector(
      onTap: () => FocusScope.of(context)
          .unfocus(), // Dismiss keyboard on tap outside input fields
      child: Scaffold(
        appBar: AppBar(
          title: const AppText.large('Restaurants'), // Title of the app bar
          actions: [
            IconButton(
              icon: const Icon(Icons.refresh), // Refresh icon button
              onPressed: () => ref
                  .refresh(restaurantsProvider), // Refresh restaurants on press
            ),
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1.0), // Bottom divider height
            child: Divider(
              height: 1.0,
              thickness: 1.0,
              color: ExtraColors.grey.withOpacity(0.2), // Divider color
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(
              AppSizes.contentPadding), // Padding for the body
          child: Column(
            children: [
              // Search box widget with callback for search changes
              SearchBox(onSearchChanged: onSearchChanged),
              const SizedBox(height: 16), // Spacer between search box and list
              Expanded(
                // Expanded widget to make the restaurant list fill available space
                child: restaurantsAsyncValue.when(
                  data: (_) => RestaurantList(
                      restaurants:
                          filteredRestaurants), // Show restaurant list when data is available
                  loading: () => const Center(
                      child:
                          CircularProgressIndicator()), // Show loading indicator while data is loading
                  error: (error, _) => ErrorView(
                    error: error
                        .toString(), // Show error message if an error occurs
                    onRetry: () => ref.refresh(
                        restaurantsProvider), // Retry fetching restaurants on press
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
