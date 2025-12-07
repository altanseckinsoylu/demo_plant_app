import 'dart:convert';
import 'package:plant_app/core/constants/enums/api_paths_enum.dart';

import '../../../../core/network/dio_client.dart';
import '../models/category_model.dart';
import '../models/question_model.dart';

class HomeRepository {
  final DioClient _dioClient;

  HomeRepository(this._dioClient);

  Future<List<QuestionModel>> getQuestions() async {
    try {
      final response = await _dioClient.get(ApiPathsEnum.getQuestions.pathName);

      dynamic data = response.data;
      if (data is String) {
        data = jsonDecode(data);
      }

      final List listData = data as List;
      return listData.map((e) => QuestionModel.fromJson(e)).toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<List<CategoryModel>> getCategories() async {
    try {
      final response = await _dioClient.get(ApiPathsEnum.getCategories.pathName);

      dynamic data = response.data;
      if (data is String) {
        data = jsonDecode(data);
      }

      final categoryResponse = CategoryResponse.fromJson(data);
      return categoryResponse.data;
    } catch (e) {
      rethrow;
    }
  }
}
