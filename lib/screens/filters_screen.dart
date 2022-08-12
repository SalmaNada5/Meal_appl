import 'package:flutter/material.dart';
import 'package:meal_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen(
      {Key? key, required this.saveFilters, required this.filters})
      : super(key: key);
  static const routeName = 'filtersScreen';

  final Function saveFilters;
  final Map<String, bool> filters;
  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _lactosFree = false;
  bool _vegan = false;
  bool _vegetarian = false;
  @override
  void initState() {
    _glutenFree = widget.filters['gluten']!;
    _lactosFree = widget.filters['lactose']!;
    _vegan = widget.filters['vegan']!;
    _vegetarian = widget.filters['vegetarian']!;
    super.initState();
  }

  Widget buildSwitchListTile(
      {String? title,
      String? description,
      bool? val,
      Function(bool)? onChanged}) {
    return SwitchListTile(
      value: val!,
      onChanged: onChanged,
      title: Text(title!),
      subtitle: Text(description!),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const MainDrawer(),
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.orangeAccent,
        title: const Text(
          'Your Filters',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'Raleway',
            letterSpacing: 2,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              final Map<String, bool> selectedFilters = {
                'gluten': _glutenFree,
                'lactose': _lactosFree,
                'vegetarian': _vegetarian,
                'vegan': _vegan,
              };
              widget.saveFilters(selectedFilters);
            },
            icon: const Icon(Icons.save_outlined),
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            child: const Text(
              'Adjust your meal selection',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'Raleway',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                buildSwitchListTile(
                  title: 'Gluten-free',
                  description: 'Only include gluten-free meals.',
                  val: _glutenFree,
                  onChanged: (newValue) {
                    setState(() {
                      _glutenFree = newValue;
                    });
                  },
                ),
                buildSwitchListTile(
                  title: 'Lactose-free',
                  description: 'Only include lactose-free meals.',
                  val: _lactosFree,
                  onChanged: (newValue) {
                    setState(() {
                      _lactosFree = newValue;
                    });
                  },
                ),
                buildSwitchListTile(
                  title: 'vegetarian',
                  description: 'Only include vegetarian meals.',
                  val: _vegetarian,
                  onChanged: (newValue) {
                    setState(() {
                      _vegetarian = newValue;
                    });
                  },
                ),
                buildSwitchListTile(
                  title: 'Vegan',
                  description: 'Only include vegan meals.',
                  val: _vegan,
                  onChanged: (newValue) {
                    setState(() {
                      _vegan = newValue;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
