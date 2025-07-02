import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lms_user_app/feature/courses/course_screen.dart';
import 'package:lms_user_app/feature/enrollment/enrollment_screen.dart';
import 'package:lms_user_app/feature/home/home_screen.dart';
import 'package:lms_user_app/feature/menu/menu_screen.dart';
import 'package:lms_user_app/feature/profile/profile_screen.dart';
import 'package:lms_user_app/repository/auth_repo.dart';
import 'package:lms_user_app/utils/dimensions.dart';
import 'package:lms_user_app/utils/images.dart';
import 'package:lms_user_app/utils/styles.dart';

class MainScreen extends StatefulWidget {
  final int pageIndex;

  const MainScreen({Key? key, required this.pageIndex}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  PageController? _pageController;
  int _currentIndex = 0;
  late List<Widget> _screens;

  @override
  void initState() {
    _currentIndex = widget.pageIndex;

    _pageController = PageController(initialPage: widget.pageIndex);

    _screens = [
      const HomeScreen(),
      const EnrollmentScreen(),
      //const ExploreScreen(),
      //const MyCourseScreen(),
      CourseScreen(),
      const ProfileScreen(),
    ];

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if(_currentIndex != 0){
          _setPage(0);
          return false;
        }else{
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('back_press_again_to_exit'.tr, style: const TextStyle(color: Colors.white)),
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.amber,
            duration: const Duration(seconds: 2),
            margin: const EdgeInsets.all(Dimensions.paddingSizeSmall),
          ));
          Timer(const Duration(seconds: 2), () {
          });
          return false;
        }
      },
      child: Scaffold(
        body: PageView.builder(
            controller: _pageController,
            onPageChanged: _setPage,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index){
              return _screens[index];
            },
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Get.isDarkMode ? Theme.of(context).primaryColor:Theme.of(context).cardColor,
          selectedFontSize: 12,
          selectedLabelStyle: poppinsMedium.copyWith(
              fontSize: Dimensions.fontSizeSmall,
              color: Get.isDarkMode ? Theme.of(context).colorScheme.primary:Theme.of(context).primaryColor,
          ),
          unselectedItemColor: Theme.of(context).textTheme.bodyLarge!.color,
          selectedItemColor: Get.isDarkMode ? Theme.of(context).colorScheme.primary:Theme.of(context).primaryColor,
          unselectedLabelStyle: poppinsMedium.copyWith(
              fontSize: Dimensions.fontSizeSmall,
              color: Theme.of(context).textTheme.bodyLarge!.color),
          elevation: 5.0,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          onTap: (index) => _setPage(index),
          items:  <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                  Images.home,
                color: Theme.of(context).textTheme.bodyLarge!.color!,
              ),
              activeIcon: SvgPicture.asset(Images.home,
                color: Get.isDarkMode ? Theme.of(context).colorScheme.primary:Theme.of(context).primaryColor,),
              label: 'dashboard'.tr,
              backgroundColor: Theme.of(context).cardColor,
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(Images.explore ,color: Theme.of(context).textTheme.bodyLarge!.color!,),
              activeIcon: SvgPicture.asset(Images.explore,
                color: Get.isDarkMode ? Theme.of(context).colorScheme.primary:Theme.of(context).primaryColor,),
              label: 'enrollment'.tr,
              backgroundColor: Theme.of(context).cardColor,
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(Images.myCourse,color: Theme.of(context).textTheme.bodyLarge!.color!,),
              activeIcon: SvgPicture.asset(Images.myCourse,
                  color: Get.isDarkMode ? Theme.of(context).colorScheme.primary:Theme.of(context).primaryColor,),
              label: 'courses'.tr,
              backgroundColor: Theme.of(context).cardColor,
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(Images.more,color: Theme.of(context).textTheme.bodyLarge!.color!,),
              activeIcon: SvgPicture.asset(Images.more,
                  color: Get.isDarkMode ? Theme.of(context).colorScheme.primary:Theme.of(context).primaryColor,),
              label: 'more'.tr,
              backgroundColor: Theme.of(context).cardColor,
            ),
          ],
        ),
      ),
    );
  }
  void _setPage(int pageIndex) {
    if(pageIndex==3) {
      Get.bottomSheet(const MenuScreen(),
        backgroundColor: Colors.transparent,
        isScrollControlled: true);
    }else{
      setState(() {
        _pageController!.jumpToPage(pageIndex);
        _currentIndex = pageIndex;
      });
    }
  }
}
