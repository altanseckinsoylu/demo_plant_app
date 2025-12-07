class OnboardingModel {
  final String imagePath;
  final List<TitleFragment> title;
  final String? subtitle;

  const OnboardingModel({
    required this.imagePath,
    required this.title,
    this.subtitle,
  });
}

class TitleFragment {
  final String text;
  final bool isBold;

  const TitleFragment(this.text, {this.isBold = false});
}