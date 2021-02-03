import 'package:flutter/material.dart';
import 'package:rhizome/rhizome.dart';
import '../models/rhizome_manager.dart';
import '../widgets/moveable_thing.dart';

class CreateInformationScreen extends StatefulWidget {
  CreateInformationScreen({Key key}) : super(key: key);

  final Rhizome rhizome = RhizomeManager.getInstance();

  @override
  _CreateInformationScreen createState() => _CreateInformationScreen();
}

class _CreateInformationScreen extends State<CreateInformationScreen> {
  final formKey = GlobalKey<FormState>();
  Thing informationThing;
  Thing tagThing;

  List<Thing> rhizomeThings;

  @override
  Widget build(BuildContext context) {
    //rhizomeList = widget.rhizome.query();

    return Scaffold(
      appBar: AppBar(
        title: Text('Create Information'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          child: Form(
            key: formKey,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(children: [
                    textField('Information'),
                    saveButton(context),
                  ]),
                ],
              )
            ),
          ),
        ),
      ),
    );
  }

  TextFormField textField(String toolTipText) {
    return TextFormField(
        autofocus: true,
        decoration: InputDecoration(
            labelText: toolTipText, border: OutlineInputBorder()),
        onSaved: (value) {
          // store value of object
          informationThing = widget.rhizome.store(value);
        },
        validator: (value) {
          if (value.isEmpty) {
            return 'Please enter data';
          } else {
            return null;
          }
        });
  }

  void listRhizome() {
    rhizomeThings = widget.rhizome
        .query()
        .map((thing) => MoveableThing())
        .cast<Thing>()
        .toList();
  }

  Widget saveButton(BuildContext context) {
    return RaisedButton(
        onPressed: () {
          if (formKey.currentState.validate()) {
            formKey.currentState.save();
            Navigator.pop(context, informationThing.toString());
          }
        },
        child: Text('ADD TO RHIZOME'));
  }
}
