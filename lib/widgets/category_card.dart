import 'package:flutter/material.dart';
import 'package:flutter_meals_app/main.dart';
import 'package:flutter_meals_app/models/category.dart';

class CategoryCard extends StatelessWidget {
  final Category category;
  final void Function() onSelectCategory;
  const CategoryCard({
    super.key,
    required this.category,
    required this.onSelectCategory,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: theme.colorScheme.primary.withAlpha(160),
      onTap: onSelectCategory,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              category.color.withAlpha(120),
              category.color.withAlpha(255),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(75),
              spreadRadius: 2,
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
