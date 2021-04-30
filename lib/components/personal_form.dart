import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class PersonalForm extends StatefulWidget {
  @override
  PersonalFormState createState() {
    return PersonalFormState();
  }
}

class PersonalFormState extends State<PersonalForm> {
  static final formKey = GlobalKey<FormState>();
  String _date = "Not set";

  static TextEditingController controllerFirstName = TextEditingController();
  static TextEditingController controllerLastName = TextEditingController();
  static TextEditingController controllerDateOfBirth = TextEditingController();
  static TextEditingController controllerGender = TextEditingController();

  /*
    Date picker for select date of birth in Thai format
  */
  void _selectDateOfBirth(BuildContext context) {
    DatePicker.showDatePicker(context,
        theme: DatePickerTheme(
          containerHeight: 210.0,
        ),
        showTitleActions: true,
        minTime: DateTime(1970, 1, 1),
        maxTime: DateTime(2022, 12, 31), onConfirm: (date) {
      print('confirm $date');
      _date = '${date.year} - ${date.month} - ${date.day}';
      setState(() {
        controllerDateOfBirth.text = _date.toString();
      });
    }, currentTime: DateTime.now(), locale: LocaleType.th);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        key: formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              maxLines: 1,
              controller: controllerFirstName,
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.person,
                  color: Colors.grey,
                ),
                hintText: 'First Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "First Name is Required";
                }
                return null;
              },
            ),
            SizedBox(height: 20),
            TextFormField(
              maxLines: 1,
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.person,
                  color: Colors.grey,
                ),
                hintText: 'Last Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Last Name is Required";
                }
                return null;
              },
              controller: controllerLastName,
            ),
            SizedBox(height: 20),
            TextFormField(
              maxLines: 1,
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.calendar_today,
                  color: Colors.grey,
                ),
                hintText: 'Date of Birth',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
              ),
              controller: controllerDateOfBirth,
              onTap: () => _selectDateOfBirth(context),
            ),
            SizedBox(height: 20),
            TextFormField(
                maxLines: 1,
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.person,
                    color: Colors.grey,
                  ),
                  hintText: 'Gender',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
                controller: controllerGender),
          ],
        ),
      ),
    );
  }
}
