import 'package:dio/dio.dart';
import '../utils/constants.dart';

class ApiManager {
  Dio dio = Dio();

  Future<Response> getData(String endPoint,
      {Map<String, dynamic>? data, String? token}) {
    return dio.get(Constants.baseUrl + endPoint,
        queryParameters: data, options: Options(headers: {"token": token}));
  }

  postData(String endPoint, {Map<String, dynamic>? body, String? token}) {
    return dio.post(Constants.baseUrl + endPoint,
        data: body, options: Options(headers: {"token": token}));
  }
}
