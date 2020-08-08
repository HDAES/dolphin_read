import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:dolphin_read/common/values/values.dart';
import 'package:dolphin_read/common/widgets/toast.dart';
import 'package:dolphin_read/global.dart';
import 'package:flutter/material.dart';

class HttpUtil {
  static HttpUtil _instance = HttpUtil._internal();
  factory HttpUtil() => _instance;

  static Dio dio;

  HttpUtil._internal() {
    BaseOptions options = new BaseOptions(
      baseUrl: SERVER_LOCAL_API_URL,
      connectTimeout: 10000,
      receiveTimeout: 5000,
      headers: {},
      contentType: 'application/json;charset=utf-8',
      responseType: ResponseType.json,
    );
    //加载配置
    dio = new Dio(options);
    // 添加拦截器
    dio.interceptors.add(DioCacheManager(CacheConfig(baseUrl: SERVER_API_URL)).interceptor);
    dio.interceptors.add(InterceptorsWrapper(onRequest: (RequestOptions options) {
      return options; //continue
    }, onResponse: (Response response) {
      return response; // continue
    }, onError: (DioError e) {
      ErrorEntity eInfo = createErrorEntity(e);
        Toast.show(eInfo.message);
        // 错误交互处理
        var context = e.request.extra["context"];
        if (context != null) {
          switch (eInfo.code) {
            case 301: // 没有权限 重新登录
              print('去登录');
              break;
            default:
          }
        }
        return eInfo;
    }));
  }

  /// 添加头部信息
  Map<String, dynamic> getAuthorizationHeader() {
    var headers;
    String token = Global.profile?.data?.authorization;
    if (token != null) {
      headers = {
        'Authorization': 'Bearer $token',
      };
    }
    return headers;
  }

  
  Future get(
    String path,{
      @required BuildContext context,
      dynamic params,
      Options options,
      bool noCache = true,
      bool refresh = false,
    }
  ) async {
    Options requestOptions = options ?? Options();
    requestOptions = requestOptions.merge(extra: {
      "context": context,
    });
    
    Map<String, dynamic> _authorization = getAuthorizationHeader();
    if (_authorization != null) {
      requestOptions = requestOptions.merge(headers: _authorization);
    }
    // if(refresh){
    //   _dioCacheManager.delete(path);
    // }
    var response = await dio.get(path,
        queryParameters: params,
        options: buildCacheOptions(Duration(days: 7),options:requestOptions,forceRefresh:refresh)
      );
    return response.data;
  }


  Future post(
    String path,{
      @required BuildContext context,
      dynamic params,
      Options options,
      bool noCache = true,
      bool refresh = false,
      bool isFormData = false
    }
  ) async {
    Options requestOptions = options ?? Options();
    requestOptions = requestOptions.merge(extra: {
      "context": context,
    });
    
    Map<String, dynamic> _authorization = getAuthorizationHeader();
    if (_authorization != null) {
      requestOptions = requestOptions.merge(headers: _authorization);
    }
    // if(refresh){
    //   _dioCacheManager.delete(path);
    // }

    
    var response = await dio.post(path,
        data: isFormData?FormData.fromMap(params):params,
        options: buildCacheOptions(Duration(days: 7),subKey:params.toString(),options:requestOptions,forceRefresh:refresh)
      );
    return response.data;
  }


  
}

//错误处理
ErrorEntity createErrorEntity(DioError error) {
  switch (error.type) {
    case DioErrorType.CANCEL:
      {
        return ErrorEntity(code: -1, message: "请求取消");
      }
      break;
    case DioErrorType.CONNECT_TIMEOUT:
      {
        return ErrorEntity(code: -1, message: "连接超时");
      }
      break;
    case DioErrorType.SEND_TIMEOUT:
      {
        return ErrorEntity(code: -1, message: "请求超时");
      }
      break;
    case DioErrorType.RECEIVE_TIMEOUT:
      {
        return ErrorEntity(code: -1, message: "响应超时");
      }
      break;
    case DioErrorType.RESPONSE:
      {
        try {
          int errCode = error.response.statusCode;
          print(errCode);
          // String errMsg = error.response.statusMessage;
          // return ErrorEntity(code: errCode, message: errMsg);
          switch (errCode) {
            case 400:
              {
                return ErrorEntity(code: errCode, message: "请求语法错误");
              }
              break;
            case 401:
              {
                return ErrorEntity(code: errCode, message: "没有权限");
              }
              break;
            case 403:
              {
                return ErrorEntity(code: errCode, message: "服务器拒绝执行");
              }
              break;
            case 404:
              {
                return ErrorEntity(code: errCode, message: "无法连接服务器");
              }
              break;
            case 405:
              {
                return ErrorEntity(code: errCode, message: "请求方法被禁止");
              }
              break;
            case 500:
              {
                return ErrorEntity(code: errCode, message: "服务器内部错误");
              }
              break;
            case 502:
              {
                return ErrorEntity(code: errCode, message: "无效的请求");
              }
              break;
            case 503:
              {
                return ErrorEntity(code: errCode, message: "服务器挂了");
              }
              break;
            case 505:
              {
                return ErrorEntity(code: errCode, message: "不支持HTTP协议请求");
              }
              break;
            default:
              {
                // return ErrorEntity(code: errCode, message: "未知错误");
                return ErrorEntity(
                    code: errCode, message: error.response.statusMessage);
              }
          }
        } on Exception catch (_) {
          return ErrorEntity(code: -1, message: "未知错误");
        }
      }
      break;
    default:
      {
        return ErrorEntity(code: -1, message: error.message);
      }
  }
}

// 异常处理
class ErrorEntity implements Exception {
  int code;
  String message;
  ErrorEntity({this.code, this.message});

  String toString() {
    if (message == null) return "Exception";
    return "Exception: code $code, $message";
  }
}