import 'package:chatapp/gen/colors.gen.dart';
import 'package:chatapp/helper/avatar.dart';
import 'package:chatapp/helper/sizedbox_extension.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/messagescreen_controller.dart';

class MessagescreenView extends GetView<MessagescreenController> {
  const MessagescreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() {
          return Row(
            children: [
              // Add a placeholder avatar if receiver's avatar is not available
              CircleAvatar(
                child: Text(controller.receiver.value.username?.substring(0, 1) ?? '?'),
              ),
              SizedBox(width: 10),
              Text(controller.receiver.value.username?.capitalize ?? 'User'),
            ],
          );
        }),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          // Chat messages list
          Expanded(
            child: Obx(() {
              return ListView.builder(
                itemCount: controller.messages.length,
                itemBuilder: (context, index) {
                  final message = controller.messages[index];
                  final isSentByMe = message.senderId == controller.currentUserId.value;
                  return ListTile(
                    title: Align(
                      alignment: isSentByMe
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                        decoration: BoxDecoration(
                          color: isSentByMe ? Colors.blue : Colors.grey[300],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          message.text,
                          style: TextStyle(
                            color: isSentByMe ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            }),
          ),
          // Message input field
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller.messageController,
                    decoration: InputDecoration(
                      hintText: 'Type a message...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  onPressed: () {
                    controller.sendMessage();
                  },
                  icon: const Icon(
                    Icons.send,
                    color: Colors.blue,
                    size: 30,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
