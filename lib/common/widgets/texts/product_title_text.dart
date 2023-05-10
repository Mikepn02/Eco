import 'package:flutter/material.dart';

class TProductTitleText extends StatelessWidget {
  const TProductTitleText({super.key, required this.title, this.fontSize = 16, this.color = Colors.black, this.maxLines = 1, this.overflow, this.smallSize = false});
  final String title;
  final double fontSize;
  final Color color;
  final int maxLines;
  final TextOverflow? overflow;
  final bool smallSize;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      maxLines: maxLines,
      overflow: overflow,
      style: smallSize ? Theme.of(context).textTheme.titleMedium!.apply(color: color) : Theme.of(context).textTheme.titleSmall!.apply(color: color),  
    );
  }
}