import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lms_user_app/data/model/instructor/Instructor_profile_data.dart';
import 'package:lms_user_app/utils/dimensions.dart';
import 'package:lms_user_app/utils/images.dart';
import 'package:lms_user_app/utils/styles.dart';


class InstructorAppBarBody extends StatelessWidget
    implements PreferredSizeWidget {
  final bool? backButton;
  final InstructorProfileData profileData;
  const InstructorAppBarBody(
      {super.key, this.backButton = true, required this.profileData});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 30,
            child: ClipOval(
                child: Image.network(
              profileData.profilePic!,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) =>
                  Image.asset(Images.placeholderSquare),
              height: 50,
              width: 50,
            )),
          ),
        ),
        const SizedBox(height: Dimensions.paddingSizeSmall),
        Text(
          "${profileData.firstName!} ${profileData.lastName!}",
          style: poppinsSemiBold.copyWith(
              color: Theme.of(context).textTheme.bodyLarge!.color!,
              fontSize: Dimensions.fontSizeDefault),
        ),
        const SizedBox(height: Dimensions.paddingSizeExtraSmall),
        Text(
          profileData.designation!,
          style: poppinsRegular.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontSize: Dimensions.fontSizeExtraSmall),
        ),
        const SizedBox(height: Dimensions.paddingSizeExtraSmall),
        SizedBox(
          width: width / 2,
          child: Text(
            "profileData.about",
            textAlign: TextAlign.center,
            style: poppinsRegular.copyWith(
                color: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .color!
                    .withOpacity(0.5),
                fontSize: Dimensions.fontSizeSmall),
          ),
        ),
        const SizedBox(height: Dimensions.paddingSizeDefault),
        socialMediaWidget()
      ],
    );
  }

  Row socialMediaWidget() {
    List<Widget> widgets = [];
    widgets.addAll(
        profileData.socialLinks!.map((link) => socialMediaItem(link)).toList());
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: widgets);
  }

  Widget socialMediaItem(SocialLinks socialLink) {
    if (socialLink.name!.toLowerCase().contains("facebook")) {
      return Padding(
        padding: const EdgeInsets.only(right: 12),
        child: SvgPicture.asset(Images.facebook, height: 15),
      );
    } else if (socialLink.name!.toLowerCase().contains("twitter")) {
      return Padding(
        padding: const EdgeInsets.only(right: 12),
        child: SvgPicture.asset(Images.twitter, height: 15),
      );
    } else if (socialLink.name!.toLowerCase().contains("instagram")) {
      return Padding(
        padding: const EdgeInsets.only(right: 12),
        child: SvgPicture.asset(Images.instagram, height: 15),
      );
    } else if (socialLink.name!.toLowerCase().contains("linkedin")) {
      return Padding(
        padding: const EdgeInsets.only(right: 12),
        child: SvgPicture.asset(Images.linkedin, height: 15),
      );
    }
    return const SizedBox();
  }

  @override
  Size get preferredSize => const Size.fromHeight(210);
}
