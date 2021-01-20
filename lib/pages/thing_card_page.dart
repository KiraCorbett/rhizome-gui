import 'package:flutter/material.dart';
import 'package:rhizome/rhizome.dart';

class ThingCardPage extends StatefulWidget {
  ThingCardPage({Key key, this.thing}) : super(key: key);

  final String title = "Thing Page";
  final Thing thing;

  @override
  _ThingCardPageState createState() => _ThingCardPageState();
}

class _ThingCardPageState extends State<ThingCardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Card(
            color: Colors.lightGreenAccent,
            child: Center(
              child: Text(widget.thing.information),
            ),
          ),
        ],
      ),
    );
  }
}
