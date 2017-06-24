import 'package:flutter/material.dart';

class FoodItem extends StatefulWidget {
  const FoodItem({Key key,
    this.name,
    this.onPressed
  }) : super(key: key);

  final String name;
  final ValueChanged<bool> onPressed;

  @override
  State<FoodItem> createState() => new _FoodItemState();

}

class _FoodItemState extends State<FoodItem> {
  bool _isSelected = false;


  bool get isSelected => _isSelected;

  void _toggleSelection() {
    setState(() {
      _isSelected = !_isSelected;
      widget.onPressed(_isSelected);
    });
  }

  @override
  Widget build(BuildContext context) {

    return new Material(
        color: _isSelected ? Colors.red[400] : Colors.green[400],
        child: new InkWell(
                onTap: _toggleSelection,
                child: container())
              );
  }

  Container container() => new Container(
            width: 125.0,
            height: 125.0,
            padding: const EdgeInsets.all(8.0),
            child: new Center(
              child: content(),
            ));

  Column content() => new Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          icon(),
          name(),
        ],
      );

  Icon icon() => new Icon(
        Icons.add_shopping_cart,
        color: Colors.white,
        size: 40.0,
      );

  Text name() => new Text(widget.name,
      textAlign: TextAlign.center, style: new TextStyle(color: Colors.white));
}
