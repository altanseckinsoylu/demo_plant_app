import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_app/core/constants/helper_constants.dart';
import 'package:plant_app/core/init/di_container.dart';
import 'package:plant_app/core/routes/app_router.dart';
import 'package:plant_app/core/widgets/buttons/main_button.dart';
import 'package:plant_app/features/onboard/cubit/onboard_cubit.dart';
import 'package:plant_app/features/onboard/presentation/widgets/dot_indicator.dart';
import 'package:plant_app/features/onboard/presentation/widgets/onboarding_content.dart';
import 'package:plant_app/features/onboard/presentation/widgets/priv_terms_text.dart';

@RoutePage()
class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<OnboardingCubit>(),
      child: const _OnboardingView(),
    );
  }
}

class _OnboardingView extends StatefulWidget {
  const _OnboardingView();

  @override
  State<_OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<_OnboardingView> {
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage(BuildContext context, OnboardingState state) {
    if (state.isLastPage) {
      context.router.push(const PaywallRoute());
    } else {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: BlocBuilder<OnboardingCubit, OnboardingState>(
          builder: (context, state) {
            return Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: state.pages.length,
                    onPageChanged: (index) {
                      context.read<OnboardingCubit>().onPageChanged(index);
                    },
                    itemBuilder: (context, index) {
                      return OnboardingContent(page: state.pages[index]);
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal:
                        MediaQuery.of(context).size.width *
                        HelperConstants.horizontalPaddingRatio,
                  ),
                  child: Column(
                    children: [
                      MainButton(
                        text: state.isFirstPage ? 'Get Started' : 'Continue',
                        onPressed: () => _nextPage(context, state),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                        child: Center(
                          child: state.isFirstPage
                              ? const TermsText()
                              : Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: List.generate(
                                    state.pages.length,
                                    (index) => DotIndicator(
                                      isActive: index == state.currentPageIndex,
                                    ),
                                  ),
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
