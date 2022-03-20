import '../common_response.dart';

class SignInRequest {
  String? userName;
  String? password;

  SignInRequest({this.userName, this.password});

  SignInRequest.fromJson(Map<String, dynamic> json) {
    userName = json['userName'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userName'] = userName;
    data['password'] = password;
    return data;
  }
}

class SignInResponse extends CommonResponse {
  String? accessToken;
  String? refreshToken;
  int? id;
  String? fullName;

  SignInResponse.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    accessToken = json['accessToken'];
    refreshToken = json['refreshToken'];
    id = json['id'];
    fullName = json['fullName'];
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['accessToken'] = accessToken;
    data['refreshToken'] = refreshToken;
    data['id'] = id;
    data['fullName'] = fullName;
    return data;
  }
}
