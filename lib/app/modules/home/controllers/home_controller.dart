import 'package:chatapp/repository/api_endpoint.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../services/local_store_config.dart';

class HomeController extends GetxController with GetSingleTickerProviderStateMixin {

  final selectedBottomIndex = 0.obs;
  RxInt selectedTabIndex = 0.obs;
  // TabController for managing tabs
  late TabController tabController;

  // Socket for real-time communication
  late IO.Socket socket;

  // Update selected tab and animate to it
  void updateSelectedTab(int index) {
    selectedTabIndex.value = index;
    tabController.animateTo(index);
    update();
  }

  // Emit a message to the server
  void sendMessage(String message) {
    if (socket.connected) {
      socket.emit('message', {'message': message});
    } else {
      debugPrint('Socket is not connected. Connection status: ${socket.connected}');
    }
  }

  // Unsubscribe from all events before disposing
  void disconnectSocket() {
    socket.off('connect');
    socket.off('message');
    socket.off('disconnect');
    socket.disconnect();
  }

  @override
  void onInit() {
    super.onInit();

    // Tab Controller Initialization
    tabController = TabController(
      length: 2,
      vsync: this,
    );

    // Socket.IO connection
    socket = IO.io(
     ApiEndpoint.domailUrl,  // Localhost address for Android emulator
      IO.OptionBuilder()
          .setTransports(['websocket'])  // Use WebSocket for communication
          .enableAutoConnect()  // Auto-connect to the server
          .build(),
    );

    // Listen for connection
    socket.onConnect((_) async {
      debugPrint('Connected to the server');
      final userId = await HiveService.getUserID(); // Fetch user ID from Hive
      socket.emit('registerUser', userId);
    });

    // Listen for incoming messages
    socket.on('receiveMessage', (data) {
      debugPrint('Message from ${data['senderId']}: ${data['message']}');
      // Handle the received message in your UI
    });
    // Emit when a message is seen
    void markMessageAsSeen(String messageId) {
      socket.emit('messageSeen', messageId);
    }
    // Listen for incoming messages
    socket.on('message', (data) {
      debugPrint('New message: $data');
    });

    // Listen for disconnection
    socket.onDisconnect((_) {
      debugPrint('Disconnected from server');
    });

    // Optionally listen for connection errors
    // socket.onConnectError((err) {
    //   debugPrint('Connect error: $err');
    // });
    // socket.onError((err) {
    //   debugPrint('Error: $err');
    // });
  }

  @override
  void onClose() {
    // Unsubscribe and disconnect socket before closing
    // disconnectSocket();
    tabController.dispose();
    super.onClose();
  }
}
