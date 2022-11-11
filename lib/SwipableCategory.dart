import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SwipableCategory extends StatelessWidget {
  const SwipableCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        print("pressed");
      },
      style: OutlinedButton.styleFrom(
        foregroundColor: Color(0xff583823),
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
        side: BorderSide(width: 3.0, color: Color(0xff583823)),
      ),
      child: const Text("cooking"),
    );
  }
}
