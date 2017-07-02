import 'package:fling/flat_ui_colors.dart';
import 'package:flutter/material.dart';

class FoodTile extends StatefulWidget {
  const FoodTile({Key key,
    this.name,
    this.icon = Icons.code,
    this.onPressed,
  }) : super(key: key);

  final String name;
  final IconData icon;
  final ValueChanged<bool> onPressed;

  @override
  State<FoodTile> createState() => new _FoodTileState();

}

class _FoodTileState extends State<FoodTile> {
  bool _isSelected = false;

  void _toggleSelection() {
    setState(() {
      _isSelected = !_isSelected;
      widget.onPressed(_isSelected);
    });
  }

  @override
  Widget build(BuildContext context) {

    return new Material(
        color: _isSelected ? FlatUiColors.alizarin : FlatUiColors.turquoise,
        elevation: 4.0,
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Expanded(child: icon()),
          name(),
        ],
      );

  Icon icon() => new Icon(
        widget.icon,
        color: Colors.white,
        size: 40.0,
      );

  Text name() => new Text(widget.name,
      textAlign: TextAlign.center, style: new TextStyle(color: Colors.white));
}
