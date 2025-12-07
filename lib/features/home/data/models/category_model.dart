import 'package:json_annotation/json_annotation.dart';

part 'category_model.g.dart';

@JsonSerializable()
class CategoryResponse {
  final List<CategoryModel> data;
  final MetaModel? meta;

  CategoryResponse({
    required this.data,
    this.meta,
  });

  factory CategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoryResponseFromJson(json);
}

@JsonSerializable()
class CategoryModel {
  final int id;
  final String name;
  final String title;
  final int rank;
  final CategoryImage? image;

  CategoryModel({
    required this.id,
    required this.name,
    required this.title,
    required this.rank,
    this.image,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);
}

@JsonSerializable()
class CategoryImage {
  final int id;
  final String? name;
  final String? alternativeText;
  final String? caption;
  final String url;

  CategoryImage({
    required this.id,
    this.name,
    this.alternativeText,
    this.caption,
    required this.url,
  });

  factory CategoryImage.fromJson(Map<String, dynamic> json) =>
      _$CategoryImageFromJson(json);
}

@JsonSerializable()
class MetaModel {
  final PaginationModel? pagination;

  MetaModel({this.pagination});

  factory MetaModel.fromJson(Map<String, dynamic> json) =>
      _$MetaModelFromJson(json);
}

@JsonSerializable()
class PaginationModel {
  final int page;
  final int pageSize;
  final int pageCount;
  final int total;

  PaginationModel({
    required this.page,
    required this.pageSize,
    required this.pageCount,
    required this.total,
  });

  factory PaginationModel.fromJson(Map<String, dynamic> json) =>
      _$PaginationModelFromJson(json);
}