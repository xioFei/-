import 'dart:convert';
import 'dart:io';
import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:dio/dio.dart';
import 'package:crypto/crypto.dart';
import 'package:convert/src/hex.dart';

class HttpManager {
  ///一个网络请求框架需要的内容
  ///单例数据
  ///1. get post formdata 方法
  ///2. 请求头和响应头的处理
  ///3. 参数和路径的处理
  ///4. 请求失败和成功的处理
  ///5. 数据的处理

  static final secretKey = 'JvzMQSh5rg3MmkKQF+S9dKGWz3Fqsrkhhmyc65dPr6C0nY3DLd2BGVZN38zmiL8kHPM8qYJ3n583yKmNJnPgq/uCa+rnbK5UiJzbBVaEcGwq343p5NJ+ynVzYqWtJpk+R0ndhC0CmMcxyEXEfsRJSrCJDD9eLle+pA8pw6Ob7Js=';
  static final patient_secretKey = 'Cm1G9h8Ht4Nv+m9O5h+y9rHzKTuIKh0Ph2+ovOGfJxQT6c74nlWo4bIIa8RhpSX3/Fopr8vjLRAd7tMopoI6o9OJ+dw+RX9CKTQfmeqBzFCJw93GTQYe5ZiCxXyzcfiL3t5n51EEUZWqlqhqKjZdzp8cTx0bmkBp/bGL1wHiCubE=';

  // static final host = "https://www.medtion.com/api";
  // static final paitentHost = "https://paitent.medtion.com/api";

  static final paitentHost =  "http://patienttest.medtion.com/dev/api";
  static final host  =  "https://dev.medtion.com/api";

  static HttpManager _instance;
  Dio _dio;
  BaseOptions _baseOptions;

  //单例的处理
  static HttpManager share() {
    if (_instance == null) {
      _instance = HttpManager();
      _instance._init();
    }
    return _instance;
  }

  //初始化数据
  _init() {
    ///初始化Dio需要的参数
    _baseOptions = BaseOptions(
      sendTimeout: 60000,
      receiveTimeout: 30000,
      maxRedirects: 5,
      headers: {},
      baseUrl: host,
      contentType: 'text/json',
    );
    _dio = Dio(_baseOptions);
  }

  ///Get请求
  Future getUrl(String url,
      {options, queryParameters, cancelToken, onReceiveProgress}) async {
    //处理请求设置
    if (options == null) {
      options = Options(headers: {"source": "app"});
    } else {
      options = options.merge(
        headers: {"source": "app"},
      );
    }

    Response response;
    try {
      response = await _dio.get(
        url,
        options: options,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
    } catch (e) {
      if (CancelToken.isCancel(e)) {
        print(e);
        print("这是一个被取消的" + url);
      } else {
        print(e);
        print("这是一个被取消的" + url);
      }
      return null;
    }

    if (response.data is String) {
      return json.decode(response.data);
    }

    if (response.data is Map) {
      return response.data;
    }
    print("response--------");
    print(response.data);
    print(response);
    return response.data;
  }

  ///Post请求
  postUrl(String url,
      {options, queryParameters, cancelToken, onReceiveProgress}) async {
    //处理请求设置
    if (options == null) {
      options = Options(
          headers: {"source": "app"},
          contentType: "application/x-www-form-urlencoded");
    } else {
      options = options.merge(
          headers: {"source": "app"},
          contentType: "application/x-www-form-urlencoded");
    }

    Response response;
    try {
      response = await _dio.post(
        url,
        options: options,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
    } catch (e) {
      if (CancelToken.isCancel(e)) {
        print(e + "这是一个被取消的" + url);
      } else {
        print(e + "这有一个错误 " + url);
      }
      return null;
    }

    if (response.data is String) {
      return json.decode(response.data);
    }
    return response.data;
  }

  ///Post请求上传数据
  postData(String url,
      {options, queryParameters, cancelToken, onReceiveProgress, data}) async {
    //处理请求设置
    if (options == null) {
      options = Options(
          headers: {"source": "app"},
          contentType: "application/x-www-form-urlencoded");
    } else {
      options = options.merge(
          headers: {"source": "app"},
          contentType: "application/x-www-form-urlencoded");
    }

    _dio.post(
      url,
      data: data,
      options: options,
      queryParameters: queryParameters,
      cancelToken: cancelToken,
      onReceiveProgress: onReceiveProgress,
    );

    Response response;
    try {
      response = await _dio.post(
        url,
        data: data,
        options: options,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
    } catch (e) {
      if (CancelToken.isCancel(e)) {
        print(e + "这是一个被取消的" + url);
      } else {
        print(e + "这有一个错误 " + url);
      }
      return null;
    }
    if (response.data is String) {
      return json.decode(response.data);
    }
    return response.data;
  }

  static String calcPostUrl(
      String url, Map<String, String> query, Map<String, String> params) {
    int timeStamp = DateTime.now().millisecondsSinceEpoch;
    timeStamp = timeStamp ~/ 1000;
    query['timestamp'] = timeStamp.toString();
    Map<String, String> all = Map.from(query);
    all.addAll(params);
    String kvs = getJoinString(all, "");
    String sign = calcSign("POST", url, kvs);
    query["sign"] = sign;
    return url + "?" + getJoinString(query, "&");
  }

  static String calcGetUrl(
      String url, Map<String, String> query, Map<String, String> params) {
    int timeStamp = DateTime.now().millisecondsSinceEpoch;
    timeStamp = timeStamp ~/ 1000;
    query['timestamp'] = timeStamp.toString();
    Map<String, String> all = Map.from(query);
    all.addAll(params);
    all['timestamp'] = timeStamp.toString();
    String kvs = getJoinString(all, "");
    String sign = calcSign("GET", url, kvs);
    query["sign"] = sign;
    return url + "?" + getJoinString(query, "&");
  }

  static String calcSign(String method, String url, String param) {
    final keyString = url.contains("paitent") ? secretKey : patient_secretKey;
    String source = method + url + param + keyString;
    String urlCode =
        Uri.encodeComponent(source); //URLEncoder.encode(source, "utf-8");
    urlCode = urlCode.replaceAll("\\+", "%20");
    urlCode = urlCode.replaceAll("\\*", "%2A");
    return getMD5Str(urlCode);
  }

  static String getMD5Str(String source) {
    print(source);
    var content = new Utf8Encoder().convert(source);
    var digest = md5.convert(content);
    // 这里其实就是 digest.toString()
    print("hex------");
    print(hex.encode(digest.bytes));
    return hex.encode(digest.bytes);
  }

  static String getJoinString(Map<String, String> params, String sep) {
    List<String> arr = List();
    params.forEach((k, v) {
      arr.add(k + "=" + v);
    });
    arr.sort();
    print(arr);
    return arr.join(sep);
  }
}
