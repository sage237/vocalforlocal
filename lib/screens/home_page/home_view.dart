import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocalforlocal/screens/home_page/home_controller.dart';
import 'package:vocalforlocal/utils/screen_util.dart';
import 'package:vocalforlocal/widgets/search_widget.dart';

import '../../core_theme/text_theme.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find();

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            expandedHeight: Responsive.safeBlockHorizontal * 18.8 * 3 +
                AppBar().preferredSize.height * 1.2,
            floating: false,
            pinned: true,
            elevation: 50,
            backgroundColor: Colors.black,
            flexibleSpace: const MyAppSpace(),
          ),

          ///Above Category Design
          SliverToBoxAdapter(
            child: Padding(
              padding:
                  EdgeInsets.only(top: Responsive.safeBlockVerticalWAB * 4),
              child: Container(
                height: Responsive.safeBlockHorizontal * 10,
                decoration: const BoxDecoration(
                    border: Border(top: BorderSide(color: Colors.grey)),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20))),
                child: Center(
                  child: Divider(
                    thickness: Responsive.safeBlockVerticalWAB / 1.5,
                    indent: Responsive.safeBlockHorizontal * 40,
                    endIndent: Responsive.safeBlockHorizontal * 40,
                  ),
                ),
              ),
            ),
          ),

          ///Category Module
          SliverToBoxAdapter(
            child: Obx(
              () => homeController.catLoading.value
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: Responsive.safeBlockHorizontal * 3),
                          child: Row(
                            children: [
                              Text(
                                'Categories',
                                style:
                                    AppTextTheme.newTextThemeDark.headlineSmall,
                              ),
                              const Spacer(),
                              Padding(
                                padding: EdgeInsets.only(
                                    right: Responsive.safeBlockHorizontal * 3),
                                child: const Icon(Icons.keyboard_arrow_right),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: Responsive.safeBlockVerticalWAB * 3,
                        ),
                        Center(
                          child: Wrap(
                            children: homeController.categories
                                .map((f) => GestureDetector(
                                      child: SizedBox(
                                        width: Responsive.safeBlockHorizontal *
                                            18.8,
                                        child: Center(
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              children: [
                                                Image.network(
                                                  'https://askbni.in/${f.cateImage}',
                                                  height: Responsive
                                                          .safeBlockVerticalWAB *
                                                      8,
                                                  errorBuilder: (a, b, c) =>
                                                      Icon(
                                                    Icons.category_outlined,
                                                    size: Responsive
                                                            .safeBlockHorizontal *
                                                        8,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: Responsive
                                                          .safeBlockVerticalWAB /
                                                      2,
                                                ),
                                                Text(
                                                  f.cateName,
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontSize: Responsive
                                                              .safeBlockVerticalWAB *
                                                          1.1,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ))
                                .toList(),
                          ),
                        ),
                      ],
                    ),
            ),
          ),

          ///Popular product Module
          SliverToBoxAdapter(
            child: Obx(
              () => homeController.catLoading.value
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: Responsive.safeBlockHorizontal * 3),
                      child: Column(
                        children: [
                          SizedBox(
                            height: Responsive.safeBlockVerticalWAB * 5,
                          ),
                          Row(
                            children: [
                              Text(
                                'Popular Products',
                                style:
                                    AppTextTheme.newTextThemeDark.headlineSmall,
                              ),
                              const Spacer(),
                              Padding(
                                padding: EdgeInsets.only(
                                    right: Responsive.safeBlockHorizontal * 3),
                                child: const Icon(Icons.keyboard_arrow_right),
                              )
                            ],
                          ),
                          SizedBox(
                            height: Responsive.safeBlockVerticalWAB * 3,
                          ),
                          SizedBox(
                            height: Responsive.safeBlockVerticalWAB * 20,
                            // color: Colors.red,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  width: Responsive.safeBlockVerticalWAB * 20,
                                  height: Responsive.safeBlockVerticalWAB * 20,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(color: Colors.grey),
                                      image: DecorationImage(
                                          image: AssetImage(
                                            'assets/images/products/product${index + 1}.jpg',
                                          ),
                                          fit: BoxFit.cover)),
                                );
                                // return Image.asset(
                                //   'assets/images/offers/offer${index + 1}.jpeg',
                                //   width: Responsive.safeBlockHorizontal * 75,
                                // );
                              },
                              separatorBuilder: (context, index) => SizedBox(
                                width: Responsive.safeBlockHorizontal * 3,
                              ),
                              itemCount: 5,
                            ),
                          ),
                        ],
                      ),
                    ),
            ),
          ),

          ///Offers Module
          SliverToBoxAdapter(
            child: Obx(
              () => homeController.catLoading.value
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: Responsive.safeBlockHorizontal * 3),
                      child: Column(
                        children: [
                          SizedBox(
                            height: Responsive.safeBlockVerticalWAB * 3,
                          ),
                          Row(
                            children: [
                              Text(
                                'Offers For You',
                                style:
                                    AppTextTheme.newTextThemeDark.headlineSmall,
                              ),
                              const Spacer(),
                              Padding(
                                padding: EdgeInsets.only(
                                    right: Responsive.safeBlockHorizontal * 3),
                                child: const Icon(Icons.keyboard_arrow_right),
                              )
                            ],
                          ),
                          SizedBox(
                            height: Responsive.safeBlockVerticalWAB * 3,
                          ),
                          SizedBox(
                            height: Responsive.safeBlockVerticalWAB * 20,
                            // color: Colors.red,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  width: Responsive.safeBlockHorizontal * 70,
                                  height: Responsive.safeBlockVerticalWAB * 20,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(color: Colors.grey),
                                      image: DecorationImage(
                                          image: AssetImage(
                                            'assets/images/offers/offer${index + 1}.jpeg',
                                          ),
                                          fit: BoxFit.cover)),
                                );
                                // return Image.asset(
                                //   'assets/images/offers/offer${index + 1}.jpeg',
                                //   width: Responsive.safeBlockHorizontal * 75,
                                // );
                              },
                              separatorBuilder: (context, index) => SizedBox(
                                width: Responsive.safeBlockHorizontal * 3,
                              ),
                              itemCount: 3,
                            ),
                          ),
                        ],
                      ),
                    ),
            ),
          ),

          ///Stores NearBy
          SliverToBoxAdapter(
            child: Obx(
              () => homeController.catLoading.value
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: Responsive.safeBlockHorizontal * 3),
                      child: Column(
                        children: [
                          SizedBox(
                            height: Responsive.safeBlockVerticalWAB * 3,
                          ),
                          Row(
                            children: [
                              Text(
                                'Stores Nearby',
                                style:
                                    AppTextTheme.newTextThemeDark.headlineSmall,
                              ),
                              const Spacer(),
                              Padding(
                                padding: EdgeInsets.only(
                                    right: Responsive.safeBlockHorizontal * 3),
                                child: const Icon(Icons.keyboard_arrow_right),
                              )
                            ],
                          ),
                          SizedBox(
                            height: Responsive.safeBlockVerticalWAB * 3,
                          ),
                        ],
                      ),
                    ),
            ),
          ),

          SliverFixedExtentList(
            itemExtent: 200.0,
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(15)),
                  alignment: Alignment.center,
                  child: Text('Shop ${index + 1}'),
                ),
              );
            }, childCount: 20),
          ),
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200.0,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 4.0,
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
                  color: Colors.teal[100 * (index % 9)],
                  child: Text('Grid Item ${index + 1}'),
                );
              },
              childCount: 20,
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              color: Colors.amberAccent,
              child: const Text('This is Container'),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 100.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return SizedBox(
                    width: 100.0,
                    child: Card(
                      color: Colors.cyan[100 * (index % 9)],
                      child: Text('Item $index'),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );

    // return Scaffold(
    //   body: CustomScrollView(
    //     slivers: [
    //       SliverAppBar(
    //         pinned: true,
    //         snap: false,
    //         floating: false,
    //         title: const SearchWidget(),
    //         automaticallyImplyLeading: false,
    //         backgroundColor: Colors.black38,
    //         expandedHeight: Responsive.safeBlockHorizontal * 18.8 * 3 +
    //             AppBar().preferredSize.height,
    //         flexibleSpace: Column(
    //           mainAxisSize: MainAxisSize.min,
    //           crossAxisAlignment: CrossAxisAlignment.end,
    //           children: [
    //             SizedBox(
    //               height: AppBar().preferredSize.height,
    //             ),
    //
    //             SizedBox(
    //               height: Responsive.safeBlockVerticalWAB * 3.5,
    //             ),
    //             // Align(
    //             //   alignment: Alignment.centerLeft,
    //             //   child: Text(
    //             //     '   Categories',
    //             //     style: Theme.of(context)
    //             //         .textTheme
    //             //         .headlineMedium
    //             //         ?.copyWith(fontWeight: FontWeight.bold),
    //             //   ),
    //             // ),
    //             // SizedBox(
    //             //   height: Responsive.safeBlockVerticalWAB * 3.5,
    //             // ),
    //             Expanded(
    //               child: Obx(
    //                 () => homeController.catLoading.value
    //                     ? const Center(
    //                         child: CircularProgressIndicator(),
    //                       )
    //                     : Center(
    //                         child: Wrap(
    //                           children: homeController.categories
    //                               .map((f) => GestureDetector(
    //                                     child: SizedBox(
    //                                       width:
    //                                           Responsive.safeBlockHorizontal *
    //                                               18.8,
    //                                       child: Center(
    //                                         child: Padding(
    //                                           padding:
    //                                               const EdgeInsets.all(8.0),
    //                                           child: Column(
    //                                             children: [
    //                                               Image.network(
    //                                                 'https://askbni.in/${f.cateImage}',
    //                                                 height: Responsive
    //                                                         .safeBlockVerticalWAB *
    //                                                     8,
    //                                                 errorBuilder: (a, b, c) =>
    //                                                     Icon(
    //                                                   Icons.category_outlined,
    //                                                   size: Responsive
    //                                                           .safeBlockHorizontal *
    //                                                       8,
    //                                                 ),
    //                                               ),
    //                                               SizedBox(
    //                                                 height: Responsive
    //                                                         .safeBlockVerticalWAB /
    //                                                     2,
    //                                               ),
    //                                               Text(
    //                                                 f.cateName,
    //                                                 textAlign: TextAlign.center,
    //                                                 style: TextStyle(
    //                                                     fontSize: Responsive
    //                                                             .safeBlockVerticalWAB *
    //                                                         1.1,
    //                                                     fontWeight:
    //                                                         FontWeight.bold),
    //                                               )
    //                                             ],
    //                                           ),
    //                                         ),
    //                                       ),
    //                                     ),
    //                                   ))
    //                               .toList(),
    //                         ),
    //                       ),
    //               ),
    //             )
    //           ],
    //         ),
    //       ),
    //       SliverList(
    //         delegate: SliverChildBuilderDelegate(
    //             (context, index) => ListTile(
    //                   title: Text('$index'),
    //                 ),
    //             childCount: 10000),
    //       )
    //     ],
    //   ),
    // );
    //
    // return Scaffold(
    //   // backgroundColor: Colors.white,
    //   // appBar: AppBar(
    //   //   title: Padding(
    //   //     padding: const EdgeInsets.all(8.0),
    //   //     child: Image.asset('assets/images/logo1.png'),
    //   //   ),
    //   // ),
    //   body: SafeArea(
    //     child: Padding(
    //       padding: EdgeInsets.symmetric(
    //           horizontal: Responsive.safeBlockHorizontal * 3),
    //       child: Column(
    //         // mainAxisSize: MainAxisSize.min,
    //         crossAxisAlignment: CrossAxisAlignment.end,
    //         children: [
    //           SizedBox(
    //             height: AppBar().preferredSize.height,
    //           ),
    //           const SearchWidget(),
    //           SizedBox(
    //             height: Responsive.safeBlockVerticalWAB * 3.5,
    //           ),
    //           // Align(
    //           //   alignment: Alignment.centerLeft,
    //           //   child: Text(
    //           //     '   Categories',
    //           //     style: Theme.of(context)
    //           //         .textTheme
    //           //         .headlineMedium
    //           //         ?.copyWith(fontWeight: FontWeight.bold),
    //           //   ),
    //           // ),
    //           // SizedBox(
    //           //   height: Responsive.safeBlockVerticalWAB * 3.5,
    //           // ),
    //           Expanded(
    //             child: Obx(
    //               () => homeController.catLoading.value
    //                   ? const Center(
    //                       child: CircularProgressIndicator(),
    //                     )
    //                   : SingleChildScrollView(
    //                       child: Wrap(
    //                         children: homeController.categories
    //                             .map((f) => GestureDetector(
    //                                   child: SizedBox(
    //                                     width: Responsive.safeBlockHorizontal *
    //                                         23.5,
    //                                     child: Center(
    //                                       child: Column(
    //                                         children: [
    //                                           Image.network(
    //                                             'https://askbni.in/${f.cateImage}',
    //                                             errorBuilder: (a, b, c) => Icon(
    //                                               Icons.category_outlined,
    //                                               size: Responsive
    //                                                       .safeBlockHorizontal *
    //                                                   8,
    //                                               color: Colors.black,
    //                                             ),
    //                                           ),
    //                                           Text(
    //                                             f.cateName,
    //                                             style: const TextStyle(
    //                                                 color: Colors.black,
    //                                                 fontWeight:
    //                                                     FontWeight.bold),
    //                                           )
    //                                         ],
    //                                       ),
    //                                     ),
    //                                   ),
    //                                 ))
    //                             .toList(),
    //                       ),
    //                     ),
    //             ),
    //           )
    //         ],
    //       ),
    //     ),
    //   ),
    // );
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

class MyAppSpace extends StatelessWidget {
  const MyAppSpace({super.key});

  final SearchWidget widgetS = const SearchWidget();

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.find();
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Responsive.safeBlockHorizontal * 3,
            vertical: Responsive.safeBlockVerticalWAB),
        child: LayoutBuilder(
          builder: (context, c) {
            final settings = context
                .dependOnInheritedWidgetOfExactType<FlexibleSpaceBarSettings>();
            final deltaExtent = settings!.maxExtent - settings.minExtent;
            final t = (1.0 -
                    (settings.currentExtent - settings.minExtent) / deltaExtent)
                .clamp(0.0, 1.0);
            final fadeStart = math.max(0.0, 1.0 - kToolbarHeight / deltaExtent);
            const fadeEnd = 1.0;
            final opacity = 1.0 - Interval(fadeStart, fadeEnd).transform(t);

            return Stack(
              children: [
                Opacity(opacity: 1 - opacity, child: widgetS),
                Opacity(
                  opacity: opacity,
                  child: Column(
                    children: [
                      widgetS,
                      Expanded(
                        child: Obx(
                          () => homeController.catLoading.value
                              ? const Center(
                                  child: CircularProgressIndicator(),
                                )
                              : Center(
                                  child: Wrap(
                                    children: homeController.categories
                                        .map((f) => GestureDetector(
                                              child: SizedBox(
                                                width: Responsive
                                                        .safeBlockHorizontal *
                                                    18.8,
                                                child: Center(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Column(
                                                      children: [
                                                        Image.network(
                                                          'https://askbni.in/${f.cateImage}',
                                                          height: Responsive
                                                                  .safeBlockVerticalWAB *
                                                              8,
                                                          errorBuilder:
                                                              (a, b, c) => Icon(
                                                            Icons
                                                                .category_outlined,
                                                            size: Responsive
                                                                    .safeBlockHorizontal *
                                                                8,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: Responsive
                                                                  .safeBlockVerticalWAB /
                                                              2,
                                                        ),
                                                        Text(
                                                          f.cateName,
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                              fontSize: Responsive
                                                                      .safeBlockVerticalWAB *
                                                                  1.1,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ))
                                        .toList(),
                                  ),
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
