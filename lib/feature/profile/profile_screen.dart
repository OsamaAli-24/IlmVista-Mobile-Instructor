 import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lms_user_app/core/helper/route_helper.dart';
import 'package:lms_user_app/feature/home/widgets/my_course_widget.dart';
import 'package:lms_user_app/feature/profile/widgets/other_benefit.dart';
import 'package:lms_user_app/feature/profile/widgets/profile_app_bar_content.dart';
import 'package:lms_user_app/utils/dimensions.dart';
import 'package:lms_user_app/utils/images.dart';
import 'package:lms_user_app/utils/styles.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> with TickerProviderStateMixin{
  late ScrollController _scrollController;
  bool lastStatus = true;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: NestedScrollView(
            controller: _scrollController,
            floatHeaderSlivers: false,
            headerSliverBuilder: (context, bool innerBoxIsScrolled){
              return [
                SliverAppBar(
                  expandedHeight: 200,
                  elevation: 0.0,
                  pinned: true,
                  backgroundColor: Theme.of(context).primaryColor,
                  leading: IconButton(
                    icon:  const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                    onPressed: (){
                      Get.back();
                    },
                  ),
                  title: SABT(
                    child: Text('Alexa Deo',
                      textAlign: TextAlign.start,
                      style: poppinsSemiBold.copyWith(
                          color: Colors.white,
                          fontSize: Dimensions.fontSizeDefault),
                    ),
                  ),
                  actions: [
                    IconButton(
                        onPressed: (){
                          Get.toNamed(RouteHelper.editProfileScreen);
                        },
                        splashRadius: 20,
                        icon: SvgPicture.asset(Images.editProfile),
                    )
                  ],

                  flexibleSpace: const FlexibleSpaceBar(
                    expandedTitleScale: 1,
                    background: PreferredSize(
                      preferredSize: Size.fromHeight(226),
                      child: ProfileAppBarContent(),
                    ),
                    collapseMode: CollapseMode.parallax,
                  ),
                ),
              ];
            },
            body: Column(
              children: [
                const SizedBox(height: Dimensions.paddingSizeSmall,),
                const MyCourseWidget(),
                OtherBenefit()
              ],
            ),
        ),
    );
  }
}

 class Delegate extends SliverPersistentHeaderDelegate {
   final double height;
   final Widget widget;


   Delegate({
     required this.height,
     required this.widget});

   @override
   Widget build(BuildContext context, double shrinkOffset,
       bool overlapsContent) {
     return widget;
   }

   @override
   double get maxExtent => height;

   @override
   double get minExtent => height;

   @override
   bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
     return true;
   }
 }


 class SABT extends StatefulWidget {
   final Widget child;
   const SABT({
     Key? key,
     required this.child,
   }) : super(key: key);
   @override
   subState createState() {
     return subState();
   }
 }
 class subState extends State<SABT> {
   ScrollPosition? _position;
   bool? _visible;
   @override
   void dispose() {
     _removeListener();
     super.dispose();
   }
   @override
   void didChangeDependencies() {
     super.didChangeDependencies();
     _removeListener();
     _addListener();
   }
   void _addListener() {
     _position = Scrollable.of(context).position;
     _position?.addListener(_positionListener);
     _positionListener();
   }
   void _removeListener() {
     _position?.removeListener(_positionListener);
   }
   void _positionListener() {
     final FlexibleSpaceBarSettings? settings =
     context.dependOnInheritedWidgetOfExactType<FlexibleSpaceBarSettings>();
     bool visible = settings == null || settings.currentExtent <= settings.minExtent;
     if (_visible != visible) {
       setState(() {
         _visible = visible;
       });
     }
   }
   @override
   Widget build(BuildContext context) {
     return Visibility(
       visible: _visible!,
       child: widget.child,
     );
   }
 }


 /*  return Scaffold(
      appBar: const ProfileAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  [
          const SizedBox(height: Dimensions.paddingSizeDefault,),
          const MyCourseWidget(),
          //const SizedBox(height: Dimensions.paddingSizeExtraLarge),
          //const MyCertificatesWidget(),
          OtherBenefit(),
        ],
      ),
    );*/