class Food {
  String idMeal;
  String strMeal;
  String strInstructions;
  String strMealThumb;

  Food({this.idMeal, this.strMeal, this.strInstructions, this.strMealThumb});

  factory Food.createFood(Map<String, dynamic> object) {
    return Food(
        idMeal: object['idMeal'],
        strMeal: object['strMeal'],
        strInstructions: object['strInstructions'],
        strMealThumb: object['strMealThumb']);
  }
}
