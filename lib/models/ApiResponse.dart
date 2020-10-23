import 'package:dio/dio.dart';

class ApiResponse {
  int code;
  String msg;
  var data;
  bool isSuccess;
  ApiResponse({this.code, this.msg, this.data});
  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    if(json == null) {
      return ApiResponse(code:-1, msg:'请求失败');
    }
    if (json.containsKey('status')) {
      if (json['status'] != "0") {
        return ApiResponse(code: int.parse(json['status']), msg: json['message'], data: null);
      }
    }
    if(json['code'] != 0 && json['code'] != 1 && json['code'] != 200) {
      return ApiResponse(code: json['code'], msg: json['msg'], data: null);
    }
    if (json.containsKey('list')) {
      return ApiResponse(code: json['code'], msg: json['msg'], data: json['list']);
    }

    var d;
    if (json['data'] is Map && json['data'].containsKey('rows')) {
      d = json['data']['rows'];
    }
    else {
      d = json['data'];
    }
    return ApiResponse(code: json['code'], msg: json['msg'], data: d);
  }


  Map<String, dynamic> toJson() =>
      {
        'id': code,
        'name': msg,
        'list': data,
      };
}