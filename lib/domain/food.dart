import 'package:flutter/material.dart';


class FoodViewModel {

  FoodViewModel({this.name, this.icon});
  final String name;
  final IconData icon;
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

];