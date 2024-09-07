// injection_container.dart
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:restaurant/core/restaurant/restaurant_injection.dart';
import 'shared/platform/network_info.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Initialize sub-modules
  await initRestaurant(); // Ensure this is awaited

  // Register core dependencies
  sl
    ..registerLazySingleton(http.Client.new)
    ..registerLazySingleton<NetworkInfo>(NetworkInfoImpl.new);

  await sl.allReady();
}