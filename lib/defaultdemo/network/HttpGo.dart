import 'dart:io';

import 'package:dio/dio.dart';

class HttpGo {
  static final StringGET = "get";

  static final StringPOST = "post";

  static final StringDATA = "data";

  static final StringCODE = "errorCode";

  Dio dio;

  static HttpGo _instance;

  BaseOptions options;

  static HttpGogetInstance() {
    if (_instance == null) {
      _instance = HttpGo();
    }

    return _instance;
  }

  HttpGo() {
//BaseOptions、Options、RequestOptions 都可以配置参数，优先级别依次递增，且可以根据优先级别覆盖参数

    options = new BaseOptions(
//请求基地址,可以包含子路径

      baseUrl: "http://192.168.5.6:8085",

      //Http请求头

      headers: {'platform': 'android', 'version': 11.0},

      //连接服务器超时时间，单位是毫秒.

      connectTimeout: 5000,
      //响应流上前后两次接受到数据的间隔，单位为毫秒。
      receiveTimeout: 100000,

      //请求的Content-Type，默认值是[ContentType.json]. 也可以用ContentType.parse("application/x-www-form-urlencoded")

      contentType: ContentType.json.toString(),
      //表示期望以那种格式(方式)接受响应数据。接受三种类型 `json`, `stream`, `plain`, `bytes`. 默认值是`json`,
      responseType: ResponseType.plain,
    );

    dio = Dio(options);

    //cookie管理

//    dio.interceptors.add(CookieManager(CookieJar()));

    //添加拦截器

    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options) {
      print("method = ${options.method.toString()}");
      print("url = ${options.uri.toString()}");
      print("headers = ${options.headers}");
      print("params = ${options.queryParameters}");
      print("content_type = ${options.contentType}");

      return options;
    }, onResponse: (Response response) {
      print("响应之前");

      return response;
    }, onError: (DioError e) {
      print("错误之前");

      return e;
    }));
  }

  /*

     * get请求*/

  get(url, {data, options, cancelToken}) async {
    Response response;

    try {
      response = await dio.get(url,
          queryParameters: data, options: options, cancelToken: cancelToken);

      print('get success---------${response.statusCode}');

      print('get success---------${response.data}');

//   response.data; 响应体

//   response.headers; 响应头

//   response.request; 请求体

//   response.statusCode; 状态码

    } on DioError catch (e) {
      print('get error---------$e');
      formatError(e);
    }
    return response.data;
  }

  /*

     * post请求*/

  post(url, {data, options, cancelToken}) async {
    Response response;

    try {
      response = await dio.post(url,
          queryParameters: data, options: options, cancelToken: cancelToken);

      print('post success---------${response.data}');
    } on DioError catch (e) {
      print('post error---------$e');

      formatError(e);
    }

    return response.data;
  }

  /*

     * 下载文件*/

  downloadFile(urlPath, savePath) async {
    Response response;

    try {
      response = await dio.download(urlPath, savePath,
          onReceiveProgress: (int count, int total) {
//进度

        print("$count $total");
      });

      print('downloadFile success---------${response.data}');
    } on DioError catch (e) {
      print('downloadFile error---------$e');

      formatError(e);
    }

    return response.data;
  }

  /*

     * error统一处理*/

  void formatError(DioError e) {
    if (e.type == DioErrorType.CONNECT_TIMEOUT) {
// It occurs when url is opened timeout.

      print("连接超时");
    } else if (e.type == DioErrorType.SEND_TIMEOUT) {
// It occurs when url is sent timeout.

      print("请求超时");
    } else if (e.type == DioErrorType.RECEIVE_TIMEOUT) {
//It occurs when receiving timeout

      print("响应超时");
    } else if (e.type == DioErrorType.RESPONSE) {
// When the server response, but with a incorrect status, such as 404, 503...

      print("出现异常");
    } else if (e.type == DioErrorType.CANCEL) {
// When the request is cancelled, dio will throw a error with this type.

      print("请求取消");
    } else {
//DEFAULT Default error type, Some other Error. In this case, you can read the DioError.error if it is not null.

      print("未知错误");
    }
  }

  /*

     * 取消请求*

     * 同一个cancel token 可以用于多个请求，当一个cancel token取消时，所有使用该cancel token的请求都会被取消。 * 所以参数可选*/

  void cancelRequests(CancelToken token) {
    token.cancel("cancelled");
  }
}
