import 'package:chatapp/app/routes/app_pages.dart';
import 'package:chatapp/helper/handleException.dart';
import 'package:chatapp/helper/log_printer.dart';
import 'package:chatapp/model/signInModel.dart';
import 'package:chatapp/repository/api_services.dart';
import 'package:chatapp/services/local_store_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // ApiServices instance
  final ApiServices apiServices = ApiServices();

  // Reactive variables for loading states and errors
  var isLoading = false.obs;
  var errorMessage = ''.obs;
  final obscureText = true.obs;

  // Method for user sign-in
  Future<void> signInUser({required String email, required String password}) async {
    try{
      isLoading.value = true;
      final response = await apiServices.signIn(email, password);
      isLoading.value = false;
      if(response.status!){
        Get.snackbar('Sign In', response.message!);
        await HiveService.setUserID(response.data!.id!);
        Get.offAllNamed(Routes.HOME);
      }else{
        Get.snackbar('Sign In', response.message!);
      }
    }catch(e){
      isLoading.value =false;
      Log.e(e.toString());
      handleException(e);
    }
  }
}
