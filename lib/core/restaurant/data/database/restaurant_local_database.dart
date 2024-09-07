import 'dart:convert'; // Import for JSON encoding/decoding

import 'package:flutter/services.dart'; // Import for loading assets in Flutter

import '../../domain/entities/restaurant.dart'; // Import for the Restaurant entity

// Abstract class defining the contract for local database operations
abstract class RestaurantLocalDatabase {
  // Method to fetch a list of restaurants
  Future<List<Restaurant>> getRestaurants();
}

// Concrete implementation of the local database
class RestaurantLocalDatabaseImpl implements RestaurantLocalDatabase {
  @override
  Future<List<Restaurant>> getRestaurants() async {
    // Load the JSON file from the assets
    final jsonString = await rootBundle.loadString('assets/restaurants.json');

    // Decode the JSON string into a list of dynamic objects
    final List<dynamic> jsonResponse = json.decode(jsonString);

    // Convert the list of dynamic objects into a list of Restaurant entities
    return jsonResponse.map((data) => Restaurant.fromJson(data)).toList();
  }
}
