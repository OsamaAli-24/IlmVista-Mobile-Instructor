import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lms_user_app/components/custom_app_bar.dart';
import 'package:lms_user_app/data/model/notification_model.dart'
    as notification;
import '../../components/loading_indicator.dart';
import '../../controller/notification_controller.dart';
import '../../utils/dimensions.dart';
import '../../utils/images.dart';
import '../../utils/styles.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          title: 'notification'.tr,
          centerTitle: false,
          bgColor: Theme.of(context).cardColor,
          titleColor: Theme.of(context).textTheme.bodyLarge!.color!,
        ),
        body: GetBuilder<NotificationController>(
            initState: (state) =>
                Get.find<NotificationController>().getNotificationList(),
            builder: (controller) {
              return controller.isLoading
                  ? const LoadingIndicator()
                  : notificationSection(context, controller);
            }));
  }

  notificationSection(BuildContext context, NotificationController controller) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: controller.isLoading
          ? const LoadingIndicator()
          : controller.notificationList.isEmpty
              ? noDataWidget()
              : ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.notificationList.length,
                  physics: const ClampingScrollPhysics(),
                  itemBuilder: (context, index) =>
                      item(context, controller.notificationList[index]),
                ),
    );
  }

  Widget item(BuildContext context, notification.Notification notification) {
    return ListTile(
      leading: generateLeading(),
      title: Text(notification.title ?? ''),
      titleTextStyle: poppinsRegular.copyWith(color: Colors.black),
      trailing: Text(
        notification.date ?? '',
        style: poppinsRegular.copyWith(
            fontSize: Dimensions.fontSizeSmall,
            color: Theme.of(context)
                .textTheme
                .titleSmall!
                .color!
                .withOpacity(0.6)),
      ),
    );
  }

  Widget generateLeading() {
    return CircleWithIcon(
      color: Colors.green,
      icon: Images.notification,
    );
  }

  Widget noDataWidget() {
    return Center(
      child: Text(
        'no_notification'.tr,
        style: poppinsRegular,
      ),
    );
  }
}

class CircleWithIcon extends StatelessWidget {
  final Color color;
  final String icon;
  const CircleWithIcon({super.key, required this.color, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 46,
      height: 46,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color.withOpacity(0.1),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color,
            ),
          ),
          SvgPicture.asset(
            icon,
            height: 10,
            width: 10,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
