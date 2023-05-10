import 'package:flutter/material.dart';

class TSectionHeading extends StatelessWidget {
  const TSectionHeading(
      {super.key,
      this.textColor,
      this.showActionsButton = true,
      required this.title,
      this.buttonTitle = 'View all',
      this.onButtonPressed});

  final Color? textColor;
  final bool showActionsButton;
  final String title, buttonTitle;
  final VoidCallback? onButtonPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .apply(color: textColor),
          overflow: TextOverflow.ellipsis,
        ),
        if (showActionsButton)
          TextButton(onPressed: onButtonPressed, child: Text(buttonTitle))
      ],
    );
  }
}
