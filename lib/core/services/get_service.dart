
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:nfc_card/core/services/api_service.dart';

final getIt = GetIt.instance;
void getService() {
  getIt.registerSingleton<ApiService>(
    ApiService(
      dio: Dio(),
    ),
  );
  
}
