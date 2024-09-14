import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../gen/colors.gen.dart';
import '../controllers/registration_controller.dart';
import '../widgets/registerScren.dart';

class RegistrationView extends GetView<RegistrationController> {
  const RegistrationView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorName.bgColor,
      body: SignUpScreen(),
    );
  }
}
