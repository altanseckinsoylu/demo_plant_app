import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:plant_app/data/models/onboarding_model.dart';

part 'onboard_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit()
      : super(const OnboardingState(
          currentPageIndex: 0,
          pages: [
            OnboardingModel(
              imagePath: 'assets/images/onboarding_images/onboarding_1.png',
              title: [
                TitleFragment('Welcome to '),
                TitleFragment('PlantApp', isBold: true),
              ],
              subtitle: 'Identify more than 3000+ plants and 88% accuracy.',
            ),
            OnboardingModel(
              imagePath: 'assets/images/onboarding_images/onboarding_2.png',
              title: [
                TitleFragment('Take a photo to '),
                TitleFragment('identify', isBold: true),
                TitleFragment('\nthe plant!'),
              ],
            ),
            OnboardingModel(
              imagePath: 'assets/images/onboarding_images/onboarding_3.png',
              title: [
                TitleFragment('Get plant '),
                TitleFragment('care guides', isBold: true),
              ],
            ),
          ],
        ));

  void onPageChanged(int index) {
    emit(state.copyWith(currentPageIndex: index));
  }
}