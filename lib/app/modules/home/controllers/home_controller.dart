import 'package:chatapp/repository/api_endpoint.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      print('Socket is not connected. Connection status: ${socket.connected}');
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
    socket.onConnect((_) {
      print('Connected to the server');
    });

    // Listen for incoming messages
    socket.on('message', (data) {
      print('New message: $data');
    });

    // Listen for disconnection
    socket.onDisconnect((_) {
      print('Disconnected from server');
    });

    // Optionally listen for connection errors
    // socket.onConnectError((err) {
    //   print('Connect error: $err');
    // });
    // socket.onError((err) {
    //   print('Error: $err');
    // });
  }

  @override
  void onClose() {
    // Unsubscribe and disconnect socket before closing
    disconnectSocket();
    tabController.dispose();
    super.onClose();
  }
}
