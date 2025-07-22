import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_meals_app/provider/filters_provider.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filters = ref.watch(filtersProvider);
    return Scaffold(
      appBar: AppBar(title: Text('Your Filters')),
      body: Column(
        children: [
          SwitchListTile(
            value: filters[Filter.glutenFree]!,
            onChanged: (newValue) {
              ref
                  .read(filtersProvider.notifier)
                  .updateFilter(Filter.glutenFree, newValue);
            },
            title: Text('Gluten-Free'),
            subtitle: Text('Only include gluten-free meals.'),
          ),
          SwitchListTile(
            value: filters[Filter.lactoseFree]!,
            onChanged: (newValue) {
              ref
                  .read(filtersProvider.notifier)
                  .updateFilter(Filter.lactoseFree, newValue);
            },
            title: Text('Lactose-Free'),
            subtitle: Text('Only include lactose-free meals.'),
          ),
          SwitchListTile(
            value: filters[Filter.vegetarian]!,
            onChanged: (newValue) {
              ref
                  .read(filtersProvider.notifier)
                  .updateFilter(Filter.vegetarian, newValue);
            },
            title: Text('Vegetarian'),
            subtitle: Text('Only include vegetarian meals.'),
          ),
          SwitchListTile(
            value: filters[Filter.vegan]!,
            onChanged: (newValue) {
              ref
                  .read(filtersProvider.notifier)
                  .updateFilter(Filter.vegan, newValue);
            },
            title: Text('Vegan'),
            subtitle: Text('Only include vegan meals.'),
          ),
        ],
      ),
    );
  }
}
