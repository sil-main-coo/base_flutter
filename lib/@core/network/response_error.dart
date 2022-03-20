class ResponseError {
  String? message;
  int? statusCode;
  String? errorCode;

  ResponseError(this.message, this.statusCode, this.errorCode);

  ResponseError.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    statusCode = json['statusCode'];
    errorCode = json['errorCode'];
  }

  Map<String, dynamic> toJson() => {
        'message': message,
        'statusCode': statusCode,
        'errorCode': errorCode,
      };
}
