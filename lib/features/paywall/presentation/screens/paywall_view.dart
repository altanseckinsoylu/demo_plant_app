import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_app/core/constants/helper_constants.dart';
import 'package:plant_app/core/extensions/padding_ext.dart';
import 'package:plant_app/core/extensions/sizedbox_ext.dart';
import 'package:plant_app/core/init/di_container.dart';
import 'package:plant_app/core/routes/app_router.dart';
import 'package:plant_app/core/widgets/buttons/main_button.dart';
import 'package:plant_app/features/paywall/cubit/paywall_cubit.dart';
import 'package:plant_app/features/paywall/presentation/widgets/paywall_feature_card.dart';
import 'package:plant_app/features/paywall/presentation/widgets/paywall_subs_card.dart';

@RoutePage()
class PaywallPage extends StatelessWidget {
  const PaywallPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<PaywallCubit>(),
      child: const _PaywallView(),
    );
  }
}

class _PaywallView extends StatefulWidget {
  const _PaywallView();

  @override
  State<_PaywallView> createState() => _PaywallViewState();
}

class _PaywallViewState extends State<_PaywallView> {
  final List<Map<String, dynamic>> _features = [
    {
      'icon': Icons.center_focus_strong,
      'title': 'Unlimited',
      'subtitle': 'Plant Identify',
    },
    {'icon': Icons.speed, 'title': 'Faster', 'subtitle': 'Process'},
    {'icon': Icons.eco, 'title': 'Detailed', 'subtitle': 'Plant Care'},
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: HelperConstants.paywallBg,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/images/onboarding_images/paywall.png',
              fit: BoxFit.fitWidth,
            ),
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: size.width * HelperConstants.horizontalPaddingRatio,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: HelperConstants
                          .paywallCloseButtonPadding
                          .paddingRight,
                      child: IconButton(
                        onPressed: () {
                          context.router.replaceAll([const HomeRoute()]);
                        },
                        icon: Container(
                          padding: HelperConstants
                              .paywallCloseIconContainerPadding
                              .paddingAll,
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.4),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.close),
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  RichText(
                    text: TextSpan(
                      style: theme.textTheme.displaySmall?.copyWith(
                        color: theme.colorScheme.onPrimary,
                      ),
                      children: const [
                        TextSpan(
                          text: 'PlantApp ',
                          style: TextStyle(fontWeight: FontWeight.w800),
                        ),
                        TextSpan(
                          text: 'Premium',
                          style: TextStyle(fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                  ),
                  HelperConstants.paywallTitleSubtitleSpacing.height,
                  Text(
                    'Unlock All Features',
                    style: theme.textTheme.headlineSmall?.copyWith(
                      color: theme.colorScheme.onPrimary.withOpacity(0.7),
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                    ),
                  ),
                  HelperConstants.paywallFeaturesGap.height,
                  SizedBox(
                    height: size.height * 0.15,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      clipBehavior: Clip.none,
                      itemCount: _features.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: index != _features.length - 1
                              ? HelperConstants.paywallCardGap.paddingRight
                              : EdgeInsets.zero,
                          child: SizedBox(
                            width: size.width * 0.42,
                            child: PaywallFeatureCard(
                              icon: _features[index]['icon'],
                              title: _features[index]['title'],
                              subtitle: _features[index]['subtitle'],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  20.height,

                  BlocBuilder<PaywallCubit, PaywallState>(
                    builder: (context, state) {
                      return Column(
                        children: [
                          SubscriptionOptionCard(
                            isSelected: state.selectedPlanIndex == 0,
                            title: '1 Month',
                            subtitle: '\$2.99/month, auto renewable',
                            onTap: () {
                              context.read<PaywallCubit>().selectPlan(0);
                            },
                          ),
                          10.height,
                          SubscriptionOptionCard(
                            isSelected: state.selectedPlanIndex == 1,
                            title: '1 Year',
                            subtitle: 'First 3 days free, then \$529.99/year',
                            badgeText: 'Save 50%',
                            onTap: () {
                              context.read<PaywallCubit>().selectPlan(1);
                            },
                          ),
                        ],
                      );
                    },
                  ),

                  24.height,
                  MainButton(text: 'Try Free for 3 days', onPressed: () {}),
                  12.height,
                  Text(
                    'After the 3-day free trial period you’ll be charged ₺274.99 per year unless you cancel before the trial expires. Yearly Subscription is Auto-Renewable',
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onPrimary.withOpacity(0.54),
                      fontSize: 10,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  10.height,
                  Center(
                    child: Text(
                      'Terms  •  Privacy  •  Restore',
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: theme.colorScheme.onPrimary.withOpacity(0.54),
                        fontSize: 11,
                      ),
                    ),
                  ),
                  10.height,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
