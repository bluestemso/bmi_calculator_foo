import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {

  final Color? backgroundColor;
  final Widget? cardChild;
  final void Function()? onPress;

  const ReusableCard({
    super.key,
    this.backgroundColor,
    this.cardChild,
    this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: backgroundColor ?? colorScheme.secondaryContainer,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: cardChild,
      ),
    );
  }
}
