import 'package:flutter/material.dart';
import 'package:plant_app/core/constants/helper_constants.dart';
import 'package:plant_app/core/extensions/padding_ext.dart';
import 'package:plant_app/core/extensions/sizedbox_ext.dart';

class PaywallFeatureCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const PaywallFeatureCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Container(
      padding: HelperConstants.paywallCardInnerPadding.paddingAll,
      decoration: BoxDecoration(
        color: HelperConstants.paywallCardBg,
        borderRadius: BorderRadius.circular(HelperConstants.paywallCardRadius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: 6.paddingAll,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.5),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              icon, 
              size: 24,
              color: theme.iconTheme.color,
            ),
          ),

          10.height,

          Text(
            title,
            style: theme.textTheme.titleSmall?.copyWith(
              color: theme.colorScheme.onPrimary,
              fontWeight: FontWeight.bold,
              fontSize: 17
            ),
          ),

          4.height,

          Text(
            subtitle,
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onPrimary.withOpacity(0.7),
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}