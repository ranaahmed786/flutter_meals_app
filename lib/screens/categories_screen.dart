import 'package:flutter/material.dart';
import 'package:flutter_meals_app/models/category.dart';
import 'package:flutter_meals_app/widgets/category_card.dart';
import 'package:flutter_meals_app/data/categories_data.dart';
import 'package:flutter_meals_app/screens/meals_screen.dart';
import 'package:flutter_meals_app/provider/filters_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoriesScreen extends ConsumerStatefulWidget {
  const CategoriesScreen({super.key});
  @override
  ConsumerState<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends ConsumerState<CategoriesScreen>
    with TickerProviderStateMixin {
  late final AnimationController _animationController;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
      lowerBound: 0.0,
      upperBound: 1.0,
    );
    _animationController.forward();
  }

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
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      child: GridView(
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
      ),
      builder: (context, child) {
        return SlideTransition(
          position:
              Tween<Offset>(
                begin: const Offset(0, 0.3),
                end: const Offset(0, 0),
              ).animate(
                CurvedAnimation(
                  parent: _animationController,
                  curve: Curves.easeInOut,
                ),
              ),
          child: child,
        );
      },
    );
  }
}
