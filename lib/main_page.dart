import 'dart:async';

import 'package:flutter/material.dart';
import 'package:var_mealapp/food_grid.dart';
import 'package:var_mealapp/food_page.dart';
import 'package:var_mealapp/model_food.dart';
import 'package:var_mealapp/request_list.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  //
  StreamController<int> streamController = new StreamController<int>();

  gridview(AsyncSnapshot<List<Food>> snapshot) {
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: GridView.count(
        padding: EdgeInsets.all(20),
        crossAxisCount: 2,
        childAspectRatio: 1.0,
        mainAxisSpacing: 20.0,
        crossAxisSpacing: 20.0,
        children: snapshot.data.map(
          (food) {
            return GestureDetector(
              child: GridTile(
                child: FoodGrid(food),
              ),
              onTap: () {
                goToDetailsPage(context, food);
              },
            );
          },
        ).toList(),
      ),
    );
  }

  goToDetailsPage(BuildContext context, Food food) {
    Navigator.push(
      context,
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (BuildContext context) => GridDetails(
          curFood: food,
        ),
      ),
    );
  }

  circularProgress() {
    return Center(
      child: const CircularProgressIndicator(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Menu"),
        backgroundColor: const Color(0xFFFE614C),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Flexible(
            child: FutureBuilder<List<Food>>(
              future: GetFood.getFoods(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text('Error ${snapshot.error}');
                }
                if (snapshot.hasData) {
                  streamController.sink.add(snapshot.data.length);
                  return gridview(snapshot);
                }

                return circularProgress();
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    streamController.close();
    super.dispose();
  }
}
