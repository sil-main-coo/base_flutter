class CommonResponse {
  String? errorDetail;
  int? httpStatusCode;
  String? message;
  String? messageCode;
  bool? success;
  int? total;

  CommonResponse.fromJson(Map<String, dynamic> json) {
    errorDetail = json['errorDetail'];
    httpStatusCode = json['httpStatusCode'] ?? 0;
    message = json['message'];
    messageCode = json['messageCode'] ?? '0';
    success = json['success'] ?? false;
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['errorDetail'] = errorDetail;
    data['httpStatusCode'] = httpStatusCode;
    data['message'] = message;
    data['messageCode'] = messageCode;
    data['success'] = success;
    data['total'] = total;
    return data;
  }
}
