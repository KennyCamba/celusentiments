import 'package:flutter/material.dart';

class CustomTextArea extends StatelessWidget {
  const CustomTextArea({
    Key key,
    @required this.postContoller,
  }) : super(key: key);

  final TextEditingController postContoller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: postContoller,
      cursorColor: Colors.cyan,
      maxLines: 8,
      textAlign: TextAlign.justify,
      style: TextStyle(color: Colors.deepOrangeAccent),
      decoration: InputDecoration(
          isDense: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          )),
    );
  }
}