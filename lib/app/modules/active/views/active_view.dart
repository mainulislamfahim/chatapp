import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/active_controller.dart';

class ActiveView extends GetView<ActiveController> {
  const ActiveView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ActiveView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ActiveView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
