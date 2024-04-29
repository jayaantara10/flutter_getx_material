import 'package:flutter/cupertino.dart';
import 'package:flutter_getx_material/common/enum/proccess_state_enum.dart';
import 'package:flutter_getx_material/infrastructure/dal/services/auth_service.dart';
import 'package:get/get.dart';

class Result<T> {
  T? data;
  ProcessState state;
  String? errorMessage;

  Result({this.data, this.errorMessage, this.state = ProcessState.Idle});
}

class HomeController extends GetxController {
  final AuthService authService = AuthService();
  final usernameController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final tokenState = Result<String>().obs;

  @override
  void onInit() {
    super.onInit();
    tokenState.value = Result(state: ProcessState.Idle);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> login() async {
    try {
      tokenState.value = Result(state: ProcessState.Loading);
      final result = await authService.login(
          usernameController.value.text, passwordController.value.text);
      tokenState.value = Result(data: result, state: ProcessState.Success);
    } catch (e) {
      tokenState.value =
          Result(errorMessage: e.toString(), state: ProcessState.Error);
      Get.snackbar("Error", "Login Failed");
    }
  }
}
