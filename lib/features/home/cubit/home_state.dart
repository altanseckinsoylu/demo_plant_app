part of 'home_cubit.dart';

enum HomeStatus { initial, loading, success, failure }

class HomeState extends Equatable {
  final HomeStatus status;
  final List<QuestionModel> questions;
  final List<CategoryModel> categories;
  final String? errorMessage;

  const HomeState({
    required this.status,
    required this.questions,
    required this.categories,
    this.errorMessage,
  });

  HomeState copyWith({
    HomeStatus? status,
    List<QuestionModel>? questions,
    List<CategoryModel>? categories,
    String? errorMessage,
  }) {
    return HomeState(
      status: status ?? this.status,
      questions: questions ?? this.questions,
      categories: categories ?? this.categories,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, questions, categories, errorMessage];
}