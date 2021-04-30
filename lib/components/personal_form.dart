import 'package:flutter/material.dart';

class PersonalForm extends StatefulWidget {
  @override
  PersonalFormState createState() {
    return PersonalFormState();
  }
}

class PersonalFormState extends State<PersonalForm> {
  static final formKey = GlobalKey<FormState>();

  static TextEditingController controllerFirstName = TextEditingController();
  static TextEditingController controllerLastName = TextEditingController();
  static TextEditingController controllerDateOfBirth = TextEditingController();
  static TextEditingController controllerGender = TextEditingController();

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
                controller: controllerDateOfBirth),
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