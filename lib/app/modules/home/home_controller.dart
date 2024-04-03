import 'package:get/get.dart';
import 'package:kt1data/app/data/models/api_response.dart';
import 'package:kt1data/app/data/services/api_service.dart';

class HomeController extends GetxController {
  final ApiService _apiService;
  final _data = ApiResponse.loading().obs;

  HomeController(this._apiService);

  @override
  void onInit() {
    getProducts();
    super.onInit();
  }

  Future<void> getProducts() async {
    _data.value = ApiResponse.loading();
    try {
      _data.value = await _apiService.get();
    } catch (e) {
      _data.value = ApiResponse.failed('ОШИБКА');
    }
  }

  ApiResponse get data => _data.value;
}
