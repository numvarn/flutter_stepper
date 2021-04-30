import 'dart:collection';

/// Flutter code sample for Stepper

import 'package:flutter/material.dart';
import 'package:steppter/components/check_data.dart';
import 'package:steppter/components/contact_form.dart';
import 'package:steppter/components/personal_form.dart';

void main() => runApp(MyApp());

/// This is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = 'Flutter Stepper';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: Center(
          child: MyStatefulWidget(),
        ),
      ),
    );
  }
}

/// This is the stateful widget that the main application instantiates.
class MyStatefulWidget extends StatefulWidget {
  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _index = 0;

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    // * Get input data
    var mapData = HashMap<String, String>();

    mapData['first_name'] = PersonalFormState.controllerFirstName.text;
    mapData['last_name'] = PersonalFormState.controllerLastName.text;
    mapData['date_of_birth'] = PersonalFormState.controllerDateOfBirth.text;
    mapData['gender'] = PersonalFormState.controllerGender.text;
    mapData['email'] = ContactFormState.controllerEmail.text;
    mapData['address'] = ContactFormState.controllerAddress.text;
    mapData['mobile_no'] = ContactFormState.controllerMobileNo.text;

    return Container(
      height: size.height,
      width: size.width,
      child: Stepper(
        currentStep: _index,
        controlsBuilder: _createEventControlBuilder,
        onStepCancel: () {
          if (_index <= 0) {
            return;
          }
          setState(() {
            _index--;
          });
        },
        onStepContinue: () {
          if (_index >= 2) {
            print("Processing Data");
            return;
          }
          setState(() {
            if (_index == 0 &&
                PersonalFormState.formKey.currentState.validate()) {
              _index++;
            } else if (_index == 1 &&
                ContactFormState.formKey.currentState.validate()) {
              _index++;
            }
          });
        },
        onStepTapped: (index) {
          setState(() {
            _index = index;
          });
        },
        type: StepperType.horizontal,
        steps: [
          Step(
            title: Text("Personal"),
            content: Container(
              alignment: Alignment.centerLeft,
              child: PersonalForm(),
            ),
            isActive: _index == 0 ? true : false,
            state: _index == 0 ? StepState.editing : StepState.indexed,
          ),
          Step(
            title: Text("Contact"),
            content: ContactForm(),
            isActive: _index == 1 ? true : false,
            state: _index == 1 ? StepState.editing : StepState.indexed,
          ),
          Step(
            title: Text("Check"),
            content: CheckData(mapInfo: mapData),
            isActive: _index == 2 ? true : false,
            state: _index == 2 ? StepState.editing : StepState.indexed,
          ),
        ],
      ),
    );
  }

  // * For orverride stepper button
  Widget _createEventControlBuilder(BuildContext context,
      {VoidCallback onStepContinue, VoidCallback onStepCancel}) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: onStepCancel,
              child: Text('BACK'),
            ),
          ],
        ),
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
        child: Column(
          children: <Widget>[
            ElevatedButton(
              onPressed: onStepContinue,
              child: _index == 2 ? Text('SUBMIT') : Text("NEXT"),
            ),
          ],
        ),
      )
    ]);
  }
}
