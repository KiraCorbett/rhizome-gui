import 'package:flutter/material.dart';
import 'package:rhizome/rhizome.dart';
import 'package:rhizome_gui/widgets/taggable_thing.dart';
import '../screens/thing_screen.dart';

class ThingCard extends StatefulWidget {
  final Uri uri;
  final Thing thing;
  final TaggableThing taggableThing;

  ThingCard(
      {this.uri,
      this.thing,
      List<Thing> tags,
      List<Thing> targets,
      this.taggableThing});

  @override
  _ThingCardState createState() => _ThingCardState();
}

class _ThingCardState extends State<ThingCard> {
  @override
  Widget build(BuildContext context) {
    bool accepted = false;

    return TextButton(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all(Colors.deepOrange),
      ),
      onPressed: () => {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ThingScreen(thing: widget.thing)))
      },
      // child: LongPressDraggable(
      //   feedback: _thingContainer(accepted),
      //   child: _thingContainer(accepted),
      //   onDragEnd: (details) {
      //     print('dragged');
      //   },
      // ),
      child: LongPressDraggable<Thing>(
          data: widget.thing,
          onDragStarted: () => print("start"),
          onDragCompleted: () => print("completed"),
          onDragEnd: (details) => print("ended"),
          onDraggableCanceled: (data, data2) => print("canceled"),
          child: _thingContainer(accepted),
          childWhenDragging: Container(
            width: 200,
            height: 200,
            color: Colors.blueGrey,
            child: _thingContainer(accepted),
          ),
          feedback: Container(
            width: 200,
            height: 200,
            color: Colors.blueGrey,
            child: _thingContainer(accepted),
          ),
      ),
    );
  }

  Widget _thingContainer(bool accepted) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        DragTarget<Thing>(
            onWillAccept: (Thing d) => true,
            onAccept: (Thing d) => print("accept"),
            onLeave: (d) => print("leave"),
            builder: (context, candidateData, rejectedData) {
              return Container(
                width: 200,
                height: 200,
                child: Card(
                  color: Colors.lightBlueAccent,
                  child: Center(
                    child: Text(widget.thing.information),
                  ),
                ),
              );
            }),
      ],
    );
  }
}
