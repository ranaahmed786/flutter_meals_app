import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_meals_app/data/categories_data.dart';

enum Filter { glutenFree, lactoseFree, vegetarian, vegan }

class FiltersNotifier extends StateNotifier<Map<Filter, bool>> {
  FiltersNotifier()
    : super({
        Filter.glutenFree: false,
        Filter.lactoseFree: false,
        Filter.vegetarian: false,
        Filter.vegan: false,
      });

  void updateFilters(Map<Filter, bool> newFilters) {
    state = newFilters;
  }

  void updateFilter(Filter filter, bool value) {
    state = {...state, filter: value};
  }
}

final filtersProvider =
    StateNotifierProvider<FiltersNotifier, Map<Filter, bool>>(
      (ref) => FiltersNotifier(),
    );

final availableMealsProvider = Provider((ref) {
  final filters = ref.watch(filtersProvider);
  return dummyMeals.where((meal) {
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
  }).toList();
});
