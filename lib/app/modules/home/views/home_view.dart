import 'package:chatapp/app/modules/active/views/active_view.dart';
import 'package:chatapp/app/modules/recentMessage/views/recent_message_view.dart';
import 'package:chatapp/app/routes/app_pages.dart';
import 'package:chatapp/gen/colors.gen.dart';
import 'package:chatapp/helper/app_text_style.dart';
import 'package:chatapp/helper/global_button_without_gradient.dart';
import 'package:chatapp/helper/log_printer.dart';
import 'package:chatapp/helper/sizedbox_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';
import '../../../../helper/app_text_style_over_flow.dart';
import '../../../../helper/constants.dart';
import '../../../../model/chat.dart';
import '../../../../widget/chat_card.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    const selectColor = Colors.black;
    const unselectColor = Colors.white;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        automaticallyImplyLeading: false,
        title: const AppTextStyle(
          text: 'Chats',
          fontWeight: FontWeight.w600,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              const message = "Hello"; // Replace with your message from TextField
              controller.sendMessage(message);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 60,
            padding: const EdgeInsets.fromLTRB(
                kDefaultPadding, 0, kDefaultPadding, kDefaultPadding),
            color: kPrimaryColor,
            child: Obx(() => TabBar(
              indicatorWeight: 0,
              tabAlignment: TabAlignment.fill,
              controller: controller.tabController,
              dividerColor: Colors.transparent,
              automaticIndicatorColorAdjustment: true,
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: RectangularIndicator(
                color: ColorName.white,
                bottomLeftRadius: 8,
                bottomRightRadius: 8,
                topLeftRadius: 8,
                topRightRadius: 8,
                paintingStyle: PaintingStyle.fill,
              ),
              unselectedLabelColor: kPrimaryColor,
              onTap: (index) {
                controller.updateSelectedTab(index);
              },
              tabs: [

                AppTextStyle(
                  text: 'Recent Message',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  height: 0,
                  color: controller.selectedTabIndex.value == 0
                      ? selectColor
                      : unselectColor,
                ),
                AppTextStyleOverFlow(
                  text: 'Active',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  height: 0,
                  color: controller.selectedTabIndex.value == 1
                      ? selectColor
                      : unselectColor,
                ),
              ],
            )),
          ),

          Expanded(
            child: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              controller: controller.tabController,
              // physics: const ClampingScrollPhysics(),
              children: const [RecentMessageView(), ActiveView()],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: kPrimaryColor,
        child: const Icon(
          Icons.person_add_alt_1,
          color: Colors.white,
        ),
      ),
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: controller.selectedBottomIndex.value,
          onTap: (value) {
            controller.selectedBottomIndex.value = value;
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.messenger), label: "Chats"),
            BottomNavigationBarItem(icon: Icon(Icons.people), label: "People"),
            BottomNavigationBarItem(icon: Icon(Icons.call), label: "Calls"),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle,
                color: ColorName.primaryColor,
              ),
              label: "Profile",
            ),
          ],
        );
      }),
    );
  }
}
