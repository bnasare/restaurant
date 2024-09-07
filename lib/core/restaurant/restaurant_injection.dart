import 'package:get_it/get_it.dart';
import 'package:restaurant/core/restaurant/data/database/restaurant_local_database.dart';
import 'package:restaurant/core/restaurant/domain/repositories/restaurant_repository.dart';
import 'package:restaurant/core/restaurant/domain/usecases/get_restaurant.dart';
import 'package:restaurant/core/restaurant/domain/usecases/search_restaurant.dart';
import 'package:restaurant/core/restaurant/presentation/riverpod/restaurant_bloc.dart';
import 'data/repository_impl.dart/restaurant_repository_impl.dart';

final sl = GetIt.instance;

Future<void> initRestaurant() async {
  sl.registerFactory(
    () => RestaurantBloc(
      getRestaurantListUseCase: sl(),
      searchRestaurantUseCase: sl(),
    ),
  );

  // Local Database
  sl.registerLazySingleton<RestaurantLocalDatabase>(
    () => RestaurantLocalDatabaseImpl(),
  );

  // Repository
  sl.registerLazySingleton<RestaurantRepository>(
    () => RestaurantRepositoryImpl(localDatabase: sl()),
  );

  // Use Cases
  sl.registerLazySingleton(() => GetRestaurantListUseCase(sl()));
  sl.registerLazySingleton(() => SearchRestaurantUseCase(sl()));
}