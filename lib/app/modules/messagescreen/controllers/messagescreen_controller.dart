import 'package:chatapp/model/user.dart';
import 'package:chatapp/repository/api_endpoint.dart';
import 'package:chatapp/services/local_store_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

import '../../../../model/chat.dart';

class MessagescreenController extends GetxController {
  final messages = <MessageModel>[].obs;
  final messageController = TextEditingController();
  RxString currentUserId = ''.obs;
  final receiver = Users().obs; // Receiver details from Get.arguments

  late IO.Socket socket;

  @override
  void onInit() async {
    super.onInit();
    currentUserId.value =
        await HiveService.getUserID(); // Retrieve the current user's ID
    receiver.value = Get.arguments; // Set receiver information from arguments

    // Initialize the socket after retrieving user ID
    initializeSocket();
    fetchMessageHistory();
  }

  void initializeSocket() {
    socket = IO.io(
      ApiEndpoint.domailUrl, // Replace with your server URL
      IO.OptionBuilder()
          .setTransports(['websocket'])
          .enableAutoConnect()
          .build(),
    );

    socket.onConnect((_) {
      print('Connected to server with socket ID: ${socket.id}');
      socket.emit('registerUser',
          currentUserId.value); // Register the user with their socket ID
    });

    socket.on('connect_error', (error) {
      print('Connection error: $error');
    });

    socket.on('receiveMessage', (data) {
      try {
        final message = MessageModel.fromJson(data);
        messages.add(message);
      } catch (e) {
        print('Error parsing message: $e');
      }
    });

    socket.onDisconnect((_) {
      print('Disconnected from server');
    });
  }

  void fetchMessageHistory() {
    socket.emit('fetchMessages', {
      'userId1': currentUserId.value,
      'userId2': receiver.value.id.toString(),
    });
  }

  void sendMessage() {
    if (messageController.text.isNotEmpty) {
      final message = {
        'senderId': currentUserId.value,
        'receiverId': receiver.value.id.toString(),
        'message': messageController.text.trim(),
      };

      socket.emit('sendMessage', message);

      // Optionally, add the message locally to update the UI immediately
      final newMessage = MessageModel(
        id: DateTime.now().toString(),
        senderId: currentUserId.value,
        text: messageController.text.trim(),
        timestamp: DateTime.now(),
        receiverId: receiver.value.id.toString(),
      );
      messages.add(newMessage);

      messageController.clear(); // Clear the input field
    }
  }

  @override
  void onClose() {
    messageController.dispose();
    // socket.dispose(); // Close the socket connection properly
    super.onClose();
  }
}
