// Copyright 2016 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:fling/widget/my_expand_icon.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

const double _kPanelHeaderCollapsedHeight = 48.0;
const double _kPanelHeaderExpandedHeight = 64.0;

/// Signature for the callback that's called when an [MyExpansionPanel] is
/// expanded or collapsed.
///
/// The position of the panel within an [MyExpansionPanelList] is given by
/// [panelIndex].
typedef void ExpansionPanelCallback(int panelIndex, bool isExpanded);

/// Signature for the callback that's called when the header of the
/// [MyExpansionPanel] needs to rebuild.
typedef Widget ExpansionPanelHeaderBuilder(BuildContext context, bool isExpanded);

/// A material expansion panel. It has a header and a body and can be either
/// expanded or collapsed. The body of the panel is only visible when it is
/// expanded.
///
/// Expansion panels are only intended to be used as children for
/// [MyExpansionPanelList].
///
/// See also:
///
///  * [MyExpansionPanelList]
///  * <https://material.google.com/components/expansion-panels.html>
class MyExpansionPanel {
  /// Creates an expansion panel to be used as a child for [MyExpansionPanelList].
  ///
  /// None of the arguments can be null.
  MyExpansionPanel({
    @required this.headerBuilder,
    @required this.body,

    this.isExpanded: false
  }) : assert(headerBuilder != null),
        assert(body != null),
        assert(isExpanded != null);

  /// The widget builder that builds the expansion panels' header.
  final ExpansionPanelHeaderBuilder headerBuilder;

  /// The body of the expansion panel that's displayed below the header.
  ///
  /// This widget is visible only when the panel is expanded.
  final Widget body;

  /// Whether the panel is expanded.
  ///
  /// Defaults to false.
  final bool isExpanded;
}

/// A material expansion panel list that lays out its children and animates
/// expansions.
///
/// See also:
///
///  * [MyExpansionPanel]
///  * <https://material.google.com/components/expansion-panels.html>
class MyExpansionPanelList extends StatelessWidget {


  /// Creates an expansion panel list widget. The [expansionCallback] is
  /// triggered when an expansion panel expand/collapse button is pushed.
  const MyExpansionPanelList({
    Key key,
    this.children: const <MyExpansionPanel>[],
    this.expansionCallback,
    this.color,
    this.textColor,
    this.animationDuration: kThemeAnimationDuration
  }) : assert(children != null),
        assert(animationDuration != null),
        super(key: key);

  /// The children of the expansion panel list. They are layed in a similar
  /// fashion to [ListBody].
  final List<MyExpansionPanel> children;

  final Color color;
  final Color textColor;

  /// The callback that gets called whenever one of the expand/collapse buttons
  /// is pressed. The arguments passed to the callback are the index of the
  /// to-be-expanded panel in the list and whether the panel is currently
  /// expanded or not.
  ///
  /// This callback is useful in order to keep track of the expanded/collapsed
  /// panels in a parent widget that may need to react to these changes.
  final ExpansionPanelCallback expansionCallback;

  /// The duration of the expansion animation.
  final Duration animationDuration;

  bool _isChildExpanded(int index) {
    return children[index].isExpanded;
  }

  @override
  Widget build(BuildContext context) {
    final List<MergeableMaterialItem> items = <MergeableMaterialItem>[];
    const EdgeInsets kExpandedEdgeInsets = const EdgeInsets.symmetric(
        vertical: _kPanelHeaderExpandedHeight - _kPanelHeaderCollapsedHeight
    );

    for (int i = 0; i < children.length; i += 1) {
      if (_isChildExpanded(i) && i != 0 && !_isChildExpanded(i - 1))
        items.add(new MaterialGap(key: new ValueKey<int>(i * 2 - 1)));

      final Widget header = new Container(
          color: color,
          child: new Row(
              children: <Widget>[
                new Expanded(
                    child: new AnimatedContainer(

                        duration: animationDuration,
                        curve: Curves.fastOutSlowIn,
                        margin: _isChildExpanded(i) ? kExpandedEdgeInsets : EdgeInsets.zero,
                        child: new SizedBox(
                            height: _kPanelHeaderCollapsedHeight,
                            child: children[i].headerBuilder(
                                context,
                                children[i].isExpanded
                            )
                        )
                    )
                ),
                new Container(
                    margin: const EdgeInsets.only(right: 8.0),
                    child: new MyExpandIcon(
                        isExpanded: _isChildExpanded(i),
                        padding: const EdgeInsets.all(16.0),
                        onPressed: (bool isExpanded) {
                          if (expansionCallback != null) {
                            expansionCallback(i, isExpanded);
                          }
                        }
                    )
                )
              ]
          )
        );

      items.add(
          new MaterialSlice(
              key: new ValueKey<int>(i * 2),
              child: new Container(
                color: color,
                child: new Column(
                  children: <Widget>[
                    header,
                    new AnimatedCrossFade(
                      firstChild: new Container(height: 0.0),
                      secondChild: children[i].body,
                      firstCurve: const Interval(0.0, 0.6, curve: Curves.fastOutSlowIn),
                      secondCurve: const Interval(0.4, 1.0, curve: Curves.fastOutSlowIn),
                      sizeCurve: Curves.fastOutSlowIn,
                      crossFadeState: _isChildExpanded(i) ? CrossFadeState.showSecond : CrossFadeState.showFirst,
                      duration: animationDuration,
                    )
                  ],
              )
              )
          )
      );

      if (_isChildExpanded(i) && i != children.length - 1)
        items.add(new MaterialGap(key: new ValueKey<int>(i * 2 + 1)));
    }

    return new MergeableMaterial(
        hasDividers: true,
        children: items
    );
  }
}
