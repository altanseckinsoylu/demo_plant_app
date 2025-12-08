part of 'paywall_cubit.dart';

class PaywallState extends Equatable {
  final int selectedPlanIndex;

  const PaywallState({
    required this.selectedPlanIndex,
  });

  PaywallState copyWith({
    int? selectedPlanIndex,
  }) {
    return PaywallState(
      selectedPlanIndex: selectedPlanIndex ?? this.selectedPlanIndex,
    );
  }

  @override
  List<Object> get props => [selectedPlanIndex];
}