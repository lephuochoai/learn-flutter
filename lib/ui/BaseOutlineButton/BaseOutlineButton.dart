import 'package:flutter/material.dart';

class BaseOutlineButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const BaseOutlineButton({
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(width: 1, color: Colors.white)),
      child: MaterialButton(
        minWidth: double.infinity,
        height: 50,
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
