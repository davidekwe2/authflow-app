import 'package:flutter/material.dart';

class Mybuttons extends StatelessWidget {
  final String text;
  final VoidCallback ontap; // use VoidCallback instead of Function

  const Mybuttons({
    super.key,
    required this.text,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap, // call the passed function
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 156, vertical: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Theme.of(context).colorScheme.primary,
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
      ),
    );
  }
}
