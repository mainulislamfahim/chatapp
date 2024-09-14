import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../model/chat.dart';
import '../../../../widget/chat_card.dart';
import '../../../routes/app_pages.dart';
import '../controllers/recent_message_controller.dart';

class RecentMessageView extends GetView<RecentMessageController> {
  const RecentMessageView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: ListView.builder(
        itemCount: chatsData.length,
        itemBuilder: (context, index) => ChatCard(
          chat: chatsData[index],
          press: () => Get.toNamed(Routes.MESSAGESCREEN),
        ),
      ),
    );
  }
}
