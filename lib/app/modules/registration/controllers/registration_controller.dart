import 'package:chatapp/helper/handleException.dart';
import 'package:chatapp/repository/api_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../helper/log_printer.dart';
import '../../../routes/app_pages.dart';

class RegistrationController extends GetxController {

  final obscureText = true.obs;
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // ApiServices instance
  final ApiServices apiServices = ApiServices();

  // Reactive variables for loading states and errors
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  // Method for user registration
  Future<void> registerUser({required String username, required String email, required String password}) async {
    try{
      isLoading.value = true;
      final response = await apiServices.signUp(username, email, password);
      isLoading.value = false;
      if(response.status!){
        Get.snackbar('Sign Up', response.message!);
        Get.offAllNamed(Routes.HOME);
      }else{
        Get.snackbar('Sign Up', response.message!);
      }
    }catch(e){
      handleException(e);
    }
  }



  @override
  void onClose() {
    // Dispose controllers when no longer needed
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
