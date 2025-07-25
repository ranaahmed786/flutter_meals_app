import 'package:flutter/material.dart';
import 'package:flutter_meals_app/main.dart';
import 'package:flutter_meals_app/models/meals.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:flutter_meals_app/widgets/mealCard/meal_card_trait.dart';

class MealCard extends StatelessWidget {
  final Meal meal;
  const MealCard({super.key, required this.meal, required this.onMealSelected});
  final void Function(BuildContext context, Meal meal) onMealSelected;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      elevation: 3,
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: InkWell(
        onTap: () {
          onMealSelected(context, meal);
        },
        child: Stack(
          children: [
            Hero(
              tag: 'meal-image-${meal.id}',
              child: FadeInImage(
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(meal.imageUrl),
                fit: BoxFit.cover,
                height: 200,
                width: double.infinity,
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(8),
                color: Colors.black54,
                child: Column(
                  children: [
                    Text(
                      meal.title,
                      softWrap: true,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: theme.textTheme.labelLarge!.copyWith(
                        color: theme.colorScheme.inverseSurface,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        MealCardTrait(
                          icon: Icons.schedule,
                          label: '${meal.duration} min',
                        ),
                        const SizedBox(width: 10),
                        MealCardTrait(
                          icon: Icons.work,
                          label: meal.complexity.name,
                        ),
                        const SizedBox(width: 10),
                        MealCardTrait(
                          icon: Icons.attach_money,
                          label: meal.affordability.name,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
