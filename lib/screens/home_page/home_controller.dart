import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../models/category_model.dart';

class HomeController extends GetxController {
  RxList<Category> categories = <Category>[].obs;
  RxBool catLoading = true.obs;
  @override
  void onInit() {
    getCategories();
    super.onInit();
  }

  Future<void> getCategories() async {
    var request = http.MultipartRequest(
        'POST', Uri.parse('https://askbni.in/apibilling.aspx'));
    request.fields.addAll({'action': 'CategoryList', 'CMPID': '1'});

    try {
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        final msg =
            categoryModelFromJson(await response.stream.bytesToString());
        if (msg.statuscode == '200') {
          categories.value = msg.ctgrylst;
        } else {
          Get.snackbar('Error', msg.error);
        }
      } else {
        Get.snackbar('Error', '${response.reasonPhrase}');
      }
    } catch (E) {
      Get.snackbar(
          'Error', 'Something went wrong, please try again later\n$E}');
    } finally {
      catLoading(false);
    }
  }
}
