import 'package:flutter/material.dart';

class GenderColumn extends StatelessWidget {
  final String? gender;

  const GenderColumn({
    super.key,
    this.gender,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(gender == 'MALE' ? Icons.male : Icons.female,
          size: 50.0,
        ),
        Text('$gender',
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ],
    );
  }
}