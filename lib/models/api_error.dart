import 'package:dio/dio.dart';

class ApiError extends Error{
  int code;
  String msg;
  String data;

  ApiError([Response res]){
    this.code = res.statusCode;
    this.msg = res.statusMessage;
    this.data = res.data;
  }

  ApiError.error(int code, String msg, {String data}){
    this.code = code;
    this.msg = msg;
    this.data = data;
  }
}