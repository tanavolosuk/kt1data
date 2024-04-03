import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('HomeView'),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: SingleChildScrollView(
          child: Obx(() => Column(
                children: [
                  ElevatedButton(
                      onPressed: () => controller.getProducts(),
                      child: const Text('Обновить')),
                  const SizedBox(height: 16,),
                  Center(
                    child: controller.data.when(
                      loading: () => const CircularProgressIndicator(),
                      success: (message) => Text(
                        message,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      failed: (message) => Text(
                        message,
                        style: const TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                ],
              )),
        ));
  }
}