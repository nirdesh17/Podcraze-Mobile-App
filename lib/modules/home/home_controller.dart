import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:podcraze/utils/constants.dart';

class HomeController extends GetxController {
  final localStorage = GetStorage();
  var firstName = "".obs;
  var lastName = "".obs;
  var image = "".obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    // Call a method to retrieve user details when the controller is initialized
    getUserDetails();
  }

  void getUserDetails() {
    final user = localStorage.read(KEY_USER_DATA);
    if (user != null) {
      // Use null-aware operators (?. and ??) to safely access properties
      firstName.value = user["firstname"] ?? "test";
      lastName.value = user["lastname"] ?? "test";
      image.value = user["profile_pic"] ??
          "https://res.cloudinary.com/dt6hyafmc/image/upload/v1692392344/Avatars/avatar_8609.png";
    }
  }
}
