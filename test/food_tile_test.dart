import 'package:fling/component/food_tile.dart';
import 'package:fling/flat_ui_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Element findElementOfExactWidgetTypeGoingDown(Element node, Type targetType) {
  void walker(Element child) {
    if (child.widget.runtimeType == targetType)
      throw child;
    child.visitChildElements(walker);
  }
  try {
    walker(node);
  } on Element catch (result) {
    return result;
  }
  return null;
}

Element findElementOfExactWidgetTypeGoingUp(Element node, Type targetType) {
  Element result;
  bool walker(Element ancestor) {
    if (ancestor.widget.runtimeType == targetType)
      result = ancestor;
    return result == null;
  }
  node.visitAncestorElements(walker);
  return result;
}

void checkTileColor(WidgetTester tester, UniqueKey foodTileKey, Color expecteColor) {
  var foodTile = tester.firstElement(find.byKey(foodTileKey));
  var node = findElementOfExactWidgetTypeGoingDown(foodTile, Material);
  Material material = node.widget;
  expect(material.color, expecteColor);
}


void main() {
  testWidgets('Food tile test', (WidgetTester tester) async {
    var foodTileKey = new UniqueKey();
    var isSeleted = false;

    // Tells the tester to build a UI based on the widget tree passed to it
    await tester.pumpWidget(
      new StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return new Material(
            child: new Center(
              child: new FoodTile(
                key: foodTileKey,
                name: "hallo",
                onPressed: (bool newSelectedState) {
                  setState((){
                    isSeleted = newSelectedState;
                  });
                },
              ),
            ),
          );
        },
      ),
    );
    expect(isSeleted, isFalse);
    checkTileColor(tester, foodTileKey, FlatUiColors.turquoise);

    await tester.tap(find.byKey(foodTileKey));
    await tester.pump();
    expect(isSeleted, isTrue);
    checkTileColor(tester, foodTileKey, FlatUiColors.alizarin);

    await tester.tap(find.byKey(foodTileKey));
    await tester.pump();
    expect(isSeleted, isFalse);
    checkTileColor(tester, foodTileKey, FlatUiColors.turquoise);
  });
}

