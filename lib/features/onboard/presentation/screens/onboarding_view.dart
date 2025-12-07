import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:plant_app/core/constants/helper_constants.dart';
import 'package:plant_app/core/routes/app_router.dart';
import 'package:plant_app/core/widgets/buttons/main_button.dart';
import 'package:plant_app/data/models/onboarding_model.dart';

@RoutePage()
class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnboardingModel> _pages = [
    const OnboardingModel(
      imagePath: 'assets/images/onboarding_images/onboarding_1.png',
      title: [
        TitleFragment('Welcome to '),
        TitleFragment('PlantApp', isBold: true),
      ],
      subtitle: 'Identify more than 3000+ plants and 88% accuracy.',
    ),
    const OnboardingModel(
      imagePath: 'assets/images/onboarding_images/onboarding_2.png',
      title: [
        TitleFragment('Take a photo to '),
        TitleFragment('identify', isBold: true),
        TitleFragment('\nthe plant!'),
      ],
    ),
    const OnboardingModel(
      imagePath: 'assets/images/onboarding_images/onboarding_3.png',
      title: [
        TitleFragment('Get plant '),
        TitleFragment('care guides', isBold: true),
      ],
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (_currentPage == _pages.length - 1) {
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
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: _pages.length,
                onPageChanged: (int index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal:
                          MediaQuery.of(context).size.width *
                          HelperConstants.horizontalPaddingRatio,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),

                        RichText(
                          textAlign: TextAlign.start,
                          text: TextSpan(
                            style: Theme.of(context).textTheme.displaySmall,
                            children: _pages[index].title.map((segment) {
                              return TextSpan(
                                text: segment.text,
                                style: segment.isBold
                                    ? const TextStyle(
                                        fontWeight: FontWeight.w800,
                                      )
                                    : const TextStyle(
                                        fontWeight: FontWeight.w400,
                                      ),
                              );
                            }).toList(),
                          ),
                        ),

                        if (_pages[index].subtitle != null) ...[
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Text(
                            _pages[index].subtitle!,
                            textAlign: TextAlign.start,
                            style: Theme.of(context).textTheme.bodyLarge
                                ?.copyWith(
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.onSurfaceVariant,
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
                                _pages[index].imagePath,
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
                    text: _currentPage == 0 ? 'Get Started' : 'Continue',
                    onPressed: _nextPage,
                  ),

                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),

                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                    child: Center(
                      child: _buildBottomContent(
                        Theme.of(context),
                        MediaQuery.of(context).size,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomContent(ThemeData theme, Size size) {
    if (_currentPage == 0) {
      return _buildTermsText(theme);
    }

    if (_currentPage == 1 || _currentPage == 2) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(3, (index) {
          bool isActive = (index == (_currentPage - 1));
          return _buildDot(isActive: isActive, size: size);
        }),
      );
    }

    return const SizedBox.shrink();
  }

  Widget _buildTermsText(ThemeData theme) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: theme.textTheme.labelSmall?.copyWith(
          color: theme.colorScheme.onSurfaceVariant.withOpacity(0.6),
        ),
        children: [
          const TextSpan(
            text: 'By tapping next, you are agreeing to PlantID\n',
          ),
          TextSpan(
            text: 'Terms of Use',
            style: theme.textTheme.labelSmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant.withOpacity(0.6),
              decoration: TextDecoration.underline,
            ),
          ),
          const TextSpan(text: ' & '),
          TextSpan(
            text: 'Privacy Policy',
            style: theme.textTheme.labelSmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant.withOpacity(0.6),
              decoration: TextDecoration.underline,
            ),
          ),
          const TextSpan(text: '.'),
        ],
      ),
    );
  }

  Widget _buildDot({required bool isActive, required Size size}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      height: size.width * 0.025,
      width: isActive ? size.width * 0.025 : size.width * 0.015,
      decoration: BoxDecoration(
        color: isActive ? Colors.black : Colors.grey.withOpacity(0.5),
        shape: BoxShape.circle,
      ),
    );
  }
}
