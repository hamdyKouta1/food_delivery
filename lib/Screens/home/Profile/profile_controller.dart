import 'package:food_delivery/Cache%20Helper/cache_helper.dart';
import 'package:food_delivery/Screens/Athuntication/SignIn/sign_in_screen.dart';
import 'package:food_delivery/Services/profile_service.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  var email, firstName, lastName, photo,result,localPath;

  @override
  void onInit() {
    print("hello");
    getProfileInfo();
  }
  logOut()async{
    await CacheHelper.removeFromSharedPreferences(key: 'token');
    Get.to(SignInScreen());
  }
  getProfileInfo() async {
    final info = await GetProfile.getProfile();
    firstName = info['data']['name'];
    email = info['data']['email'];
    photo = info['data']['avatar'];
   // photo==null? "":info['data']['avatar'];
    print(info);
    print(firstName);
    print(email);

      await CacheHelper.saveToSharedPreferences(
          'email', email);

      await CacheHelper.saveToSharedPreferences(
          'support', "support1@gmail.com");


    print(photo);
    result = photo.substring(7);
    print(result);
    update();
  }
}
