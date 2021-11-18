import '../dummy_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = "/meal-detail";

  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.subtitle1,
      ),
    );
  }

  Widget buildContainer(Widget childs) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          border: Border.all(
            color: Colors.grey,
          )),
      margin: EdgeInsets.all(10),
      height: 250,
      padding: EdgeInsets.all(10),
      child: childs,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments as String;
    final selectMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text("${selectMeal.title}"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle(context, "Ingredients"),
            buildContainer(ListView.builder(
              itemCount: selectMeal.ingredients.length,
              itemBuilder: (ctx, index) => Card(
                elevation: 4,
                color: Color.fromRGBO(245, 234, 118, 1),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(selectMeal.ingredients[index],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      )),
                ),
              ),
            )),
            buildSectionTitle(context, "Steps"),
            buildContainer(
              ListView.builder(
                itemCount: selectMeal.steps.length,
                itemBuilder: (ctx, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Color.fromRGBO(245, 234, 118, 1),
                        radius: 20,
                        child: Text(
                          "${index + 1}",
                          style: TextStyle(
                              fontFamily: "RobotoCondensed",
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      title: Text(
                        selectMeal.steps[index],
                        style: TextStyle(
                            fontFamily: "Raleway",
                            fontSize: 16,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                    Divider(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.delete,
        ),
        onPressed: () {
          Navigator.of(context).pop(mealId);
        },
      ),
    );
  }
}
