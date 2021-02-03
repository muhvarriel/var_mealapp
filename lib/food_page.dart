import 'package:flutter/material.dart';
import 'package:var_mealapp/model_food.dart';

class GridDetails extends StatefulWidget {
  final Food curFood;
  GridDetails({@required this.curFood});

  @override
  GridDetailsState createState() => GridDetailsState();
}

class GridDetailsState extends State<GridDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 80,
                ),
                ClipRRect(
                  borderRadius: new BorderRadius.all(Radius.circular(200)),
                  child: new Image.network(
                    (widget.curFood != null)
                        ? widget.curFood.strMealThumb
                        : "https://pro-vape.eu/wp-content/uploads/woocommerce-placeholder-600x600.png",
                    width: 200,
                    height: 200,
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  (widget.curFood != null)
                      ? widget.curFood.strMeal
                      : "Tidak ada data",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  margin: EdgeInsets.all(30),
                  child: Text(
                    (widget.curFood != null)
                        ? widget.curFood.strInstructions
                        : "Tidak ada data",
                    textAlign: TextAlign.justify,
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment(0, 0.85),
            child: ButtonTheme(
              minWidth: 150.0,
              height: 60.0,
              child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Text("Back",
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                  color: const Color(0xFFFE614C),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            ),
          )
        ],
      ),
    );
  }
}
