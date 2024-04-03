import 'dart:math';
import 'package:get/get.dart';
import 'package:kt1data/app/data/models/api_response.dart';

class ApiService extends GetxService {
  Future<ApiResponse<T>> get<T>() async {
    try {
      var randomInt = Random().nextInt(100) % 3;
      if (randomInt == 0) {
        await Future.delayed(const Duration(seconds: 2));
        throw 'random error';
      }
      await Future.delayed(const Duration(seconds: 2));
      return ApiResponse.success('Успешно' as T);
    } catch (e) {
      return ApiResponse.failed('ОШИБКА');
    }
  }

  Future<ApiService> init() async {
    return this;
  }
}