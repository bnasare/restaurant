import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:restaurant/injection_container.dart' as di;
import 'package:restaurant/shared/presentation/theme/theme.dart';
import 'package:restaurant/src/home/presentation/interface/screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
