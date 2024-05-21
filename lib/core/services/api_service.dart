import 'package:dio/dio.dart';
import 'package:nfc_card/core/consts/const_text.dart';

class ApiService {
  final Dio dio;

  ApiService({
    required this.dio,
  });

  Future<Map<String, dynamic>> getWithToken({
    required String endPoint,
    required String token,
    Map<String, dynamic>? query,
  }) async {
    dio.options.headers = {
      "Authorization": 'Bearer $token',
    };
    var response = await dio.get(
      '${ConstText().baseUrl}$endPoint',
      queryParameters: query,
      options: Options(
        validateStatus: (status) {
          return status! == 200 || status == 201 || status == 400;
        },
      ),
    );
    return response.data;
  }

  Future<List<dynamic>> getWithoutToken({required String endPoint}) async {
    var response = await dio.get(
      '${ConstText().baseUrl}$endPoint',
      options: Options(
        validateStatus: (status) {
          return status! == 200 || status == 201 || status == 401;
        },
      ),
    );
    return response.data;
  }

  

  Future<Map<String, dynamic>> postWithToken({
    required String endPoint,
    required dynamic body,
    required String token,
  }) async {
    dio.options.headers = {
      "Authorization": 'Bearer $token',
    };

    var response = await dio.post(
      '${ConstText().baseUrl}$endPoint',
      data: body,
      options: Options(
        validateStatus: (status) {
          return status! == 200 || status == 201 || status == 400;
        },
      ),
    );

    return response.data;
  }

  Future<dynamic> postWithoutToken({
    required String endPoint,
    required dynamic body,
  }) async {
    var response =
        await dio.post('${ConstText().baseUrl}$endPoint', data: body);
    return response.data;
  }

  Future<Response> put({
    Map<String, dynamic>? headers,
    required endPoint,
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
  }) async {
    dio.options.headers = {
      "Authorization": "Bearer ",
    };

    var response = await dio.put(
      '${ConstText().baseUrl}$endPoint',
      queryParameters: query,
      options: Options(
        validateStatus: (status) {
          return status! == 200 || status == 201 || status == 400;
        },
      ),
      data: data,
    );
    return response;
  }

  Future<Response> delete(
      {Map<String, dynamic>? headers,
      required endPoint,
      Map<String, dynamic>? query}) async {
    dio.options.headers = {
      "Authorization": "Bearer ",
    };

    var response = await dio.delete(
      '${ConstText().baseUrl}$endPoint',
      queryParameters: query,
      options: Options(
        validateStatus: (status) {
          return status! == 200 || status == 201 || status == 400;
        },
      ),
    );
    return response.data;
  }
}
