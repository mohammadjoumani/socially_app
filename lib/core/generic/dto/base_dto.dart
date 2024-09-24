abstract class BaseDto<T> {
  T fromJson(Map<String, dynamic> json);

  List<T> fromJsonList(dynamic jsonList);

  Map<String, dynamic> toJson();
}
