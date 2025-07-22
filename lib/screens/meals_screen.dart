import 'package:flutter/material.dart';
import 'package:flutter_meals_app/main.dart';
import 'package:flutter_meals_app/models/meals.dart';
import 'package:flutter_meals_app/widgets/mealCard/meal_card.dart';
import 'package:flutter_meals_app/screens/meal_details_screen.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, this.title, required this.meals});
  final String? title;
  final List<Meal> meals;

  void _onMealSelected(BuildContext context, Meal meal) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MealDetailsScreen(meal: meal)),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
      itemBuilder: (context, index) =>
          MealCard(meal: meals[index], onMealSelected: _onMealSelected),
      itemCount: meals.length,
    );
    if (meals.isEmpty) {
      content = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'No meals found for this category!',
              style: theme.textTheme.labelLarge!.copyWith(
                color: theme.colorScheme.secondary,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Try selecting a different category.',
              style: theme.textTheme.bodyLarge!.copyWith(
                color: theme.colorScheme.onSurface,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }
    if (title == null) return content;

    return Scaffold(
      appBar: AppBar(title: Text(title!)),
      body: content,
    );
  }
}
