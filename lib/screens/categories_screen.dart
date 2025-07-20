import 'package:flutter/material.dart';
import 'package:flutter_meals_app/models/category.dart';
import 'package:flutter_meals_app/screens/filters_screen.dart';
import 'package:flutter_meals_app/widgets/category_card.dart';
import 'package:flutter_meals_app/data/categories_data.dart';
import 'package:flutter_meals_app/screens/meals_screen.dart';
import 'package:flutter_meals_app/models/meals.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({
    super.key,
    required this.onMealSelected,
    required this.filters,
  });
  final void Function(Meal meal) onMealSelected;
  final Map<Filter, bool> filters;

  void _onCategorySelected(BuildContext context, Category category) {
    final filteredList = dummyMeals.where((meal) {
      if (meal.categories.contains(category.id)) {
        if (filters[Filter.glutenFree]! && !meal.isGlutenFree) {
          return false;
        } else if (filters[Filter.lactoseFree]! && !meal.isLactoseFree) {
          return false;
        } else if (filters[Filter.vegetarian]! && !meal.isVegetarian) {
          return false;
        } else if (filters[Filter.vegan]! && !meal.isVegan) {
          return false;
        }
        return true;
      }
      return false;
    }).toList();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return MealsScreen(
            title: category.title,
            meals: filteredList,
            onMealSelected: onMealSelected,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
              _onCategorySelected(context, category);
            },
          ),
      ],
    );
  }
}
