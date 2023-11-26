import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton(
      {super.key, this.buttonText, required this.onPressed, this.buttonWidget});

  final String? buttonText;
  final Widget? buttonWidget;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.deepPurple,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: onPressed,
        child: buttonWidget ??
            Text(
              buttonText ?? '',
              style: const TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
      ),
    );
  }
}
