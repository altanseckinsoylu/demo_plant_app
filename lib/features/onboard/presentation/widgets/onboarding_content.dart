import 'package:flutter/material.dart';
import 'package:plant_app/core/constants/helper_constants.dart';
import 'package:plant_app/data/models/onboarding_model.dart';

class OnboardingContent extends StatelessWidget {
  final OnboardingModel page;

  const OnboardingContent({super.key, required this.page});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width *
            HelperConstants.horizontalPaddingRatio,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          RichText(
            textAlign: TextAlign.start,
            text: TextSpan(
              style: Theme.of(context).textTheme.displaySmall,
              children: page.title.map((segment) {
                return TextSpan(
                  text: segment.text,
                  style: segment.isBold
                      ? const TextStyle(fontWeight: FontWeight.w800)
                      : const TextStyle(fontWeight: FontWeight.w400),
                );
              }).toList(),
            ),
          ),
          if (page.subtitle != null) ...[
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            Text(
              page.subtitle!,
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                    fontWeight: FontWeight.w300,
                  ),
            ),
          ],
          const Spacer(),
          Center(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.61,
              width: double.infinity,
              child: Container(
                color: Colors.white,
                child: Image.asset(
                  page.imagePath,
                  fit: BoxFit.fitWidth,
                  errorBuilder: (c, o, s) => Icon(
                    Icons.local_florist,
                    size: MediaQuery.of(context).size.width * 0.5,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}