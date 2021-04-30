import 'package:flutter/material.dart';

class ContactForm extends StatefulWidget {
  @override
  ContactFormState createState() {
    return ContactFormState();
  }
}

class ContactFormState extends State<ContactForm> {
  static final formKey = GlobalKey<FormState>();

  static TextEditingController controllerEmail = new TextEditingController();
  static TextEditingController controllerAddress = new TextEditingController();
  static TextEditingController controllerMobileNo = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        key: formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              maxLines: 1,
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.email,
                  color: Colors.grey,
                ),
                hintText: 'Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Email is Required";
                }
                return null;
              },
              controller: controllerEmail,
            ),
            SizedBox(height: 20),
            TextFormField(
              minLines: 5,
              maxLines: 7,
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.home,
                  color: Colors.grey,
                ),
                hintText: 'Address',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
              ),
              controller: controllerAddress,
            ),
            SizedBox(height: 20),
            TextFormField(
              maxLines: 1,
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.phone,
                  color: Colors.grey,
                ),
                hintText: 'Mobile No',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Mobile No is Required";
                }
                return null;
              },
              controller: controllerMobileNo,
            ),
          ],
        ),
      ),
    );
  }
}
