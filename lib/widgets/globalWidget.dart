import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

const kPrimaryColor = Color(0xFFA11313);
const kPrimaryLightColor = Color(0xFFFFE6E6);

textField(String hint, TextEditingController text,
    {bool multiline = false,
    bool needFooter = false,
    IconData footerIcon = Icons.edit,
    bool isEnabled = true,
    bool isWhite = true}) {
  return Container(
    alignment: Alignment.topRight,
    decoration: needFooter
        ? BoxDecoration(
            border: Border(
            bottom: BorderSide(width: 2.0, color: Colors.black),
          ))
        : multiline
            ? BoxDecoration(
                border: Border.all(width: 1.0, color: Colors.black12),
                borderRadius: BorderRadius.circular(10))
            : BoxDecoration(),
    child: Row(
      children: [
        Flexible(
          child: TextField(
            textAlign: TextAlign.start,
            controller: text,
            enabled: isEnabled,
            style: TextStyle(
                fontWeight: multiline ? FontWeight.w400 : FontWeight.bold),
            keyboardType:
                multiline ? TextInputType.multiline : TextInputType.text,
            maxLines: multiline ? null : 1,
            minLines: multiline ? null : 1,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(fontWeight: FontWeight.normal),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(
                  width: 0,
                  style: BorderStyle.none,
                ),
              ),
              filled: true,
              fillColor: isWhite ? Colors.white : Colors.grey.withOpacity(0.2),
              contentPadding: EdgeInsets.all(16),
            ),
          ),
        ),
        Offstage(
          offstage: !needFooter,
          child: Container(
            alignment: Alignment.centerRight,
            child: Icon(footerIcon),
          ),
        )
      ],
    ),
  );
}

button(String text, dynamic function, Color bgColor, Color txtColor,
    {IconData? icon, double height = 60, bool rounded = false}) {
  return GestureDetector(
    onTap: function,
    child: Container(
      height: height,
      alignment: Alignment.center,
      width: double.infinity,
      decoration: BoxDecoration(
          color: bgColor,
          border: bgColor == Colors.transparent
              ? Border.all(width: 2, color: Colors.red)
              : Border.all(width: 0, color: Colors.transparent),
          borderRadius:
              rounded ? BorderRadius.circular(5) : BorderRadius.circular(0)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Offstage(
            offstage: icon == null,
            child: Padding(
              padding: EdgeInsets.only(right: 10),
              child: Icon(
                icon,
                color: txtColor,
              ),
            ),
          ),
          Text(
            text,
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                  color: txtColor, fontWeight: FontWeight.w800, fontSize: 13),
            ),
          ),
        ],
      ),
    ),
  );
}

iconWithText(IconData icon, String title, bool activated) {
  return Wrap(
    alignment: WrapAlignment.center,
    crossAxisAlignment: WrapCrossAlignment.center,
    runSpacing: 20,
    spacing: 20,
    direction: Axis.vertical,
    children: [
      Icon(
        icon,
        size: 50,
        color: activated ? Colors.white : Colors.white24,
      ),
      Text(
        title,
        style: GoogleFonts.poppins(
          textStyle: TextStyle(
              color: activated ? Colors.white : Colors.white24,
              fontWeight: FontWeight.w800,
              fontSize: 13),
        ),
      ),
    ],
  );
}

imgWithText(String url, String title, bool activated) {
  return Container(
    height: 100,
    width: 150,
    alignment: Alignment.center,
    margin: EdgeInsets.symmetric(horizontal: 20),
    decoration: BoxDecoration(
        border: Border.all(
            width: activated ? 4 : 1,
            color: activated ? Colors.blueAccent : Colors.black26),
        borderRadius: BorderRadius.circular(10)),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.center,
          height: 80,
          width: 80,
          padding: EdgeInsets.all(10),
          child: Image(
            image: NetworkImage(url),
            fit: BoxFit.fitHeight,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          title == "lalamove" || title == "BillPlz"
              ? title + "\n(Coming Soon)"
              : title,
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
                color: activated ? Colors.black : Colors.black38,
                fontWeight: FontWeight.w800,
                fontSize: 13),
          ),
        ),
      ],
    ),
  );
}

universalTXTField(
  BuildContext context,
  String hint,
  TextEditingController text, {
  bool multiline = false,
  bool needHeader = false,
  String header = "",
}) {
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
          controller: text,
          textAlign: TextAlign.start,
          style: TextStyle(fontWeight: FontWeight.bold),
          keyboardType:
              multiline ? TextInputType.multiline : TextInputType.text,
          maxLines: multiline ? null : 1,
          minLines: multiline ? null : 1,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(fontWeight: FontWeight.normal),
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

inputRow(
    String name, TextEditingController text, BuildContext context, String types,
    [dynamic funciton, dynamic selectedDate]) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        name,
        style: GoogleFonts.poppins(
          textStyle: TextStyle(
              fontSize: 15.0, color: Colors.black, fontWeight: FontWeight.w500),
        ),
      ),
      if (types == "textfield")
        Container(
          //color: Colors.blue,
          width: 200,
          child: TextField(
            style: TextStyle(color: Colors.black),
            textAlign: TextAlign.end,
            controller: text,
            decoration: InputDecoration(
                hintText: "Insert text here",
                hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none),
          ),
        ),
      if (types == "datetime")
        GestureDetector(
          onTap: funciton, // Refer step 3
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                Text(
                  "${selectedDate.toLocal()}".split(' ')[0],
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
                SizedBox(
                  width: 5,
                ),
                Icon(
                  Icons.calendar_today,
                  color: Colors.black,
                )
              ],
            ),
          ),
        ),
    ],
  );
}

class LoadingButton extends StatefulWidget {
  final Future Function()? onPressed;
  final String text;

  const LoadingButton({Key? key, required this.onPressed, required this.text})
      : super(key: key);

  @override
  _LoadingButtonState createState() => _LoadingButtonState();
}

class _LoadingButtonState extends State<LoadingButton> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: (_isLoading || widget.onPressed == null) ? null : _loadFuture,
      child: _isLoading
          ? SizedBox(height: 16, width: 16, child: CircularProgressIndicator())
          : Text(widget.text),
    );
  }

  Future<void> _loadFuture() async {
    setState(() {
      _isLoading = true;
    });

    try {
      await widget.onPressed!();
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Error $e')));
      rethrow;
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }
}
