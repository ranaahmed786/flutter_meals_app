import 'package:flutter/material.dart';
import 'package:flutter_meals_app/widgets/mainDrawer/drawer_item.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.onSelectRoute});
  final void Function(String routeName) onSelectRoute;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.secondary,
                  Theme.of(context).colorScheme.secondary.withAlpha(47),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.restaurant,
                  size: 37,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
                SizedBox(width: 10),
                Text(
                  'Cooking Up!',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          DrawerItem(
            title: 'Meals',
            icon: Icons.restaurant,
            onTap: () {
              onSelectRoute('meals');
            },
          ),
          DrawerItem(
            title: 'Filters',
            icon: Icons.settings,
            onTap: () {
              onSelectRoute('filters');
            },
          ),
        ],
      ),
    );
  }
}
