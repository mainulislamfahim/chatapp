import 'package:chatapp/app/modules/auth/views/auth_view.dart';
import 'package:chatapp/gen/colors.gen.dart';
import 'package:chatapp/helper/app_text_style.dart';
import 'package:chatapp/helper/avatar.dart';
import 'package:chatapp/helper/sizedbox_extension.dart';
import 'package:chatapp/model/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../../model/chat.dart';
import '../../../../widget/chat_card.dart';
import '../../../routes/app_pages.dart';
import '../controllers/recent_message_controller.dart';

class RecentMessageView extends GetView<RecentMessageController> {
  const RecentMessageView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(RecentMessageController());
    return Scaffold(
      body: Obx(() {
        return ListView.builder(
            itemCount: controller.allUsers.length,
            itemBuilder: (context, index) {
              final Users user = controller.allUsers[index];
              return Padding(
                padding: const EdgeInsets.all(11.0),
                child: GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.MESSAGESCREEN, arguments: user);
                  },
                  child: Container(
                    height: 50.h,
                    width: Get.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.r),
                        color: ColorName.white,
                        border: Border.all(color: ColorName.primaryColor)
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        avatar(),
                        10.width,
                        AppTextStyle(text: user.username!.capitalize!,),
                      ],
                    ),
                  ),
                ),
              );
            }

        );
      }),
    );
  }
}
