import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'paywall_state.dart';

class PaywallCubit extends Cubit<PaywallState> {
  PaywallCubit() : super(const PaywallState(selectedPlanIndex: 1));

  void selectPlan(int index) {
    emit(state.copyWith(selectedPlanIndex: index));
  }
}