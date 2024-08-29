import 'package:dio/dio.dart';
import 'package:platon_mobile/shared/app_url.dart';

Dio dio = Dio(
  BaseOptions(
    baseUrl: AppUrl.baseUrl,
    connectTimeout: const Duration(seconds: 5000),
    receiveTimeout: const Duration(seconds: 3000)
  ),
);