enum ApiPathsEnum {
  getQuestions('/getQuestions'),
  getCategories('/getCategories');

  final String pathName;
  const ApiPathsEnum(this.pathName);
}