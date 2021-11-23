import '../widgets/main_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = "/filters";

  final saveFilters;
  final Map<String, bool> currentFilters;

  FiltersScreen(this.currentFilters, this.saveFilters, {Key? key})
      : super(key: key);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  void initState() {
    _glutenFree = widget.currentFilters["gluten"] ?? false;
    _vegetarian = widget.currentFilters["vegetarian"] ?? false;
    _vegan = widget.currentFilters["vegan"] ?? false;
    _lactoseFree = widget.currentFilters["lactose"] ?? false;
    super.initState();
  }

  Widget _buildSwitchListTitle(String title, bool currentValue, updateValue) {
    return SwitchListTile(
      activeColor: Colors.amber,
      title: Text(title),
      value: currentValue,
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your filters"),
        actions: [
          IconButton(
              onPressed: () {
                final selectedFilters = {
                  "gluten": _glutenFree,
                  "vegan": _vegan,
                  "lactose": _lactoseFree,
                  "vegetarian": _vegetarian,
                };
                ;
                widget.saveFilters(selectedFilters);
              },
              icon: Icon(Icons.save))
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              "Adjust ypur meal selection",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              _buildSwitchListTitle(
                "Gluten-free",
                _glutenFree,
                (newValue) {
                  setState(() {
                    _glutenFree = newValue;
                  });
                },
              ),
              _buildSwitchListTitle(
                "Lactose-free",
                _lactoseFree,
                (newValue) {
                  setState(() {
                    _lactoseFree = newValue;
                  });
                },
              ),
              _buildSwitchListTitle(
                "Vegetarian",
                _vegetarian,
                (newValue) {
                  setState(() {
                    _vegetarian = newValue;
                  });
                },
              ),
              _buildSwitchListTitle(
                "Vegan",
                _vegan,
                (newValue) {
                  setState(() {
                    _vegan = newValue;
                  });
                },
              ),
            ],
          ))
        ],
      ),
    );
  }
}
