import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:simplibuy/core/constant.dart';
import 'package:simplibuy/core/reusable_widgets/reusable_widgets.dart';

Widget header() {
  return RichText(
      text: const TextSpan(
    style: TextStyle(
        color: blackColor,
        fontSize: 25,
        fontWeight: FontWeight.w600,
        height: 1.4),
    children: <TextSpan>[
      TextSpan(
          text: "Let's know more about your ", style: TextStyle(height: 1.4)),
      TextSpan(
          text: 'Business',
          style: TextStyle(
              color: Colors.transparent,
              shadows: [Shadow(color: Colors.black, offset: Offset(0, -10))],
              decoration: TextDecoration.underline,
              decorationColor: blueColor,
              decorationThickness: 4)),
    ],
  ));
}

Widget textFieldWithHeader(
    {required String title,
    required Function(String) onChanged,
    required String hintText,
    required String? errorText,
    bool isReq = true,
    int lines = 1}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      _text(title, isRequired: isReq),
      TextField(
          onChanged: (business) {
            onChanged(business);
          },
          keyboardType: TextInputType.name,
          maxLines: lines,
          decoration: customInputDecoration(
            hint: hintText,
            errorText: errorText,
          ))
    ],
  );
}

Widget country(BuildContext context, String title) {
  String selectedValue = 'Nigeria';

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      _text(title),
      Container(
        width:
            MediaQuery.of(context).size.width, // Set the width of the container
        height: 50, // Set the height of the container
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(3),
          border: Border.all(
            color: blueColor,
            width: 2,
          ),
        ),
        child: DropdownButton<String>(
          isExpanded:
              true, // Set the dropdown button to expand to the width of the container
          elevation: 0,
          value: selectedValue,
          items: <String>['Nigeria', 'Option 2', 'Option 3', 'Option 4']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (newValue) {},
        ),
      )
    ],
  );
}

Widget imageUpload(BuildContext context, String title) {
  return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    _text(title),
    DottedBorder(
        borderType: BorderType.RRect,
        color: blueColor,
        radius: const Radius.circular(6),
        dashPattern: const [8, 4],
        child: SizedBox(
            width: MediaQuery.of(context)
                .size
                .width, // Set the width of the container
            height: 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Icon(
                  Icons.download_sharp,
                  size: 49,
                ),
                Text("Upload file",
                    style: TextStyle(
                        color: blueColor,
                        fontSize: smallTextFontSize,
                        fontWeight: FontWeight.bold))
              ],
            )))
  ]);
}

Widget _text(String title, {bool isRequired = true}) {
  return RichText(
    text: TextSpan(
      style: const TextStyle(fontSize: 14),
      children: <TextSpan>[
        TextSpan(text: title, style: const TextStyle(color: blackColor)),
        if (isRequired)
          const TextSpan(text: '*', style: TextStyle(color: Colors.red)),
      ],
    ),
  );
}
