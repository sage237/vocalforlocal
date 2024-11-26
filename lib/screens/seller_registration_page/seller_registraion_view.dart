import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../core_theme/text_theme.dart';
import '../../models/category_subcategory_model.dart';
import '../../models/state_city_model.dart';
import '../../utils/screen_util.dart';
import 'seller_registration_controller.dart';

class SellerRegistraionView extends StatelessWidget {
  const SellerRegistraionView({super.key});

  @override
  Widget build(BuildContext context) {
    SellerRegistrationController registrationController = Get.find();

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Responsive.safeBlockHorizontal * 3),
        child: Form(
          key: registrationController.form1,
          child: PageView(
            controller: registrationController.pageController,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: Responsive.safeBlockVerticalWAB * 15,
                  ),
                  Text(
                    'Welcome to vocal for local',
                    style: TextStyle(
                        fontSize: AppTextTheme
                            .newTextThemeDark.headlineMedium!.fontSize),
                  ),
                  SizedBox(
                    height: Responsive.safeBlockVerticalWAB * 5,
                  ),
                  Text(
                    'Seller, Enter Contact Details',
                    style: TextStyle(
                        fontSize: AppTextTheme
                            .newTextThemeDark.headlineSmall!.fontSize),
                  ),
                  SizedBox(
                    height: Responsive.safeBlockVerticalWAB,
                  ),
                  Text(
                    'We will send you a 4 digit verification code',
                    style: TextStyle(
                        fontSize:
                            AppTextTheme.newTextThemeDark.bodyLarge!.fontSize,
                        color: Colors.grey),
                  ),
                  SizedBox(
                    height: Responsive.safeBlockVerticalWAB * 10,
                  ),
                  TextFormField(
                    controller: registrationController.mobileController,
                    keyboardType: TextInputType.number,
                    style: const TextStyle(
                      color: Colors.white54,
                    ),
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return "Required";
                      }
                      if (val.length != 10) {
                        return "Invalid mobile number";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      prefix: const Text('+91  '),
                      labelStyle: TextStyle(
                        color: Colors.white54,
                        fontSize:
                            AppTextTheme.newTextThemeDark.bodyLarge!.fontSize,
                      ),
                      labelText: "Mobile Number",
                      focusedErrorBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.orangeAccent)),
                      errorBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.orangeAccent)),
                      errorStyle: const TextStyle(color: Colors.orangeAccent),
                      enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white54)),
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue)),
                    ),
                    inputFormatters: [LengthLimitingTextInputFormatter(10)],
                  ),
                  SizedBox(
                    height: Responsive.safeBlockVerticalWAB * 2.5,
                  ),
                  TextFormField(
                    controller: registrationController.emailController,
                    keyboardType: TextInputType.emailAddress,
                    style: const TextStyle(
                      color: Colors.white54,
                    ),
                    validator: (val) {
                      if (val != null && val.isNotEmpty) {
                        if (!(RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(val))) {
                          return 'Invalid email ';
                        }
                      }

                      return null;
                    },
                    decoration: InputDecoration(
                      labelStyle: TextStyle(
                        color: Colors.white54,
                        fontSize:
                            AppTextTheme.newTextThemeDark.bodyLarge!.fontSize,
                      ),
                      labelText: "email address",
                      focusedErrorBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.orangeAccent)),
                      errorBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.orangeAccent)),
                      errorStyle: const TextStyle(color: Colors.orangeAccent),
                      enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white54)),
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue)),
                    ),
                    // inputFormatters: [LengthLimitingTextInputFormatter(10)],
                  ),
                  const Spacer(),
                  if (MediaQuery.of(context).viewInsets.bottom <= 0)
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        onPressed: () => registrationController.sendOTP(),
                        style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5))),
                        child: const Text('Get OTP'),
                      ),
                    ),
                  SizedBox(
                    height: Responsive.safeBlockVerticalWAB * 10,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: Responsive.safeBlockVerticalWAB * 15,
                  ),
                  Text(
                    'Enter Firm Details',
                    style: TextStyle(
                        fontSize: AppTextTheme
                            .newTextThemeDark.headlineSmall!.fontSize),
                  ),
                  SizedBox(
                    height: Responsive.safeBlockVerticalWAB,
                  ),
                  Text(
                    'Tell us about your business',
                    style: TextStyle(
                        fontSize:
                            AppTextTheme.newTextThemeDark.bodyLarge!.fontSize,
                        color: Colors.grey),
                  ),
                  SizedBox(
                    height: Responsive.safeBlockVerticalWAB * 5,
                  ),
                  Expanded(
                    child: ListView(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: Responsive.safeBlockVerticalWAB * 5,
                        ),
                        TextFormField(
                          controller: registrationController.firmNameController,
                          style: const TextStyle(
                            color: Colors.white54,
                          ),
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return "Required";
                            }
                            // if (val.length != 10) {
                            //   return "Invalid mobile number";
                            // }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelStyle: TextStyle(
                              color: Colors.white54,
                              fontSize: AppTextTheme
                                  .newTextThemeDark.bodyLarge!.fontSize,
                            ),
                            labelText: "Firm Name",
                            focusedErrorBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.orangeAccent)),
                            errorBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.orangeAccent)),
                            errorStyle:
                                const TextStyle(color: Colors.orangeAccent),
                            enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white54)),
                            focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue)),
                          ),
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(10)
                          ],
                        ),
                        SizedBox(
                          height: Responsive.safeBlockVerticalWAB * 2.5,
                        ),
                        Obx(() {
                          return Row(
                            children: [
                              Expanded(
                                child: DropdownSearch<CategoryList>(
                                  items: (f, cs) =>
                                      registrationController.categoryList,
                                  validator: (val) {
                                    if (val == null) {
                                      return "Required";
                                    }
                                    return null;
                                  },
                                  onChanged:
                                      registrationController.changeCategory,
                                  compareFn: (item1, item2) =>
                                      item1.id == item2.id,
                                  dropdownBuilder: (context, str) {
                                    return Text(
                                      str != null ? "  ${str.name} " : '',
                                      overflow: TextOverflow.ellipsis,
                                      // style: const TextStyle(color: Colors.green),
                                    );
                                  },
                                  popupProps: PopupProps.modalBottomSheet(
                                    showSearchBox: true,
                                    containerBuilder: (context, widget) =>
                                        Container(
                                      color: Colors.black,
                                      child: widget,
                                    ),
                                    title: Container(
                                      height: 50,
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                      ),
                                      child: const Center(
                                        child: Text(
                                          'Categories',
                                          style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black87,
                                          ),
                                        ),
                                      ),
                                    ),
                                    searchFieldProps: TextFieldProps(
                                      decoration: InputDecoration(
                                        labelStyle: TextStyle(
                                          color: Colors.white54,
                                          fontSize: AppTextTheme
                                              .newTextThemeDark
                                              .bodyLarge!
                                              .fontSize,
                                        ),
                                        labelText: "Search Category",
                                        focusedErrorBorder:
                                            const OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color:
                                                        Colors.orangeAccent)),
                                        errorBorder: const OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.orangeAccent)),
                                        errorStyle: const TextStyle(
                                            color: Colors.orangeAccent),
                                        enabledBorder: const OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.white54)),
                                        focusedBorder: const OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.blue)),
                                      ),
                                    ),
                                    itemBuilder: (context, item, isDisabled,
                                        isSelected) {
                                      {
                                        return ListTile(
                                          title: Text(
                                            item.name,
                                          ),
                                          // subtitle: Text(
                                          //   "Code: ${item['SchoolCode']}",
                                          // ),
                                        );
                                      }

                                      // return Padding(
                                      //   padding: const EdgeInsets.only(
                                      //       left: 10, top: 20, bottom: 30, right: 20),
                                      //   child: Text(
                                      //     "${str['Name']}",
                                      //     style: const TextStyle(fontSize: 18),
                                      //   ),
                                      //
                                      //   ///TODO
                                      // );
                                    },
                                  ),
                                  decoratorProps: DropDownDecoratorProps(
                                    decoration: InputDecoration(
                                      labelStyle: TextStyle(
                                        color: Colors.white54,
                                        fontSize: AppTextTheme.newTextThemeDark
                                            .bodyLarge!.fontSize,
                                      ),
                                      labelText: "Business Category",
                                      focusedErrorBorder:
                                          const OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.orangeAccent)),
                                      errorBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.orangeAccent)),
                                      errorStyle: const TextStyle(
                                          color: Colors.orangeAccent),
                                      enabledBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.white54)),
                                      focusedBorder: const OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.blue)),
                                    ),
                                  ),
                                  selectedItem: registrationController
                                      .selectedCategory.value,
                                ),
                              ),
                              if (registrationController
                                      .selectedCategory.value !=
                                  null)
                                SizedBox(
                                  width: Responsive.safeBlockHorizontal * 3,
                                ),
                              if (registrationController
                                      .selectedCategory.value !=
                                  null)
                                Expanded(
                                  child: DropdownSearch<CategoryList>(
                                    items: (f, cs) =>
                                        registrationController.subCategoryList,
                                    validator: (val) {
                                      if (val == null) {
                                        return "Required";
                                      }
                                      return null;
                                    },
                                    onChanged: registrationController
                                        .changeSubCategory,
                                    compareFn: (item1, item2) =>
                                        item1.id == item2.id,
                                    dropdownBuilder: (context, str) {
                                      return Text(
                                        str != null ? "  ${str.name} " : '',
                                        overflow: TextOverflow.ellipsis,
                                        // style: const TextStyle(color: Colors.green),
                                      );
                                    },
                                    popupProps: PopupProps.modalBottomSheet(
                                      showSearchBox: true,
                                      containerBuilder: (context, widget) =>
                                          Container(
                                        color: Colors.black,
                                        child: widget,
                                      ),
                                      title: Container(
                                        height: 50,
                                        decoration: const BoxDecoration(
                                          color: Colors.white,
                                        ),
                                        child: const Center(
                                          child: Text(
                                            'SubCategories',
                                            style: TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black87,
                                            ),
                                          ),
                                        ),
                                      ),
                                      searchFieldProps: TextFieldProps(
                                        decoration: InputDecoration(
                                          labelStyle: TextStyle(
                                            color: Colors.white54,
                                            fontSize: AppTextTheme
                                                .newTextThemeDark
                                                .bodyLarge!
                                                .fontSize,
                                          ),
                                          labelText: "Search SubCategory",
                                          focusedErrorBorder:
                                              const OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color:
                                                          Colors.orangeAccent)),
                                          errorBorder: const OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.orangeAccent)),
                                          errorStyle: const TextStyle(
                                              color: Colors.orangeAccent),
                                          enabledBorder:
                                              const OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.white54)),
                                          focusedBorder:
                                              const OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.blue)),
                                        ),
                                      ),
                                      itemBuilder: (context, item, isDisabled,
                                          isSelected) {
                                        {
                                          return ListTile(
                                            title: Text(
                                              item.name,
                                            ),
                                            // subtitle: Text(
                                            //   "Code: ${item['SchoolCode']}",
                                            // ),
                                          );
                                        }

                                        // return Padding(
                                        //   padding: const EdgeInsets.only(
                                        //       left: 10, top: 20, bottom: 30, right: 20),
                                        //   child: Text(
                                        //     "${str['Name']}",
                                        //     style: const TextStyle(fontSize: 18),
                                        //   ),
                                        //
                                        //   ///TODO
                                        // );
                                      },
                                    ),
                                    decoratorProps: DropDownDecoratorProps(
                                      decoration: InputDecoration(
                                        labelStyle: TextStyle(
                                          color: Colors.white54,
                                          fontSize: AppTextTheme
                                              .newTextThemeDark
                                              .bodyLarge!
                                              .fontSize,
                                        ),
                                        labelText: "SubCategory",
                                        focusedErrorBorder:
                                            const OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color:
                                                        Colors.orangeAccent)),
                                        errorBorder: const OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.orangeAccent)),
                                        errorStyle: const TextStyle(
                                            color: Colors.orangeAccent),
                                        enabledBorder: const OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.white54)),
                                        focusedBorder: const OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.blue)),
                                      ),
                                    ),
                                    selectedItem: registrationController
                                        .selectedSubCategory.value,
                                  ),
                                ),
                            ],
                          );
                        }),
                        SizedBox(
                          height: Responsive.safeBlockVerticalWAB * 2.5,
                        ),
                        TextFormField(
                          controller: registrationController.contactController,
                          keyboardType: TextInputType.number,
                          style: const TextStyle(
                            color: Colors.white54,
                          ),
                          validator: (val) {
                            // if (val == null || val.isEmpty) {
                            //   return "Required";
                            // }
                            if (val!.length != 10) {
                              return "Invalid mobile number";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            prefix: const Text('+91  '),
                            labelStyle: TextStyle(
                              color: Colors.white54,
                              fontSize: AppTextTheme
                                  .newTextThemeDark.bodyLarge!.fontSize,
                            ),
                            labelText: "Contact Number",
                            focusedErrorBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.orangeAccent)),
                            errorBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.orangeAccent)),
                            errorStyle:
                                const TextStyle(color: Colors.orangeAccent),
                            enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white54)),
                            focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue)),
                          ),
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(10)
                          ],
                        ),
                        SizedBox(
                          height: Responsive.safeBlockVerticalWAB * 2.5,
                        ),
                        TextFormField(
                          controller: registrationController.addressController,
                          keyboardType: TextInputType.streetAddress,
                          minLines: 3,
                          maxLines: 5,
                          style: const TextStyle(
                            color: Colors.white54,
                          ),
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return "Required";
                            }
                            // if (val.length != 10) {
                            //   return "Invalid mobile number";
                            // }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelStyle: TextStyle(
                              color: Colors.white54,
                              fontSize: AppTextTheme
                                  .newTextThemeDark.bodyLarge!.fontSize,
                            ),
                            labelText: "Firm Address",
                            focusedErrorBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.orangeAccent)),
                            errorBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.orangeAccent)),
                            errorStyle:
                                const TextStyle(color: Colors.orangeAccent),
                            enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white54)),
                            focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue)),
                          ),
                          // inputFormatters: [
                          //   // LengthLimitingTextInputFormatter(10)
                          // ],
                        ),
                        SizedBox(
                          height: Responsive.safeBlockVerticalWAB * 2.5,
                        ),
                        Obx(() {
                          return Row(
                            children: [
                              // Expanded(
                              //   child: TextFormField(
                              //     controller:
                              //         registrationController.nameController,
                              //
                              //     style: const TextStyle(
                              //       color: Colors.white54,
                              //     ),
                              //     validator: (val) {
                              //       // if (val == null || val.isEmpty) {
                              //       //   return "Required";
                              //       // }
                              //
                              //       return null;
                              //     },
                              //     decoration: InputDecoration(
                              //       labelStyle: TextStyle(
                              //         color: Colors.white54,
                              //         fontSize: AppTextTheme
                              //             .newTextThemeDark.bodyLarge!.fontSize,
                              //       ),
                              //       labelText: "Category",
                              //       focusedErrorBorder: const OutlineInputBorder(
                              //           borderSide: BorderSide(
                              //               color: Colors.orangeAccent)),
                              //       errorBorder: const OutlineInputBorder(
                              //           borderSide: BorderSide(
                              //               color: Colors.orangeAccent)),
                              //       errorStyle: const TextStyle(
                              //           color: Colors.orangeAccent),
                              //       enabledBorder: const OutlineInputBorder(
                              //           borderSide:
                              //               BorderSide(color: Colors.white54)),
                              //       focusedBorder: const OutlineInputBorder(
                              //           borderSide:
                              //               BorderSide(color: Colors.blue)),
                              //     ),
                              //     // inputFormatters: [LengthLimitingTextInputFormatter(10)],
                              //   ),
                              // ),
                              Expanded(
                                child: DropdownSearch<StateModel>(
                                  items: (f, cs) =>
                                      registrationController.stateList,
                                  validator: (val) {
                                    if (val == null) {
                                      return "Required";
                                    }
                                    return null;
                                  },
                                  onChanged: registrationController.changeState,
                                  compareFn: (item1, item2) =>
                                      item1.id == item2.id,
                                  dropdownBuilder: (context, str) {
                                    return Text(
                                      str != null ? "  ${str.name} " : '',
                                      overflow: TextOverflow.ellipsis,
                                      // style: const TextStyle(color: Colors.green),
                                    );
                                  },
                                  popupProps: PopupProps.modalBottomSheet(
                                    showSearchBox: true,
                                    containerBuilder: (context, widget) =>
                                        Container(
                                      color: Colors.black,
                                      child: widget,
                                    ),
                                    title: Container(
                                      height: 50,
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                      ),
                                      child: const Center(
                                        child: Text(
                                          'States',
                                          style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black87,
                                          ),
                                        ),
                                      ),
                                    ),
                                    searchFieldProps: TextFieldProps(
                                      decoration: InputDecoration(
                                        labelStyle: TextStyle(
                                          color: Colors.white54,
                                          fontSize: AppTextTheme
                                              .newTextThemeDark
                                              .bodyLarge!
                                              .fontSize,
                                        ),
                                        labelText: "Search State",
                                        focusedErrorBorder:
                                            const OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color:
                                                        Colors.orangeAccent)),
                                        errorBorder: const OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.orangeAccent)),
                                        errorStyle: const TextStyle(
                                            color: Colors.orangeAccent),
                                        enabledBorder: const OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.white54)),
                                        focusedBorder: const OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.blue)),
                                      ),
                                    ),
                                    itemBuilder: (context, item, isDisabled,
                                        isSelected) {
                                      {
                                        return ListTile(
                                          title: Text(
                                            item.name,
                                          ),
                                          // subtitle: Text(
                                          //   "Code: ${item['SchoolCode']}",
                                          // ),
                                        );
                                      }

                                      // return Padding(
                                      //   padding: const EdgeInsets.only(
                                      //       left: 10, top: 20, bottom: 30, right: 20),
                                      //   child: Text(
                                      //     "${str['Name']}",
                                      //     style: const TextStyle(fontSize: 18),
                                      //   ),
                                      //
                                      //   ///TODO
                                      // );
                                    },
                                  ),
                                  decoratorProps: DropDownDecoratorProps(
                                    decoration: InputDecoration(
                                      labelStyle: TextStyle(
                                        color: Colors.white54,
                                        fontSize: AppTextTheme.newTextThemeDark
                                            .bodyLarge!.fontSize,
                                      ),
                                      labelText: "State",
                                      focusedErrorBorder:
                                          const OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.orangeAccent)),
                                      errorBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.orangeAccent)),
                                      errorStyle: const TextStyle(
                                          color: Colors.orangeAccent),
                                      enabledBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.white54)),
                                      focusedBorder: const OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.blue)),
                                    ),
                                  ),
                                  selectedItem: registrationController
                                      .selectedState.value,
                                ),
                              ),

                              if (registrationController.selectedState.value !=
                                  null)
                                SizedBox(
                                  width: Responsive.safeBlockHorizontal * 3,
                                ),
                              if (registrationController.selectedState.value !=
                                  null)
                                Expanded(
                                  child: DropdownSearch<StateModel>(
                                    items: (f, cs) =>
                                        registrationController.cityList,
                                    validator: (val) {
                                      if (val == null) {
                                        return "Required";
                                      }
                                      return null;
                                    },
                                    onChanged:
                                        registrationController.changeCity,
                                    compareFn: (item1, item2) =>
                                        item1.id == item2.id,
                                    dropdownBuilder: (context, str) {
                                      return Text(
                                        str != null ? "  ${str.name} " : '',
                                        overflow: TextOverflow.ellipsis,
                                        // style: const TextStyle(color: Colors.green),
                                      );
                                    },
                                    popupProps: PopupProps.modalBottomSheet(
                                      showSearchBox: true,
                                      containerBuilder: (context, widget) =>
                                          Container(
                                        color: Colors.black,
                                        child: widget,
                                      ),
                                      title: Container(
                                        height: 50,
                                        decoration: const BoxDecoration(
                                          color: Colors.white,
                                        ),
                                        child: const Center(
                                          child: Text(
                                            'Cities',
                                            style: TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black87,
                                            ),
                                          ),
                                        ),
                                      ),
                                      searchFieldProps: TextFieldProps(
                                        decoration: InputDecoration(
                                          labelStyle: TextStyle(
                                            color: Colors.white54,
                                            fontSize: AppTextTheme
                                                .newTextThemeDark
                                                .bodyLarge!
                                                .fontSize,
                                          ),
                                          labelText: "Search City",
                                          focusedErrorBorder:
                                              const OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color:
                                                          Colors.orangeAccent)),
                                          errorBorder: const OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.orangeAccent)),
                                          errorStyle: const TextStyle(
                                              color: Colors.orangeAccent),
                                          enabledBorder:
                                              const OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.white54)),
                                          focusedBorder:
                                              const OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.blue)),
                                        ),
                                      ),
                                      itemBuilder: (context, item, isDisabled,
                                          isSelected) {
                                        {
                                          return ListTile(
                                            title: Text(
                                              item.name,
                                            ),
                                            // subtitle: Text(
                                            //   "Code: ${item['SchoolCode']}",
                                            // ),
                                          );
                                        }

                                        // return Padding(
                                        //   padding: const EdgeInsets.only(
                                        //       left: 10, top: 20, bottom: 30, right: 20),
                                        //   child: Text(
                                        //     "${str['Name']}",
                                        //     style: const TextStyle(fontSize: 18),
                                        //   ),
                                        //
                                        //   ///TODO
                                        // );
                                      },
                                    ),
                                    decoratorProps: DropDownDecoratorProps(
                                      decoration: InputDecoration(
                                        labelStyle: TextStyle(
                                          color: Colors.white54,
                                          fontSize: AppTextTheme
                                              .newTextThemeDark
                                              .bodyLarge!
                                              .fontSize,
                                        ),
                                        labelText: "City",
                                        focusedErrorBorder:
                                            const OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color:
                                                        Colors.orangeAccent)),
                                        errorBorder: const OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.orangeAccent)),
                                        errorStyle: const TextStyle(
                                            color: Colors.orangeAccent),
                                        enabledBorder: const OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.white54)),
                                        focusedBorder: const OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.blue)),
                                      ),
                                    ),
                                    selectedItem: registrationController
                                        .selectedCity.value,
                                  ),
                                ),
                            ],
                          );
                        }),
                        SizedBox(
                          height: Responsive.safeBlockVerticalWAB * 2.5,
                        ),
                        TextFormField(
                          controller: registrationController.pincodeController,
                          keyboardType: TextInputType.number,
                          style: const TextStyle(
                            color: Colors.white54,
                          ),
                          validator: (val) {
                            // if (val == null || val.isEmpty) {
                            //   return "Required";
                            // }
                            if (val!.length != 6) {
                              return "Invalid pin code";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            // prefix: const Text('+91  '),
                            labelStyle: TextStyle(
                              color: Colors.white54,
                              fontSize: AppTextTheme
                                  .newTextThemeDark.bodyLarge!.fontSize,
                            ),
                            labelText: "Pin Code",
                            focusedErrorBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.orangeAccent)),
                            errorBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.orangeAccent)),
                            errorStyle:
                                const TextStyle(color: Colors.orangeAccent),
                            enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white54)),
                            focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue)),
                          ),
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(6)
                          ],
                        ),
                        SizedBox(
                          height: Responsive.safeBlockVerticalWAB * 2.5,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller:
                                    registrationController.nameController,

                                style: const TextStyle(
                                  color: Colors.white54,
                                ),
                                validator: (val) {
                                  // if (val == null || val.isEmpty) {
                                  //   return "Required";
                                  // }

                                  return null;
                                },
                                decoration: InputDecoration(
                                  labelStyle: TextStyle(
                                    color: Colors.white54,
                                    fontSize: AppTextTheme
                                        .newTextThemeDark.bodyLarge!.fontSize,
                                  ),
                                  labelText: "Your Name",
                                  focusedErrorBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.orangeAccent)),
                                  errorBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.orangeAccent)),
                                  errorStyle: const TextStyle(
                                      color: Colors.orangeAccent),
                                  enabledBorder: const OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white54)),
                                  focusedBorder: const OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.blue)),
                                ),
                                // inputFormatters: [LengthLimitingTextInputFormatter(10)],
                              ),
                            ),
                            SizedBox(
                              width: Responsive.safeBlockHorizontal * 3,
                            ),
                            Expanded(
                              child: TextFormField(
                                controller: registrationController
                                    .designationController,

                                style: const TextStyle(
                                  color: Colors.white54,
                                ),
                                validator: (val) {
                                  // if (val == null || val.isEmpty) {
                                  //   return "Required";
                                  // }

                                  return null;
                                },
                                decoration: InputDecoration(
                                  labelStyle: TextStyle(
                                    color: Colors.white54,
                                    fontSize: AppTextTheme
                                        .newTextThemeDark.bodyLarge!.fontSize,
                                  ),
                                  labelText: "Designation",
                                  focusedErrorBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.orangeAccent)),
                                  errorBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.orangeAccent)),
                                  errorStyle: const TextStyle(
                                      color: Colors.orangeAccent),
                                  enabledBorder: const OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white54)),
                                  focusedBorder: const OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.blue)),
                                ),
                                // inputFormatters: [LengthLimitingTextInputFormatter(10)],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: Responsive.safeBlockVerticalWAB * 2.5,
                        ),
                        TextFormField(
                          controller: registrationController.passwordController,
                          style: const TextStyle(
                            color: Colors.white54,
                          ),
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return "Required";
                            }
                            // if (val!.length != 6) {
                            //   return "Invalid pincode";
                            // }
                            return null;
                          },
                          decoration: InputDecoration(
                            // prefix: const Text('+91  '),
                            labelStyle: TextStyle(
                              color: Colors.white54,
                              fontSize: AppTextTheme
                                  .newTextThemeDark.bodyLarge!.fontSize,
                            ),
                            labelText: "Set Password",
                            focusedErrorBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.orangeAccent)),
                            errorBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.orangeAccent)),
                            errorStyle:
                                const TextStyle(color: Colors.orangeAccent),
                            enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white54)),
                            focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue)),
                          ),
                        ),
                        SizedBox(
                          height: Responsive.safeBlockVerticalWAB * 2.5,
                        ),
                        TextFormField(
                          controller:
                              registrationController.conFirmPasswordController,
                          // keyboardType: TextInputType.number,
                          style: const TextStyle(
                            color: Colors.white54,
                          ),
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return "Required";
                            }

                            if (val !=
                                registrationController
                                    .passwordController.text) {
                              return 'Password did not match!!!';
                            }

                            // if (val!.length != 6) {
                            //   return "Invalid pincode";
                            // }
                            return null;
                          },
                          decoration: InputDecoration(
                            // prefix: const Text('+91  '),
                            labelStyle: TextStyle(
                              color: Colors.white54,
                              fontSize: AppTextTheme
                                  .newTextThemeDark.bodyLarge!.fontSize,
                            ),
                            labelText: "Confirm Password",
                            focusedErrorBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.orangeAccent)),
                            errorBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.orangeAccent)),
                            errorStyle:
                                const TextStyle(color: Colors.orangeAccent),
                            enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white54)),
                            focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue)),
                          ),
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(6)
                          ],
                        ),
                        SizedBox(
                          height: Responsive.safeBlockVerticalWAB * 20.5,
                        ),
                        if (MediaQuery.of(context).viewInsets.bottom <= 0)
                          SizedBox(
                            width: double.infinity,
                            child: OutlinedButton(
                              onPressed: () =>
                                  registrationController.saveData(),
                              style: OutlinedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5))),
                              child: const Text('SAVE'),
                            ),
                          ),
                        if (MediaQuery.of(context).viewInsets.bottom <= 0)
                          SizedBox(
                            height: Responsive.safeBlockVerticalWAB * 10,
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Action : SaveCompnay
// string Comp_name = string.Empty;
// string MobileNo = string.Empty;
// string adddress = string.Empty;
// string Password = string.Empty;
//
// string ContactNo = string.Empty;
// string ZoneID = string.Empty;
// string CityID = string.Empty;
// string CateID = string.Empty;
//
// string SubCatID = string.Empty;
// string Pincode = string.Empty;
// string BookingNAme = string.Empty;
//
// string Designation = string.Empty;
// string Email = string.Empty;
//
//
// --------------
//
// Action :StateList
//
// ----------
//
// action : CityList
// StateID
// --------------
//
// action :BuisNessCategoryList
// ------------------
//
// action :BuisNessSubCategoryList
// CatID
