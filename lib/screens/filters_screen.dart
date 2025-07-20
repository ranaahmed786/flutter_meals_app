import 'package:flutter/material.dart';

enum Filter { glutenFree, lactoseFree, vegetarian, vegan }

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key, this.currentFilters});
  final Map<Filter, bool>? currentFilters;

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  Map<Filter, bool> filters = {
    Filter.glutenFree: false,
    Filter.lactoseFree: false,
    Filter.vegetarian: false,
    Filter.vegan: false,
  };

  @override
  void initState() {
    super.initState();
    filters =
        widget.currentFilters ??
        {
          Filter.glutenFree: false,
          Filter.lactoseFree: false,
          Filter.vegetarian: false,
          Filter.vegan: false,
        };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Your Filters')),
      body: PopScope(
        canPop: false,
        onPopInvokedWithResult: (bool didPop, dynamic result) {
          if (didPop) return;
          Navigator.of(context).pop({
            Filter.glutenFree: filters[Filter.glutenFree]!,
            Filter.lactoseFree: filters[Filter.lactoseFree]!,
            Filter.vegetarian: filters[Filter.vegetarian]!,
            Filter.vegan: filters[Filter.vegan]!,
          });
        },
        child: Column(
          children: [
            SwitchListTile(
              value: filters[Filter.glutenFree]!,
              onChanged: (newValue) {
                setState(() {
                  filters[Filter.glutenFree] = newValue;
                });
              },
              title: Text('Gluten-Free'),
              subtitle: Text('Only include gluten-free meals.'),
            ),
            SwitchListTile(
              value: filters[Filter.lactoseFree]!,
              onChanged: (newValue) {
                setState(() {
                  filters[Filter.lactoseFree] = newValue;
                });
              },
              title: Text('Lactose-Free'),
              subtitle: Text('Only include lactose-free meals.'),
            ),
            SwitchListTile(
              value: filters[Filter.vegetarian]!,
              onChanged: (newValue) {
                setState(() {
                  filters[Filter.vegetarian] = newValue;
                });
              },
              title: Text('Vegetarian'),
              subtitle: Text('Only include vegetarian meals.'),
            ),
            SwitchListTile(
              value: filters[Filter.vegan]!,
              onChanged: (newValue) {
                setState(() {
                  filters[Filter.vegan] = newValue;
                });
              },
              title: Text('Vegan'),
              subtitle: Text('Only include vegan meals.'),
            ),
          ],
        ),
      ),
    );
  }
}
