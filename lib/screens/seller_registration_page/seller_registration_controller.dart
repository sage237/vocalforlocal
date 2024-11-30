import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../models/category_subcategory_model.dart';
import '../../models/state_city_model.dart';
import '../../routes/routes.dart';
import '../../utils/constants.dart';

class SellerRegistrationController extends GetxController {
  final form1 = GlobalKey<FormState>();
  final pageController = PageController();

  final mobileController = TextEditingController();
  final emailController = TextEditingController();

  final firmNameController = TextEditingController();
  final nameController = TextEditingController();
  final designationController = TextEditingController();
  final addressController = TextEditingController();
  final contactController = TextEditingController();
  final pincodeController = TextEditingController();
  final passwordController = TextEditingController();
  final conFirmPasswordController = TextEditingController();
  RxBool isloading = true.obs;

  @override
  onInit() {
    getCategories();
    getStates();
    super.onInit();
  }

  RxList<CategoryList> categoryList = <CategoryList>[].obs;
  var selectedCategory = Rxn<CategoryList>();
  getCategories() async {
    var request = http.MultipartRequest('POST', apiUrl);
    request.fields.addAll({'action': 'BuisNessCategoryList'});

    try {
      final response = await request.send();
      final actualRep = await response.stream.bytesToString();
      var mm = actualRep.split('<!DOCTYPE html>').first;
      Categories categories = categoriesFromJson(mm);
      if (categories.statuscode == '200') {
        categoryList.value = categories.categotylist;
      }
    } finally {}
  }

  RxList<StateModel> stateList = <StateModel>[].obs;
  var selectedState = Rxn<StateModel>();
  getStates() async {
    selectedState.value = null;
    var request = http.MultipartRequest('POST', apiUrl);
    request.fields.addAll({
      'action': 'StateList',
    });

    try {
      final response = await request.send();
      final actualRep = await response.stream.bytesToString();
      var mm = actualRep.split('<!DOCTYPE html>').first;
      Statelist categories = statelistFromJson(mm);
      if (categories.statuscode == '200') {
        stateList.value = categories.stateList;
      }
    } finally {}
  }

  RxList<CategoryList> subCategoryList = <CategoryList>[].obs;
  var selectedSubCategory = Rxn<CategoryList>();
  getSubCategories() async {
    selectedSubCategory.value = null;
    var request = http.MultipartRequest('POST', apiUrl);
    request.fields.addAll({
      'action': 'BuisNessSubCategoryList',
      'CatID': selectedCategory.value!.id
    });

    Get.defaultDialog(
      barrierDismissible: false,
      title: 'Saving',
      content: const PopScope(
        canPop: false,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircularProgressIndicator(),
            SizedBox(
              width: 10,
            ),
            Text(
              'Getting Subcategories, please wait',
              // style: TextStyle(fontSize: 15),
            )
          ],
        ),
      ),
    );

    try {
      final response = await request.send();
      final actualRep = await response.stream.bytesToString();
      var mm = actualRep.split('<!DOCTYPE html>').first;
      Categories categories = categoriesFromJson(mm);
      if (categories.statuscode == '200') {
        subCategoryList.value = categories.categotylist;
      }
    } finally {
      Get.back();
    }
  }

  RxList<StateModel> cityList = <StateModel>[].obs;
  var selectedCity = Rxn<StateModel>();

  getCities() async {
    selectedCity.value = null;
    var request = http.MultipartRequest('POST', apiUrl);
    request.fields
        .addAll({'action': 'CityList', 'StateID': selectedState.value!.id});
    Get.defaultDialog(
      barrierDismissible: false,
      title: 'Saving',
      content: const PopScope(
        canPop: false,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircularProgressIndicator(),
            SizedBox(
              width: 10,
            ),
            Text(
              'Getting Cities, please wait',
              // style: TextStyle(fontSize: 15),
            )
          ],
        ),
      ),
    );
    try {
      final response = await request.send();
      final actualRep = await response.stream.bytesToString();
      var mm = actualRep.split('<!DOCTYPE html>').first;
      Statelist categories = statelistFromJson(mm);
      if (categories.statuscode == '200') {
        cityList.value = categories.stateList;
      }
    } finally {
      Get.back();
    }
  }

  sendOTP() async {
    if (form1.currentState!.validate()) {
      Get.defaultDialog(
        barrierDismissible: false,
        title: 'Loading',
        content: const PopScope(
          canPop: false,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(),
              SizedBox(
                width: 10,
              ),
              Text(
                ' Sending OTP, please wait',
                // style: TextStyle(fontSize: 15),
              )
            ],
          ),
        ),
      );
      try {
        final data = {
          'action': 'OtpSend',
          'Mobileno': mobileController.text,
          'Email': emailController.text
        };

        final response = await http.post(apiUrl, body: data);
        final msg = jsonDecode(response.body);
        // log('Data $data ${response.body}');

        // final msg = {'statuscode': '200', 'code': '4587'};

        if (msg['statuscode'] == '200') {
          Get.back();

          var responseq = await Get.toNamed(AppRoute.otpPage, arguments: {
                'mobile': mobileController.text,
                'email': emailController.text,
                'msg': msg
              }) ??
              false;

          if (responseq) {
            pageController.nextPage(
                duration: const Duration(milliseconds: 500),
                curve: Curves.linear);
          }
        } else {
          Get.back();
          Get.snackbar(
            'Error',
            '${msg['error']}',
            backgroundColor: Colors.red,
            colorText: Colors.white,
            snackPosition: SnackPosition.BOTTOM,
          );
        }
      } catch (e) {
        Get.back();
        Get.snackbar('Error', 'Something went wrong!!, please try again later',
            colorText: Colors.white,
            backgroundColor: Colors.white,
            snackPosition: SnackPosition.BOTTOM);
      } finally {
        // visible(false);
      }

      // log('OTP resp $response');
    }
  }

  void changeCategory(CategoryList? value) {
    if (selectedCategory.value != value) {
      selectedCategory.value = value;
      getSubCategories();
    }
  }

  void changeSubCategory(CategoryList? value) {
    if (selectedSubCategory.value != value) {
      selectedSubCategory.value = value;
    }
  }

  void changeState(StateModel? value) {
    if (selectedState.value != value) {
      selectedState.value = value;
      getCities();
    }
  }

  void changeCity(StateModel? value) {
    if (selectedCity.value != value) {
      selectedCity.value = value;
    }
  }

  saveData() async {
    if (form1.currentState!.validate()) {
      var request = http.MultipartRequest('POST', apiUrl);
      request.fields.addAll({
        'action': 'SaveCompnay',
        'Comp_name': firmNameController.text,
        'MobileNo': mobileController.text,
        'adddress': addressController.text,
        'Password': passwordController.text,
        'ContactNo': contactController.text,
        'ZoneID': '0',
        'CityID': selectedCity.value!.id,
        'CateID': selectedCategory.value!.id,
        'SubCatID': selectedSubCategory.value!.id,
        'Pincode': pincodeController.text,
        'BookingNAme': nameController.text,
        'Designation': designationController.text,
        'Email': emailController.text
      });
      Get.defaultDialog(
        barrierDismissible: false,
        title: 'Saving',
        content: const PopScope(
          canPop: false,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(),
              SizedBox(
                width: 10,
              ),
              Text(
                'Sending request, please wait',
                // style: TextStyle(fontSize: 15),
              )
            ],
          ),
        ),
      );
      try {
        final response = await request.send();
        final actualRep = await response.stream.bytesToString();
        var mm = actualRep.split('<!DOCTYPE html>').first;

        final msg = jsonDecode(mm);
        if (msg['statuscode'] == '200') {
          Get.back();
          Get.defaultDialog(
              barrierDismissible: false,
              title: 'Success',
              content: const PopScope(
                canPop: false,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Request saved successfully, our team will contact you soon',
                      // style: TextStyle(fontSize: 15),
                    )
                  ],
                ),
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      Get.offNamedUntil(
                          AppRoute.registration, (route) => false);
                    },
                    child: const Text('OK'))
              ]);
        } else {
          Get.back();
          Get.defaultDialog(
              barrierDismissible: false,
              title: 'Failed',
              content: PopScope(
                canPop: false,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '${msg['error']}, please try again later',
                      // style: TextStyle(fontSize: 15),
                    )
                  ],
                ),
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: const Text('OK'))
              ]);
        }
      } catch (e) {
        Get.back();
        Get.defaultDialog(
            barrierDismissible: false,
            title: 'Failed',
            content: const PopScope(
              canPop: false,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Request failed, please try again later',
                    // style: TextStyle(fontSize: 15),
                  )
                ],
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: const Text('OK'))
            ]);
      }
    }
  }
}
