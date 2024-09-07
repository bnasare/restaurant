import 'package:flutter/material.dart'; // Import for Flutter material design components
import 'package:flutter/services.dart'; // Import for system services (e.g., setting device orientation)
import 'package:flutter_riverpod/flutter_riverpod.dart'; // Import for Riverpod state management
import 'package:restaurant/injection_container.dart'
    as di; // Import for dependency injection container
import 'package:restaurant/shared/presentation/theme/theme.dart'; // Import for app theme
import 'package:restaurant/src/home/presentation/interface/screens/home_screen.dart'; // Import for home screen

void main() async {
  // Ensure Flutter framework is initialized before running any code
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize dependency injection container
  await di.init();

  // Set preferred device orientation to portrait mode only
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  // Run the app with Riverpod's ProviderScope at the root
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme, // Apply the light theme to the app
      debugShowCheckedModeBanner: false, // Disable the debug banner
      home: HomeScreen(), // Set the home screen of the app
    );
  }
}
