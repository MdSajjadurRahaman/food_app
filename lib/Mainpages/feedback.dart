import 'package:flutter/material.dart';
import 'package:food_app/Mainpages/morepage.dart';
import 'package:food_app/widgets/headerwidget.dart';
import 'package:food_app/widgets/tabheaderwidget.dart';

// ignore: camel_case_types
class FeedBack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Feedback';

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: BackButton(
          color: Colors.red,
        ),
        backgroundColor: Colors.white,
        title: Text(
          appTitle,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
      ),
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: feedBackform(),
      ),
    );
  }
}

// Create a Form widget.
class feedBackform extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<feedBackform> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 20),
          Center(
            child: Text(
              "Feel free to drop your feedback here.",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.normal),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          buildTextField("Name", "Please enter your name"),
          buildTextField("Reply Method", "How we can follow up your feedback."),
          TextField(
            decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.always,
                border: UnderlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                hintText: "Drop your message here",
                labelText: "Message"),
            keyboardType: TextInputType.multiline,
            minLines: 5,
            maxLines: null,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                // Validate returns true if the form is valid, or false otherwise.
                if (_formKey.currentState!.validate()) {
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Your feedback sent, thank you.')));
                }
              },
              child: Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}
