import 'package:chatapp/repository/api_endpoint.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

import '../../../../model/chat.dart';

class MessagescreenController extends GetxController {
  final messages = <MessageModel>[].obs;
  final messageController = TextEditingController();
  final currentUserId = ''.obs; // Set this to the current user's ID

  late IO.Socket socket;

  @override
  void onInit() {
    super.onInit();

    // Initialize socket connection
    socket = IO.io(
      ApiEndpoint.domailUrl, // Replace with your server address
      IO.OptionBuilder()
          .setTransports(['websocket'])
          .enableAutoConnect()
          .build(),
    );

    // Connection events
    socket.on('connect', (_) {
      print('Connected to server with socket ID: ${socket.id}');
      socket.emit('registerUser', currentUserId.value); // Register the user
    });
    // Listen for incoming messages
    socket.on('receiveMessage', (data) {
      print('Message received: $data'); // Log the received message
      final message = MessageModel.fromJson(data);
      messages.add(message);
    });

  }

  void sendMessage(String receiverId) {
    if (messageController.text.isNotEmpty) {
      final message = {
        'senderId': currentUserId.value,  // The user sending the message
        'receiverId': receiverId,          // The target user
        'message': messageController.text.trim(),
      };

      // Emit the message to the server
      socket.emit('sendMessage', message);

      // Clear the text input after sending
      messageController.clear();
    }
  }


  @override
  void onClose() {
    messageController.dispose();
    socket.dispose();
    super.onClose();
  }
}
