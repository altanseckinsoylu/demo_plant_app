import 'package:flutter/material.dart';
import 'package:plant_app/core/constants/helper_constants.dart';

class HomeSearchField extends StatelessWidget {
  const HomeSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: HelperConstants.searchBarBg,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: HelperConstants.searchBarBorder),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search for plants',
          hintStyle: TextStyle(color: Colors.grey.shade500),
          prefixIcon: Icon(Icons.search, color: Colors.grey.shade500),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 14,
          ),
        ),
      ),
    );
  }
}
