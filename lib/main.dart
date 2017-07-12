import 'package:fling/component/food_categorie_expansion.dart';
import 'package:fling/domain/food.dart';
import 'package:fling/flat_ui_colors.dart';
import 'package:fling/widget/my_expansion_panel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Fling',
      theme: new ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting
        // the app, try changing the primarySwatch below to Colors.green
        // and then invoke "hot reload" (press "r" in the console where
        // you ran "flutter run", or press Run > Hot Reload App in
        // IntelliJ). Notice that the counter didn't reset back to zero;
        // the application is not restarted.
        primaryColor: FlatUiColors.wet_asphalt,
        scaffoldBackgroundColor: FlatUiColors.midnight_blue
      ),
      home: new MyHomePage(title: 'Home', fruits: fruits,),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key,
    this.title,
    @required this.fruits
  }) : super(key: key);
  final List<FoodViewModel> fruits;

  // This widget is the home page of your application. It is stateful,
  // meaning that it has a State object (defined below) that contains
  // fields that affect how it looks.

  // This class is the configuration for the state. It holds the
  // values (in this case the title) provided by the parent (in this
  // case the App widget) and used by the build method of the State.
  // Fields in a Widget subclass are always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isEx = false;

  @override
  Widget build(BuildContext context) {

    // This method is rerun every time setState is called, for instance
    // as done by the _incrementCounter method above.
    // The Flutter framework has been optimized to make rerunning
    // build methods fast, so that you can just rebuild anything that
    // needs updating rather than having to individually change
    // instances of widgets.
    return new Scaffold(
      appBar: new AppBar(
        // Here we take the value from the MyHomePage object that
        // was created by the App.build method, and use it to set
        // our appbar title.
        title: new Text(widget.title),

      ),
      body: _contend()

    );
  }


  Widget _contend() {

    return new SingleChildScrollView(
        child: new Container(
          margin: const EdgeInsets.all(16.0),

          child: new MyExpansionPanelList(
            color: FlatUiColors.wet_asphalt,
            expansionCallback: (int index, bool isExpended) {
              setState((){
                this._isEx = !_isEx;
              });
            },
            children: <MyExpansionPanel>[
              new MyExpansionPanel(
                  isExpanded: _isEx,
                  headerBuilder: _buildExpandHeader,
                  body: new FoodCategoryExpansionBody(
                      foodItems: widget.fruits,
                      onFoodItemTaped: (FoodViewModel food, bool state){},
                  ),
              ),
              new MyExpansionPanel(
                isExpanded: _isEx,
                headerBuilder: _buildExpandHeader,
                body: new FoodCategoryExpansionBody(
                  foodItems: widget.fruits,
                  onFoodItemTaped: (FoodViewModel food, bool state){},
                ),
              ),
              new MyExpansionPanel(
                isExpanded: _isEx,
                headerBuilder: _buildExpandHeader,
                body: new FoodCategoryExpansionBody(
                  foodItems: widget.fruits,
                  onFoodItemTaped: (FoodViewModel food, bool state){},
                ),
              )
            ],
          ),
        ),
    );
        /*return new FoodItemList(
          foodItems: widget.fruits,
          onFoodItemTaped: (FoodViewModel food, bool state){},
        );*/
  }

  Widget _buildExpandHeader(BuildContext context, bool isExpanded){
    return
      new Container(
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            new Container(
                margin: const EdgeInsets.only(left: 6.0),
                child: new Text(
                  "Fruits and Vegetables",
                  style: new TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                )
            )
          ],
        )
      );
  }


}
