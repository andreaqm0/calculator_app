import 'package:flutter/material.dart';

Widget button(String text, double height, Color color, BuildContext context,
    dynamic onpressed) {
  return Container(
    height: MediaQuery.of(context).size.height * 0.1 * height,
    color: color,
    // padding: const EdgeInsets.all(15),
    child: TextButton(
      onPressed: () => onpressed(text),
      style: ButtonStyle(
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0.0),
              side: const BorderSide(
                  color: Colors.white, width: 1, style: BorderStyle.solid)))),
      child: Text(
        text,
        style: const TextStyle(
            fontSize: 32, fontWeight: FontWeight.normal, color: Colors.white),
      ),
    ),
  );
}
