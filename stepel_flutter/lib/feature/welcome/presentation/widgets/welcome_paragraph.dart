import 'package:flutter/material.dart';

class WelcomeParagraph extends StatelessWidget {
  final String title;
  final String description;

  const WelcomeParagraph({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(children: [
        TextSpan(text: '$title\n', style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w500, height: 2.5)),
        TextSpan(
            text: description, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.grey[400]))
      ]),
    );
  }
}
