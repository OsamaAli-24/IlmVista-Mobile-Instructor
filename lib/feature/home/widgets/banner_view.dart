// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:lms_user_app/components/custom_image.dart';
// import 'package:lms_user_app/controller/home_controller.dart';
// import 'package:lms_user_app/controller/theme_controller.dart';
// import 'package:lms_user_app/core/helper/responsive_helper.dart';
// import 'package:lms_user_app/utils/dimensions.dart';
// import 'package:lms_user_app/utils/images.dart';
// import 'package:shimmer_animation/shimmer_animation.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';
// import 'package:lms_user_app/data/model/home_data_model/slider.dart'
//     as homeSlider;
//
// class BannerView extends StatelessWidget {
//   final int bannerIndex;
//   const BannerView({super.key, required this.bannerIndex});
//
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<HomeController>(
//       builder: (bannerController) {
//         return (bannerController.homeModel?.data?[bannerIndex].sliders ==
//                     null &&
//                 bannerController.homeModel!.data![bannerIndex].sliders!.isEmpty)
//             ? const SizedBox()
//             : SizedBox(
//                 width: MediaQuery.of(context).size.width,
//                 height: ResponsiveHelper.isTab(context) ||
//                         MediaQuery.of(context).size.width > 450 ? 350
//                     : MediaQuery.of(context).size.width * 0.45,
//                 child: bannerController.homeModel?.data?[bannerIndex].sliders !=
//                         null
//                     ? Column(
//                         crossAxisAlignment: CrossAxisAlignment.stretch,
//                         children: [
//                           Expanded(
//                             child: CarouselSlider.builder(
//                               options: CarouselOptions(
//                                 autoPlay: true,
//                                 enlargeCenterPage: false,
//                                 viewportFraction: .95,
//                                 disableCenter: true,
//                                 autoPlayInterval: const Duration(seconds: 7),
//                                 onPageChanged: (index, reason) {
//                                   bannerController.setCurrentIndex(index, true);
//                                 },
//                               ),
//                               itemCount: bannerController.homeModel
//                                   ?.data?[bannerIndex].sliders?.length,
//                               itemBuilder: (context, index, _) {
//                                 List<homeSlider.Slider> sliders =
//                                     bannerController
//                                         .homeModel!.data![bannerIndex].sliders!;
//                                 return InkWell(
//                                   onTap: () {
//                                     // String link = bannerModel.redirectLink != null ? bannerModel.redirectLink! : '';
//                                     // String id = bannerModel.category != null ? bannerModel.category!.id! : '';
//                                     // String name = bannerModel.category != null ? bannerModel.category!.name! : "";
//                                     // bannerController.navigateFromBanner(bannerModel.resourceType!, id, link, bannerModel.resourceId != null ? bannerModel.resourceId! : '', categoryName: name);
//                                   },
//                                   child: Padding(
//                                     padding: const EdgeInsets.symmetric(
//                                         horizontal:
//                                             Dimensions.paddingSizeExtraSmall,
//                                     vertical: Dimensions.paddingSizeExtraSmall),
//                                     child: Container(
//                                       decoration: BoxDecoration(
//                                         color: Theme.of(context).cardColor,
//                                         borderRadius: BorderRadius.circular(
//                                             Dimensions.radiusSmall),
//                                       ),
//                                       child: ClipRRect(
//                                         borderRadius: BorderRadius.circular(
//                                             Dimensions.radiusSmall),
//                                         child: CustomImage(
//                                           image: sliders.elementAt(bannerController.currentIndex!)
//                                                   .image ?? "",
//                                           fit: BoxFit.cover,
//                                           placeholder: Images.dummyBanner,
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 );
//                               },
//                             ),
//                           ),
//                           const SizedBox(height: Dimensions.paddingSizeSmall),
//                           Align(
//                             alignment: Alignment.center,
//                             child: AnimatedSmoothIndicator(
//                               activeIndex: bannerController.currentIndex!,
//                               //activeIndex: 0,
//                               count: bannerController.homeModel!
//                                       .data![bannerIndex].sliders?.length ?? 0,
//                               effect: ExpandingDotsEffect(
//                                 dotHeight: 5,
//                                 dotWidth: 5,
//                                 activeDotColor: Theme.of(context).primaryColor,
//                                 dotColor: Theme.of(context).disabledColor,
//                               ),
//                             ),
//                           ),
//                         ],
//                       )
//                     : Shimmer(
//                         duration: const Duration(seconds: 2),
//                         enabled: true,
//                         child: Container(
//                           margin: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeSmall),
//                           decoration: BoxDecoration(
//                             borderRadius:
//                                 BorderRadius.circular(Dimensions.radiusSmall),
//                             color: Colors.grey[
//                                 Get.find<ThemeController>().darkTheme
//                                     ? 700 : 300],
//                           ),
//                         ),
//                       ),
//               );
//       },
//     );
//   }
// }
