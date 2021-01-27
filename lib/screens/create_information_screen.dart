import 'package:flutter/material.dart';
import 'package:rhizome/rhizome.dart';
import 'package:rhizome_gui/widgets/thing_card.dart';

class CreateInformationScreen extends StatefulWidget {

  CreateInformationScreen({Key key, this.rhizome}) : super(key: key);

  final Rhizome rhizome;

  @override
  _CreateInformationScreen createState() => _CreateInformationScreen();
}

class _CreateInformationScreen extends State<CreateInformationScreen> {

  final formKey = GlobalKey<FormState>();
  Thing informationThing;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Information'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                textField('Information'),
                saveButton(context),
              ]
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
        print(value);
      },
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter data';
        } else {
          return null;
        }
      }
    );
  }

  // void storeRhizomeValue() {
  //   setState(() {
  //     ThingCard(thing: informationThing, rhizome: rhizome);
  //   });
  // }

  Widget saveButton(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        if (formKey.currentState.validate()) {
          formKey.currentState.save();
          Navigator.pop(context, informationThing.toString());
        }
      },
      child: Text('ADD TO RHIZOME')
    );
  }
}