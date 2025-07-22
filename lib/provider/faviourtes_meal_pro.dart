import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_meals_app/models/meals.dart';

class FavioutiesMealNotifier extends StateNotifier<List<Meal>> {
  FavioutiesMealNotifier() : super([]);

  void toggleMealFavoriteStatus(Meal meal) {
    final isExisting = state.contains(meal);
    if (isExisting) {
      state = state.where((m) => m.id != meal.id).toList();
    } else {
      state = [...state, meal];
    }
  }

  bool isMealFavorite(Meal meal) {
    return state.contains(meal);
  }
}

final faviourtiesMealProvider =
    StateNotifierProvider<FavioutiesMealNotifier, List<Meal>>((ref) {
      return FavioutiesMealNotifier();
    });
