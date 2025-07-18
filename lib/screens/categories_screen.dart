import 'package:flutter/material.dart';
import 'package:flutter_meals_app/models/category.dart';
import 'package:flutter_meals_app/widgets/category_card.dart';
import 'package:flutter_meals_app/data/categories_data.dart';
import 'package:flutter_meals_app/screens/meals_screen.dart';

class CategoriesScreen extends StatelessWidget {
  void _onCategorySelected(BuildContext context, Category category) {
    final filteredList = dummyMeals.where((meal) {
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

  const CategoriesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Categories')),
      body: GridView(
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
                _onCategorySelected(context, category);
              },
            ),
        ],
      ),
    );
  }
}
