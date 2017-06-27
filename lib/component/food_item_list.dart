import 'package:fling/component/food_tile.dart';
import 'package:fling/domain/food.dart';
import 'package:flutter/material.dart';


class FoodItemList extends StatefulWidget {
  const FoodItemList({Key key,
    this.foodItems : const <FoodViewModel>[]
  }): super(key: key);

  final List<FoodViewModel> foodItems;
  @override
  State<StatefulWidget> createState() => new _FoodItemListState();
}

class _FoodItemListState extends State<FoodItemList> {

  @override
  Widget build(BuildContext context) {
    return _getContent();
  }


  Widget _getContent() {
    if(widget.foodItems.isEmpty) {
      return _emptyWidget();
    }
    return _list();
  }
  Widget _emptyWidget() {
    return
      new Row (
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Container(
                padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
                child: new Text("Nothing to buy!"),
              ),

              new Text(
                  "Search an itm by name or \n browse the categories below.",
                  textAlign: TextAlign.center,
                  textScaleFactor: 0.8,)
            ],
          )
        ],
      );
  }

  Widget _list() {
    return new GridView.count(
        crossAxisCount: 3,
        padding: const EdgeInsets.all(16.0),
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
        children: widget.foodItems.map((FoodViewModel food){
            return new FoodTile(name: food.name, onPressed: (bool state) {},);
        }).toList(),
    );
  }
}