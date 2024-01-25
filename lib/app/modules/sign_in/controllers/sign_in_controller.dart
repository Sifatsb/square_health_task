import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:square_health_task/app/data/api_urls/api_urls.dart';
import 'package:square_health_task/app/database/auth_database.dart';
import 'package:square_health_task/app/routes/app_pages.dart';
import 'package:square_health_task/app/utilities/message/snack_bars.dart';
import 'package:square_health_task/domain/base_client/base_client.dart';
import 'package:square_health_task/domain/core/model/profile_model/profile_model.dart';

class SignInController extends GetxController {

  RxBool loginLoader = false.obs;
  TextEditingController emailTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();

  bool validate() {
    String email = emailTextController.text;
    String password = passwordTextController.text;
    if (email.isEmpty) {
      showBasicFailedSnackBar(message: 'Enter email');
      return false;
    } else if (password.isEmpty) {
      showBasicFailedSnackBar(message: 'Enter password');
      return false;
    }
    return true;
  }

  Future<ProfileInfoModel> getSignIn({required String email, required String password}) async {
    try {
      loginLoader.value = true;

      final response = await ApiBaseClient().postData(
        url: ApiUrls.getSignIn,
        header: {'Content-Type': 'application/json'},
        payload: {"email": email, "password": password},
      );


      ProfileInfoModel profileInfoModel = ProfileInfoModel.fromJson(response);

      if(profileInfoModel.token != null || profileInfoModel.token != ''){
        loginLoader.value = false;
        bool status = await AuthDatabase.instance.saveAuthInfo(
          profileInfoModelModel: profileInfoModel,
        );
        if(status){
          Get.toNamed(Routes.HOME);
        }


      } else{
        loginLoader.value = false;
        showBasicFailedSnackBar(message: 'Something went wrong');
      }


    } catch (e, t) {
      loginLoader.value = false;
      debugPrint('$e');
      debugPrint('$t');
    } finally {
      loginLoader.value = false;
    }

    return ProfileInfoModel();
  }
}
