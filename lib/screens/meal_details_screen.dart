import 'package:flutter/material.dart';
import 'package:flutter_meals_app/models/meals.dart';
import 'package:flutter_meals_app/provider/faviourtes_meal_pro.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MealDetailsScreen extends ConsumerWidget {
  const MealDetailsScreen({super.key, required this.meal});
  final Meal meal;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isFavorite = ref.watch(faviourtiesMealProvider).contains(meal);
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
            icon: Icon(isFavorite ? Icons.star : Icons.star_border),
            onPressed: () {
              ref
                  .read(faviourtiesMealProvider.notifier)
                  .toggleMealFavoriteStatus(meal);
              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    isFavorite
                        ? 'Added to Favorites!'
                        : 'Removed from Favorites!',
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              meal.imageUrl,
              height: 250,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 10),
            Text(
              'Ingredients',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onSurface,
              ),
              textAlign: TextAlign.center,
            ),
            for (final each in meal.ingredients)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                child: Text(
                  each,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              ),
            Text(
              'Steps',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onSurface,
              ),
              textAlign: TextAlign.center,
            ),
            for (final step in meal.steps)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 2),
                child: Text(
                  textAlign: TextAlign.center,
                  '${meal.steps.indexOf(step) + 1}. $step',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
