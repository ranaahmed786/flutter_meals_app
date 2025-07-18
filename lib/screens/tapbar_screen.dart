import 'package:flutter/material.dart';
import 'package:flutter_meals_app/models/meals.dart';
import 'package:flutter_meals_app/screens/categories_screen.dart';
import 'package:flutter_meals_app/screens/meals_screen.dart';

class TapbarScreen extends StatefulWidget {
  const TapbarScreen({super.key});

  @override
  State<TapbarScreen> createState() => _TapbarScreenState();
}

class _TapbarScreenState extends State<TapbarScreen> {
  List<Meal> favoriteMeals = [];
  int _selectedIndex = 0;
  String _defaultScreenTitle = 'Categories';

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (index == 0) {
        _defaultScreenTitle = 'Categories';
      } else {
        _defaultScreenTitle = 'Your Favorites';
      }
    });
  }

  Widget _getSelectedScreen() {
    if (_selectedIndex == 0) {
      return CategoriesScreen(
        onMealSelected: (meal) {
          toggleFavourites(meal);
        },
      );
    } else {
      return MealsScreen(
        meals: favoriteMeals,
        onMealSelected: (meal) {
          toggleFavourites(meal);
        },
      );
    }
  }

  void toggleFavourites(Meal meal) {
    if (favoriteMeals.contains(meal)) {
      setState(() {
        favoriteMeals.remove(meal);
        _showSnackBar('Removed from favorites!');
      });
    } else {
      setState(() {
        favoriteMeals.add(meal);
        _showSnackBar('Added to favorites!');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_defaultScreenTitle)),
      body: _getSelectedScreen(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: 'Categories',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites'),
        ],
        onTap: _onItemTapped,
      ),
    );
  }
}
