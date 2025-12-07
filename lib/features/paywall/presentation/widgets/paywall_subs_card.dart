import 'package:flutter/material.dart';
import 'package:plant_app/core/constants/helper_constants.dart';
import 'package:plant_app/core/extensions/padding_ext.dart';
import 'package:plant_app/core/extensions/sizedbox_ext.dart';

class SubscriptionOptionCard extends StatelessWidget {
  final bool isSelected;
  final String title;
  final String subtitle;
  final String? badgeText;
  final VoidCallback onTap;

  const SubscriptionOptionCard({
    super.key,
    required this.isSelected,
    required this.title,
    required this.subtitle,
    this.badgeText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final Gradient? backgroundGradient = isSelected
        ? LinearGradient(
            colors: [
              HelperConstants.paywallBg,
              HelperConstants.paywallBg,
              theme.colorScheme.primary.withOpacity(0.1),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: const [0.0, 0.6, 1,],
          )
        : null;

    final Color? backgroundColor = isSelected
        ? null
        : HelperConstants.paywallCardBg;

    final border = isSelected
        ? Border.all(color: theme.colorScheme.primary, width: 2)
        : Border.all(color: theme.colorScheme.onPrimary.withOpacity(0.1));

    return GestureDetector(
      onTap: onTap,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: 16.paddingAll,
            decoration: BoxDecoration(
              color: backgroundColor,
              gradient: backgroundGradient,
              borderRadius: BorderRadius.circular(
                HelperConstants.paywallCardRadius,
              ),
              border: border,
            ),
            child: Row(
              children: [
                Container(
                  height: 24,
                  width: 24,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isSelected
                        ? theme.colorScheme.primary
                        : Colors.transparent,
                    border: Border.all(
                      color: isSelected
                          ? theme.colorScheme.primary
                          : theme.colorScheme.onPrimary.withOpacity(0.4),
                      width: 2,
                    ),
                  ),
                  child: isSelected
                      ? Icon(
                          Icons.circle,
                          size: 10,
                          color: theme.colorScheme.onPrimary,
                        )
                      : null,
                ),

                12.width,

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: theme.textTheme.bodyLarge?.copyWith(
                        color: theme.colorScheme.onPrimary,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    2.height,
                    Text(
                      subtitle,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.onPrimary.withOpacity(0.7),
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
              ],
            ),
          ),

          if (badgeText != null)
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(
                      HelperConstants.paywallCardRadius,
                    ),
                    bottomLeft: Radius.circular(
                      HelperConstants.paywallCardRadius,
                    ),
                  ),
                ),
                child: Text(
                  badgeText!,
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: theme.colorScheme.onPrimary,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
