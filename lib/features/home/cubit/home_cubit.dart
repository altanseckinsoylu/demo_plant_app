import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_app/features/home/data/models/category_model.dart';
import 'package:plant_app/features/home/data/models/question_model.dart';
import 'package:plant_app/features/home/data/repositories/home_repository.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepository _repository;

  HomeCubit(this._repository)
      : super(const HomeState(
          status: HomeStatus.initial,
          questions: [],
          categories: [],
        ));

  Future<void> getData() async {
    emit(state.copyWith(status: HomeStatus.loading));

    try {
      final questionsFuture = _repository.getQuestions();
      final categoriesFuture = _repository.getCategories();

      final questions = await questionsFuture;
      final categories = await categoriesFuture;

      emit(state.copyWith(
        status: HomeStatus.success,
        questions: questions,
        categories: categories,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: HomeStatus.failure,
        errorMessage: e.toString(),
      ));
    }
  }
}