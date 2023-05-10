import 'package:etrade_actions/features/shop/screens/product_reviews/widgets/t_progress_indicator.dart';
import 'package:flutter/material.dart';

class TOverallIndicator extends StatelessWidget {
  const TOverallIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 3,
            child:
                Text('4.8', style: Theme.of(context).textTheme.displayLarge)),
        const Expanded(
          flex: 7,
          child: Column(
            children: [
              TProgressIndicator(text: '5', value: 1.0),
              TProgressIndicator(text: '4', value: 0.8),
              TProgressIndicator(text: '3', value: 0.6),
              TProgressIndicator(text: '2', value: 0.4),
              TProgressIndicator(text: '1', value: 0.2),
            ],
          ),
        )
      ],
    );
  }
}
