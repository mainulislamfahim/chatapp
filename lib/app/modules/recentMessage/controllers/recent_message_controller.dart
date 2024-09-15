import 'package:chatapp/helper/handleException.dart';
import 'package:chatapp/model/user.dart';
import 'package:chatapp/repository/api_services.dart';
import 'package:chatapp/services/local_store_config.dart';
import 'package:get/get.dart';

class RecentMessageController extends GetxController {
  ApiServices apiServices = ApiServices();
  final allUsers = <Users>[].obs; // Initialize with null, making AllUsers nullable // Initialize with an empty list

  Future<void> getAllUsers() async {
    try {
      final currentID = await HiveService.getUserID();
      final response = await apiServices.getUsers();
      allUsers.value = response.data!.where((user) => user.id != currentID).toList();
    } catch (e) {
      handleException(e);
    }
  }

  @override
  void onInit() {
    getAllUsers();
    super.onInit();
  }

}
