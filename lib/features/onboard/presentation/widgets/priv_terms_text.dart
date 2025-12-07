import 'package:flutter/material.dart';

class TermsText extends StatelessWidget {
  const TermsText({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme.labelSmall?.copyWith(
      color: theme.colorScheme.onSurfaceVariant.withOpacity(0.6),
    );
    final linkStyle = style?.copyWith(decoration: TextDecoration.underline);

    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: style,
        children: [
          const TextSpan(text: 'By tapping next, you are agreeing to PlantID\n'),
          TextSpan(text: 'Terms of Use', style: linkStyle),
          const TextSpan(text: ' & '),
          TextSpan(text: 'Privacy Policy', style: linkStyle),
          const TextSpan(text: '.'),
        ],
      ),
    );
  }
}