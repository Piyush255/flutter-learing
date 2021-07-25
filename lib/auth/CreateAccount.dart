import 'package:flutter/material.dart';

import 'Login.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  String genderValue = "";
  TextEditingController genderController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 20),
          child: Column(
            children: [title(), fullName(), yearLevel(), gender()],
          ),
        ),
      ),
    );
  }

  Widget fullName() {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 20),
          alignment: Alignment.centerLeft,
          child: Text(
            "Full Name",
            textDirection: TextDirection.ltr,
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
          decoration: boxDecoration(),
          child: TextField(
            decoration: inputDecoration("Enter Name"),
          ),
        )
      ],
    );
  }

  boxDecoration() {
    return BoxDecoration(
        color: Color(hexColor("#BDCCE3")).withOpacity(0.2),
        borderRadius: BorderRadius.all(Radius.circular(15)));
  }

  inputDecoration(String hint) {
    return InputDecoration(
        hintText: hint,
        border: InputBorder.none,
        contentPadding: EdgeInsets.only(left: 10, top: 15, bottom: 15));
  }

  Widget yearLevel() {
    return Column(
      children: [
        Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(top: 15),
            child: Text("Year Level")),
        Container(
          margin: EdgeInsets.only(top: 2),
          decoration: boxDecoration(),
          child: TextField(
            decoration: inputDecoration("Select Year level"),
          ),
        )
      ],
    );
  }

  Widget gender() {
    return Column(
      children: [
        Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(top: 15),
            child: Text("Gender")),
        Container(
          margin: EdgeInsets.only(top: 2),
          decoration: boxDecoration(),
          child: TextField(
            enableInteractiveSelection: false,
            readOnly: true,
            controller: genderController,
            onTap: () {
              bottomSheet();
            },
            decoration: InputDecoration(
                hintText: "Select Gender",
                border: InputBorder.none,
                suffixIcon: Padding(
                    padding: EdgeInsets.all(12),
                    child: Image.asset(
                      "assets/images/ic_arrow_down.png",
                      width: 0,
                      height: 0,
                    )),
                contentPadding: EdgeInsets.only(left: 10, top: 15, bottom: 15)),
          ),
        )
      ],
    );
  }

  title() {
    return Column(
      children: [
        Container(
            margin: EdgeInsets.only(top: 30),
            child: Text(
              "Create Account",
              style: TextStyle(fontSize: 22),
            )),
        Container(
          margin: EdgeInsets.only(top: 10),
          child: Divider(color: Colors.grey.withAlpha(80)),
        )
      ],
    );
  }

  bottomSheet() async {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                  margin: EdgeInsets.only(top: 10),
                  child: TextButton(
                    child: Text(
                      "Male",
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                    onPressed: () {
                      genderController.text = "Male";
                      Navigator.pop(context);
                    },
                  )),
              Container(
                  margin: EdgeInsets.only(top: 10),
                  child: TextButton(
                    child: Text(
                      "Female",
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                    onPressed: () {
                      genderController.text = "Female";
                      Navigator.pop(context);
                    },
                  )),
              Container(
                  margin: EdgeInsets.only(top: 10),
                  child: TextButton(
                    child: Text(
                      "Other",
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                    onPressed: () {
                      genderController.text = "Other";
                      Navigator.pop(context, "Other");
                    },
                  )),
            ],
          );
        });
    // Save the bottomsheet in a variable

    // Detect when it closes
// Do something here
  }
}
