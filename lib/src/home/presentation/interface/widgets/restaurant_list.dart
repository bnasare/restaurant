import 'package:flutter/material.dart';
import 'package:restaurant/shared/constants/app_text.dart';
import 'package:restaurant/shared/presentation/theme/extra_colors.dart';

import '../../../../../core/restaurant/domain/entities/restaurant.dart';

class RestaurantList extends StatelessWidget {
  final List<Restaurant>? restaurants;

  const RestaurantList({super.key, required this.restaurants});

  @override
  Widget build(BuildContext context) {
    if (restaurants == null || restaurants!.isEmpty) {
      return const Center(child: AppText.smaller('No restaurants found'));
    }

    return ListView.separated(
      separatorBuilder: (context, index) => const Divider(),
      itemCount: restaurants!.length,
      itemBuilder: (context, index) {
        final restaurant = restaurants![index];
        return ListTile(
          contentPadding: EdgeInsets.zero,
          title: AppText.small(
            '${index + 1}. ${restaurant.name}',
            color: ExtraColors.black.withOpacity(0.7),
          ), // Numbering added here
        );
      },
    );
  }
}
