import 'package:flutter/material.dart';
import 'package:rhizome/rhizome.dart';
import 'package:rhizome_gui/widgets/thing_card.dart';

class CenterThingScreen extends StatefulWidget {
  final Thing thing;

  CenterThingScreen({Key key, this.thing}) : super(key: key);

  _CenterThingScreen createState() => _CenterThingScreen();
}

class _CenterThingScreen extends State<CenterThingScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Expanded(
        child: InteractiveViewer(
          panEnabled: true,
          boundaryMargin: EdgeInsets.all(double.infinity),
          minScale: 0.1,
          maxScale: 4,
          child: ThingCard(thing: widget.thing),
        ),
      )
    ]));
  }
}
