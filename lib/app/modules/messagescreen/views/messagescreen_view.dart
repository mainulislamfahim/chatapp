import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/messagescreen_controller.dart';

class MessagescreenView extends GetView<MessagescreenController> {
  const MessagescreenView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MessagescreenView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'MessagescreenView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
