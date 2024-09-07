import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import 'shared/platform/network_info.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Initialize sub-modules


  // Register core dependencies
  sl
    ..registerLazySingleton(http.Client.new)
    ..registerLazySingleton<NetworkInfo>(NetworkInfoImpl.new);


  await sl.allReady();
}
