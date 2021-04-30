import 'dart:collection';

import 'package:flutter/material.dart';

class CheckData extends StatefulWidget {
  final HashMap<String, String> mapInfo;
  const CheckData({Key key, this.mapInfo}) : super(key: key);
  // var mapInfo = HashMap<String, String>();
  // CheckData(this.mapInfo);

  @override
  _CheckDataState createState() {
    return _CheckDataState();
  }
}

class _CheckDataState extends State<CheckData> {
  @override
  Widget build(BuildContext context) {
    var name = widget.mapInfo['first_name'] + " " + widget.mapInfo['last_name'];
    var dob = widget.mapInfo['date_of_birth'];
    var gender = widget.mapInfo["gender"];
    var email = widget.mapInfo["email"];
    var address = widget.mapInfo["address"];
    var mobile = widget.mapInfo["mobile_no"];

    return Container(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(
                "Name: ",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(name, style: TextStyle(fontSize: 16)),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: <Widget>[
              Text(
                "Date of Birth: ",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(dob, style: TextStyle(fontSize: 16)),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: <Widget>[
              Text(
                "Gender: ",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(gender, style: TextStyle(fontSize: 16)),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: <Widget>[
              Text(
                "Email: ",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(email, style: TextStyle(fontSize: 16)),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: <Widget>[
              Text(
                "Address: ",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(address, style: TextStyle(fontSize: 16)),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: <Widget>[
              Text(
                "Mobile No: ",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(mobile, style: TextStyle(fontSize: 16)),
            ],
          ),
        ],
      ),
    );
  }
}
