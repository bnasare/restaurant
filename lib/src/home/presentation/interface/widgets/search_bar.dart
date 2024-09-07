import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:iconly/iconly.dart';
import 'package:restaurant/shared/constants/decorations.dart';
import 'package:restaurant/shared/presentation/theme/extra_colors.dart';

class SearchBox extends HookWidget {
  final Function(String) onSearchChanged;

  const SearchBox({super.key, required this.onSearchChanged});

  @override
  Widget build(BuildContext context) {
    final searchController = useTextEditingController();

    return SearchBar(
      backgroundColor: const WidgetStatePropertyAll(ExtraColors.white),
      elevation: const WidgetStatePropertyAll(0),
      shape: const WidgetStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: AppDecorations.inputRadius,
        ),
      ),
      controller: searchController,
      side: WidgetStatePropertyAll(
          BorderSide(color: ExtraColors.grey.withOpacity(0.2))),
      hintText: 'Search Restaurants',
      leading: const Icon(IconlyLight.search),
      hintStyle: const WidgetStatePropertyAll(
          TextStyle(color: Colors.grey, fontSize: 14)),
      textStyle: const WidgetStatePropertyAll(
          TextStyle(color: ExtraColors.black, fontSize: 14)),
      onChanged: (query) {
        onSearchChanged(query);
      },
      trailing: [
        if (searchController.text.isNotEmpty)
          IconButton(
            icon: const Icon(
              IconlyLight.close_square,
              color: ExtraColors.crimson,
            ),
            onPressed: () {
              searchController.clear();
              onSearchChanged('');
            },
          ),
      ],
    );
  }
}
