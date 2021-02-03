import 'package:flutter/material.dart';
import 'package:var_mealapp/model_food.dart';

class FoodGrid extends StatelessWidget {
  const FoodGrid(this.food);
  @required
  final Food food;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: new Stack(
      children: <Widget>[
        ClipRRect(
          borderRadius: new BorderRadius.all(Radius.circular(10)),
          child: new Image.network(
            (food != null)
                ? food.strMealThumb
                : "https://pro-vape.eu/wp-content/uploads/woocommerce-placeholder-600x600.png",
          ),
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              gradient: LinearGradient(
                  begin: Alignment.bottomRight,
                  colors: [Colors.black54, Colors.black12])),
          alignment: Alignment(0, 0.8),
          child: Text(
            (food != null) ? food.strMeal : "Tidak ada data",
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        )
      ],
    ));
  }
}
