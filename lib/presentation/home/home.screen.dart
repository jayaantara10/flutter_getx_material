import 'package:flutter/material.dart';
import 'package:flutter_getx_material/common/enum/proccess_state_enum.dart';
import 'package:flutter_getx_material/infrastructure/navigation/navigation.dart';

import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'controllers/home.controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final controller = Get.put(HomeController());

    return EnvironmentsBadge(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('GETX DEMO APP'),
          centerTitle: true,
        ),
        body: Container(
          padding: EdgeInsets.all(16),
          child: Center(
              child: Column(
            children: [
              Obx(() =>
                  TextField(controller: controller.usernameController.value)),
              Obx(() =>
                  TextField(controller: controller.passwordController.value)),
              FilledButton(
                  onPressed: () => controller.login(), child: Text("login")),
              Obx(() => switch(controller.tokenState.value.state){
                ProcessState.Success => Text(controller.tokenState.value.data!),
                ProcessState.Loading => const CircularProgressIndicator(),
                ProcessState.Error => Text(controller.tokenState.value.errorMessage!),
                ProcessState.Idle => Text("Belum Ada token"),
              }),
            ],
          )),
        ),
      ),
    );
  }
}
