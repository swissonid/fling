import 'package:fling/component/food_tile.dart';
import 'package:fling/domain/food.dart';
import 'package:fling/flat_ui_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';

typedef void OnFoodItemTaped<FoodItem> (FoodViewModel foodItem, bool selected);

class FoodCategoryExpansionBody extends StatefulWidget {

  const FoodCategoryExpansionBody({Key key,
    @required this.foodItems,
    @required this.onFoodItemTaped,
  }): super(key: key);

  final List<FoodViewModel> foodItems;
  final OnFoodItemTaped onFoodItemTaped;

  @override
  State<StatefulWidget> createState() => new _FoodCategoryExpansionStateBody();
}

class _FoodCategoryExpansionStateBody extends State<FoodCategoryExpansionBody> {


  @override
  Widget build(BuildContext context) {
    return _buildGrid();
  }

  Widget _buildTile(FoodViewModel foodItem) {
    return new Container(
        padding: const EdgeInsets.all(2.0),
        child: new FoodTile(
          name: foodItem.name,
          icon: foodItem.icon,
          onPressed: (bool state) {
            foodItem.isSelected = state;
            widget?.onFoodItemTaped(foodItem, state);
          },
        )
    );
  }

  Widget _buildRow(List<Widget> tiles) {
    return new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: tiles
    );
  }

  Widget _buildGrid() {
    int counter = 0;
    List<Widget> rows = <Widget>[];
    List<Widget> tiles = <Widget>[];
    widget.foodItems.forEach((foodItem){
      if(counter==3){
        counter = 0;
        var newRow = _buildRow(tiles);
        rows.add(newRow);
        tiles = <Widget>[];
      }
      var newTile = _buildTile(foodItem);
      tiles.add(newTile);
      ++counter;
    });
    return new Column(
      mainAxisSize: MainAxisSize.min,
      children: rows,
    );
  }
}