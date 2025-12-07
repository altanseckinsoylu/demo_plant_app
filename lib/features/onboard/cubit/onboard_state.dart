part of 'onboard_cubit.dart';


class OnboardingState extends Equatable {
  final int currentPageIndex;
  final List<OnboardingModel> pages;

  const OnboardingState({
    required this.currentPageIndex,
    required this.pages,
  });

  bool get isLastPage => currentPageIndex == pages.length - 1;
  bool get isFirstPage => currentPageIndex == 0;

  OnboardingState copyWith({
    int? currentPageIndex,
    List<OnboardingModel>? pages,
  }) {
    return OnboardingState(
      currentPageIndex: currentPageIndex ?? this.currentPageIndex,
      pages: pages ?? this.pages,
    );
  }

  @override
  List<Object?> get props => [currentPageIndex, pages];
}