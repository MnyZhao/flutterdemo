class ApiStateCode {
  ///建立连接成功
  static const int Success = 200;

  ///请求成功
  static const int StateSuccess = 90000;

  ///请求失败
  static const int StateError = 10000;

  ///参数为空
  static const int StateParamsNIl = 10001;

  ///参数错误
  static const int StateParamsError = 10002;

  ///数据不存在 例如用户名不存在
  static const int StateDateNil = 10003;

  ///数据库查询失败
  static const int StateQueryError = 10004;

  ///token 失效
  static const int StateTokenInvalid = 10005;
}
