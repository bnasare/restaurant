import 'dart:convert';

import 'package:flutter/services.dart';

import '../../domain/entities/restaurant.dart';

abstract class RestaurantLocalDatabase {
  Future<List<Restaurant>> getRestaurants();
}

class RestaurantLocalDatabaseImpl implements RestaurantLocalDatabase {
  @override
  Future<List<Restaurant>> getRestaurants() async {
    final jsonString = await rootBundle.loadString('assets/restaurants.json');
    final List<dynamic> jsonResponse = json.decode(jsonString);
    return jsonResponse.map((data) => Restaurant.fromJson(data)).toList();
  }
}
