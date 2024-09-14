import 'package:chatapp/app/routes/app_pages.dart';
import 'package:chatapp/gen/assets.gen.dart';
import 'package:chatapp/helper/sizedbox_extension.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/onboardscreen_controller.dart';

class OnboardscreenView extends GetView<OnboardscreenController> {
  const OnboardscreenView({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnboardscreenController(), permanent: true);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(flex: 2),
            Image.asset(Assets.images.welcomeImage.path),
            const Spacer(flex: 3),
            Text(
              "Welcome to our freedom \nmessaging app",
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            Text(
              "Freedom talk any person of your \nmother language.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .color!
                    .withOpacity(0.64),
              ),
            ),
            const Spacer(flex: 3),
            FittedBox(
              child: TextButton(
                  onPressed: () => Get.toNamed(Routes.AUTH),
                  child: Row(
                    children: [
                      Text(
                        "Skip",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .color!
                              .withOpacity(0.8),
                        ),
                      ),
                      10.width,
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                        color: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .color!
                            .withOpacity(0.8),
                      )
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
