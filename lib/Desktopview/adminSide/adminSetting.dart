import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:fast_color_picker/fast_color_picker.dart';

class AdminSetting extends StatefulWidget {
  @override
  _AdminSettingState createState() => _AdminSettingState();
}

class _AdminSettingState extends State<AdminSetting> {
  Color _color = Colors.red;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#F8F8FA"),
      body: Container(
        padding: EdgeInsets.all(50),
        child: Wrap(
          runSpacing: 20,
          children: [
            Text("Settings",
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 28)),
            Divider(color: Colors.white),
            Text("Restaurant Image",
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20)),
            Container(
              height: 150,
              color: Colors.black12,
            ),
            Text("Restaurant Name",
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20)),
            textField("Pizza Restaurant"),
            Text("Restaurant Location",
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20)),
            textField("Kuala lumpur, Malaysia"),
            Text("Restaurant Theme Color",
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20)),
            Center(
              child: FastColorPicker(
                selectedColor: _color,
                onColorSelected: (color) {
                  setState(() {
                    _color = color;
                  });
                },
              ),
            ),
            Text(
                "*Changing this will effect entire system color including customer side",
                style: TextStyle(fontSize: 12)),
          ],
        ),
      ),
      bottomNavigationBar: submit(),
    );
  }

  textField(String hint,
      {bool multiline = false, bool needHeader = false, String header = ""}) {
    return Row(
      children: [
        needHeader
            ? Expanded(
                flex: 1,
                child: Container(
                  height: 50,
                  alignment: Alignment.center,
                  color: Theme.of(context).accentColor,
                  child: Text(
                    header,
                    style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 18,
                        color: Colors.white),
                  ),
                ),
              )
            : Text(""),
        Expanded(
          flex: 5,
          child: TextField(
            textAlign: TextAlign.start,
            keyboardType:
                multiline ? TextInputType.multiline : TextInputType.text,
            maxLines: multiline ? null : 1,
            minLines: multiline ? null : 1,
            decoration: InputDecoration(
              hintText: hint,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(
                  width: 0,
                  style: BorderStyle.none,
                ),
              ),
              filled: true,
              contentPadding: EdgeInsets.all(16),
              fillColor: HexColor("#F2F2F2"),
            ),
          ),
        ),
      ],
    );
  }

  submit() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 50,
        margin: EdgeInsets.only(bottom: 20, left: 50, right: 50),
        decoration: BoxDecoration(
            color: Theme.of(context).accentColor,
            borderRadius: BorderRadius.circular(5)),
        alignment: Alignment.center,
        child: Text(
          "Save",
          style: TextStyle(
              fontWeight: FontWeight.w800, fontSize: 15, color: Colors.white),
        ),
      ),
    );
  }
}
