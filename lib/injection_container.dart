import 'package:get_it/get_it.dart'; // Import for dependency injection using GetIt
import 'package:http/http.dart' as http; // Import for HTTP client
import 'package:restaurant/core/restaurant/restaurant_injection.dart'; // Import for restaurant module dependencies
import 'shared/platform/network_info.dart'; // Import for network info interface and implementation

// Create a single instance of GetIt for dependency injection
final sl = GetIt.instance;

// Function to initialize the dependency injection container
Future<void> init() async {
  // Initialize sub-modules (e.g., restaurant module)
  await initRestaurant(); // Ensure that the initialization of the restaurant module is completed before proceeding

  // Register core dependencies
  sl
    ..registerLazySingleton(
        http.Client.new) // Register HTTP client as a lazy singleton
    ..registerLazySingleton<NetworkInfo>(NetworkInfoImpl
        .new); // Register NetworkInfo implementation as a lazy singleton

  // Ensure all registered dependencies are ready for use
  await sl.allReady();
}
