import 'package:flutter/material.dart';
import 'package:rhizome/rhizome.dart';
import 'package:rhizome_gui/models/rhizome_manager.dart';
import 'package:rhizome_gui/utils/size_config.dart';
import 'package:rhizome_gui/widgets/thing_card.dart';
import 'package:rhizome_gui/widgets/thing_container.dart';

class ContextualizeScreen extends StatefulWidget {
  final Rhizome rhizome = RhizomeManager.getInstance();
  final Thing thing;
  List<Thing> tags;
  List<Thing> targets;

  ContextualizeScreen({Key key, this.thing}) : super(key: key) {
    tags = thing.tags.map((uri) => rhizome.retrieve(uri)).toList();
    targets = thing.targets.map((uri) => rhizome.retrieve(uri)).toList();
  }

  _ContextualizeScreenState createState() => _ContextualizeScreenState();
}

class _ContextualizeScreenState extends State<ContextualizeScreen> {
  TransformationController controller = TransformationController();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final Rhizome rhizome = RhizomeManager.getInstance();
    final joe = rhizome.store('Joe');
    final zion = rhizome.store('Zion');

    return Scaffold(
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center, 
            children: [
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [ sideColumnCard(zion, "Zion") ]
                )
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [ 
                    sideRowCard(widget.tags),
                    centerCard(rhizome, widget.thing),
                    sideRowCard(widget.targets),
                  ]
                )
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [ sideColumnCard(joe, "Joe") ]
                )
              ),
          ]),
        ),
      ),
    );
  }

  Widget sideColumnCard(Thing thing, String label) {
    return Center(
      child: Column(
        children: [
          ThingCard(thing: thing),
          Text(label, textScaleFactor: 1.5),
        ]
      ),
    );
  }

  Widget sideRowCard(List<Thing> things) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: things.map((thing) => ThingCard(thing: thing)).toList()
      ),
    );
  }

  Widget centerCard(Rhizome rhizome, dynamic centerThing) {
    final moabThing = rhizome.seek('Moab');

    return Container(
      height: SizeConfig.blockSizeVertical * 50,
      width: SizeConfig.blockSizeHorizontal * 30,
      child: ThingCard(thing: moabThing)
    );
  }
}
