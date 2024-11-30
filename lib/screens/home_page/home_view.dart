import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocalforlocal/screens/home_page/home_controller.dart';
import 'package:vocalforlocal/utils/screen_util.dart';
import 'package:vocalforlocal/widgets/search_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find();
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            title: const SearchWidget(),
            automaticallyImplyLeading: false,
            backgroundColor: Colors.black38,
            expandedHeight: 500,
            flexibleSpace: Column(
              // mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(
                  height: AppBar().preferredSize.height,
                ),

                SizedBox(
                  height: Responsive.safeBlockVerticalWAB * 3.5,
                ),
                // Align(
                //   alignment: Alignment.centerLeft,
                //   child: Text(
                //     '   Categories',
                //     style: Theme.of(context)
                //         .textTheme
                //         .headlineMedium
                //         ?.copyWith(fontWeight: FontWeight.bold),
                //   ),
                // ),
                // SizedBox(
                //   height: Responsive.safeBlockVerticalWAB * 3.5,
                // ),
                Expanded(
                  child: Obx(
                    () => homeController.catLoading.value
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : SingleChildScrollView(
                            child: Wrap(
                              children: homeController.categories
                                  .map((f) => GestureDetector(
                                        child: SizedBox(
                                          width:
                                              Responsive.safeBlockHorizontal *
                                                  23.5,
                                          child: Center(
                                            child: Column(
                                              children: [
                                                Image.network(
                                                  'https://askbni.in/${f.cateImage}',
                                                  errorBuilder: (a, b, c) =>
                                                      Icon(
                                                    Icons.category_outlined,
                                                    size: Responsive
                                                            .safeBlockHorizontal *
                                                        8,
                                                  ),
                                                ),
                                                Text(
                                                  f.cateName,
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontSize:
                                                          Theme.of(context)
                                                              .textTheme
                                                              .bodySmall!
                                                              .fontSize,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ))
                                  .toList(),
                            ),
                          ),
                  ),
                )
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                (context, index) => ListTile(
                      title: Text('$index'),
                    ),
                childCount: 10000),
          )
        ],
      ),
    );

    return Scaffold(
      // backgroundColor: Colors.white,
      // appBar: AppBar(
      //   title: Padding(
      //     padding: const EdgeInsets.all(8.0),
      //     child: Image.asset('assets/images/logo1.png'),
      //   ),
      // ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Responsive.safeBlockHorizontal * 3),
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                height: AppBar().preferredSize.height,
              ),
              const SearchWidget(),
              SizedBox(
                height: Responsive.safeBlockVerticalWAB * 3.5,
              ),
              // Align(
              //   alignment: Alignment.centerLeft,
              //   child: Text(
              //     '   Categories',
              //     style: Theme.of(context)
              //         .textTheme
              //         .headlineMedium
              //         ?.copyWith(fontWeight: FontWeight.bold),
              //   ),
              // ),
              // SizedBox(
              //   height: Responsive.safeBlockVerticalWAB * 3.5,
              // ),
              Expanded(
                child: Obx(
                  () => homeController.catLoading.value
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : SingleChildScrollView(
                          child: Wrap(
                            children: homeController.categories
                                .map((f) => GestureDetector(
                                      child: SizedBox(
                                        width: Responsive.safeBlockHorizontal *
                                            23.5,
                                        child: Center(
                                          child: Column(
                                            children: [
                                              Image.network(
                                                'https://askbni.in/${f.cateImage}',
                                                errorBuilder: (a, b, c) => Icon(
                                                  Icons.category_outlined,
                                                  size: Responsive
                                                          .safeBlockHorizontal *
                                                      8,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              Text(
                                                f.cateName,
                                                style: const TextStyle(
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ))
                                .toList(),
                          ),
                        ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Material customContainer(
      {required double height, required double width, required child}) {
    return Material(
      elevation: 6,
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      child: Container(
        height: Responsive.safeBlockVertical * height,
        width: Responsive.safeBlockVertical * width,
        decoration: BoxDecoration(
          color: const Color(0xffCF202F).withOpacity(.9),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: Center(
          child: child,
        ),
      ),
    );
  }
}
