import 'package:flutter/material.dart';
import 'package:flutter_meals_app/screens/categories_screen.dart';
import 'package:flutter_meals_app/screens/meals_screen.dart';
import 'package:flutter_meals_app/widgets/mainDrawer/main_drawer.dart';
import 'package:flutter_meals_app/screens/filters_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_meals_app/provider/faviourtes_meal_pro.dart';

class TapbarScreen extends ConsumerStatefulWidget {
  const TapbarScreen({super.key});

  @override
  ConsumerState<TapbarScreen> createState() => _TapbarScreenState();
}

class _TapbarScreenState extends ConsumerState<TapbarScreen> {
  int _selectedIndex = 0;
  String _defaultScreenTitle = 'Categories';

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
      return const CategoriesScreen();
    } else {
      return MealsScreen(meals: ref.watch(faviourtiesMealProvider));
    }
  }

  void _drawerNavigation(String routeName) {
    Navigator.of(context).pop(); // Close the drawer
    if (routeName == 'filters') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const FiltersScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_defaultScreenTitle)),
      body: _getSelectedScreen(),
      drawer: MainDrawer(onSelectRoute: _drawerNavigation),
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
