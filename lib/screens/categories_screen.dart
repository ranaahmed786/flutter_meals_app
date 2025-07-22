import 'package:flutter/material.dart';
import 'package:flutter_meals_app/models/category.dart';
import 'package:flutter_meals_app/widgets/category_card.dart';
import 'package:flutter_meals_app/data/categories_data.dart';
import 'package:flutter_meals_app/screens/meals_screen.dart';
import 'package:flutter_meals_app/provider/filters_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoriesScreen extends ConsumerWidget {
  const CategoriesScreen({super.key});

  void _onCategorySelected(
    BuildContext context,
    Category category,
    WidgetRef ref,
  ) {
    final filteredList = ref.watch(availableMealsProvider).where((meal) {
      return meal.categories.contains(category.id);
    }).toList();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return MealsScreen(title: category.title, meals: filteredList);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GridView(
      padding: const EdgeInsets.all(20),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: [
        for (final category in availableCategories)
          CategoryCard(
            category: category,
            onSelectCategory: () {
              _onCategorySelected(context, category, ref);
            },
          ),
      ],
    );
  }
}
