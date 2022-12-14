import 'package:dio/dio.dart';

class TokenInterceptor extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    options.headers['Authorization'] =
        'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1aWQiOiJWTWRSeFpwQjdlSEw4IiwibmFtZSI6Ik5hcmVzaCBLdWtyZXRpIiwiaWF0IjoxNjUzNTYxMzQ3LCJleHAiOjE2NTYxNTMzNDd9.ft4yHKVsWHA_LTTSmLi8EHCAEb359nXRoxr43ZJ6Whs';
    handler.next(options);
  }
}
