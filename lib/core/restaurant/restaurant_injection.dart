import 'package:get_it/get_it.dart'; // Import for dependency injection using GetIt
import 'package:restaurant/core/restaurant/data/database/restaurant_local_database.dart'; // Import for the local database
import 'package:restaurant/core/restaurant/domain/repositories/restaurant_repository.dart'; // Import for the restaurant repository interface
import 'package:restaurant/core/restaurant/domain/usecases/get_restaurant.dart'; // Import for the use case to get restaurant list
import 'package:restaurant/core/restaurant/domain/usecases/search_restaurant.dart'; // Import for the use case to search restaurants
import 'package:restaurant/core/restaurant/presentation/riverpod/restaurant_bloc.dart'; // Import for the RestaurantBloc

import 'data/repository_impl.dart/restaurant_repository_impl.dart'; // Import for the repository implementation

// Create a single instance of GetIt for dependency injection
final sl = GetIt.instance;

// Function to initialize dependencies for the restaurant module
Future<void> initRestaurant() async {
  // Register RestaurantBloc with its use cases
  sl.registerFactory(
    () => RestaurantBloc(
      getRestaurantListUseCase: sl(), // Inject GetRestaurantListUseCase
      searchRestaurantUseCase: sl(), // Inject SearchRestaurantUseCase
    ),
  );

  // Register the local database implementation as a lazy singleton
  sl.registerLazySingleton<RestaurantLocalDatabase>(
    () => RestaurantLocalDatabaseImpl(),
  );

  // Register the repository implementation as a lazy singleton
  sl.registerLazySingleton<RestaurantRepository>(
    () => RestaurantRepositoryImpl(
        localDatabase: sl()), // Inject the local database
  );

  // Register use cases as lazy singletons
  sl.registerLazySingleton(
      () => GetRestaurantListUseCase(sl())); // Inject repository into use case
  sl.registerLazySingleton(
      () => SearchRestaurantUseCase(sl())); // Inject repository into use case
}
