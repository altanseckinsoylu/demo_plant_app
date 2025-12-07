enum AppRoutesEnum {
  onboarding('/onboarding'),
  paywall('/paywall'),
  home('/home');

  final String routeName;
  const AppRoutesEnum(this.routeName);
}