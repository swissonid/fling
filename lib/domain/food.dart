import 'package:flutter/material.dart';


class FoodViewModel {

  FoodViewModel({this.name, this.icon, this.isSelected = false});
  final String name;
  final IconData icon;
  bool isSelected;
}

final List<FoodViewModel> fruits = <FoodViewModel>[
   new FoodViewModel(name: "Apples",icon: Icons.add_shopping_cart),
   new FoodViewModel(name: "Apricot",icon: Icons.add),
   new FoodViewModel(name: "Artichokes",icon: Icons.account_balance),
   new FoodViewModel(name: "Arugula",icon: Icons.ac_unit),
   new FoodViewModel(name: "Asparagus",icon: Icons.access_alarm),
   new FoodViewModel(name: "Avocado",icon: Icons.accessibility),
   new FoodViewModel(name: "Bananas",icon: Icons.code),
   new FoodViewModel(name: "Bell pepper",icon: Icons.call),
   new FoodViewModel(name: "Berries",icon: Icons.cake),
   new FoodViewModel(name: "Blackberries",icon: Icons.cached),
   new FoodViewModel(name: "Blueberries",icon: Icons.work),
   new FoodViewModel(name: "Broccoli",icon: Icons.youtube_searched_for),
   new FoodViewModel(name: "Cabbage",icon: Icons.radio),
   new FoodViewModel(name: "Carrots",icon: Icons.radio),
   new FoodViewModel(name: "Cauliflower",icon: Icons.radio),
   new FoodViewModel(name: "Celery",icon: Icons.radio),
   new FoodViewModel(name: "Cherries",icon: Icons.radio),
   new FoodViewModel(name: "Cherry tomatoes",icon: Icons.radio),
   new FoodViewModel(name: "Chillies",icon: Icons.radio),
   new FoodViewModel(name: "Chives",icon: Icons.radio),
   new FoodViewModel(name: "Cilantro",icon: Icons.radio),
   new FoodViewModel(name: "Cranberries",icon: Icons.radio),
   new FoodViewModel(name: "Cucumber",icon: Icons.radio),
   new FoodViewModel(name: "Dates",icon: Icons.radio),
   new FoodViewModel(name: "Eggplant",icon: Icons.radio),
   new FoodViewModel(name: "Fennel",icon: Icons.radio),
   new FoodViewModel(name: "Fruit",icon: Icons.radio),
   new FoodViewModel(name: "Garlic",icon: Icons.radio),
   new FoodViewModel(name: "Ginger",icon: Icons.radio),
   new FoodViewModel(name: "Grapefruit",icon: Icons.radio),
   new FoodViewModel(name: "Grapes",icon: Icons.radio),
   new FoodViewModel(name: "Herbs",icon: Icons.radio),
   new FoodViewModel(name: "Kiwis",icon: Icons.radio),
   new FoodViewModel(name: "Leek",icon: Icons.radio),
];

final List<FoodViewModel> meat = <FoodViewModel>[
  new FoodViewModel(name: "Bacon",icon: Icons.add_shopping_cart),
  new FoodViewModel(name: "Beef",icon: Icons.add_shopping_cart),
  new FoodViewModel(name: "Bratwurst",icon: Icons.add_shopping_cart),
  new FoodViewModel(name: "Chicken",icon: Icons.add_shopping_cart),
  new FoodViewModel(name: "Chicken breast",icon: Icons.add_shopping_cart),
  new FoodViewModel(name: "Cold cuts",icon: Icons.add_shopping_cart),
  new FoodViewModel(name: "Gruond meat",icon: Icons.add_shopping_cart),
  new FoodViewModel(name: "Ham",icon: Icons.add_shopping_cart),
  new FoodViewModel(name: "Hotdog",icon: Icons.add_shopping_cart),
  new FoodViewModel(name: "Lamb",icon: Icons.add_shopping_cart),
  new FoodViewModel(name: "Meat",icon: Icons.add_shopping_cart),
  new FoodViewModel(name: "Pork",icon: Icons.add_shopping_cart),
  new FoodViewModel(name: "Prosciutto",icon: Icons.add_shopping_cart),
  new FoodViewModel(name: "Salami",icon: Icons.add_shopping_cart),
  new FoodViewModel(name: "Sausage",icon: Icons.add_shopping_cart),
  new FoodViewModel(name: "Sausages",icon: Icons.add_shopping_cart),
  new FoodViewModel(name: "Sliced beef",icon: Icons.add_shopping_cart),
  new FoodViewModel(name: "Steak",icon: Icons.add_shopping_cart),
  new FoodViewModel(name: "Turkey",icon: Icons.add_shopping_cart),
  new FoodViewModel(name: "Turkey breast",icon: Icons.add_shopping_cart),
  new FoodViewModel(name: "Veal",icon: Icons.add_shopping_cart),

];

final List<FoodViewModel> fish = <FoodViewModel>[
  new FoodViewModel(name: "Anchovies",icon: Icons.add_shopping_cart),
  new FoodViewModel(name: "Fish",icon: Icons.add_shopping_cart),
  new FoodViewModel(name: "Lobster",icon: Icons.add_shopping_cart),
  new FoodViewModel(name: "Mussles",icon: Icons.add_shopping_cart),
  new FoodViewModel(name: "Oysters",icon: Icons.add_shopping_cart),
  new FoodViewModel(name: "Salmon",icon: Icons.add_shopping_cart),
  new FoodViewModel(name: "Shrimp",icon: Icons.add_shopping_cart),
  new FoodViewModel(name: "Tuna",icon: Icons.add_shopping_cart),

];