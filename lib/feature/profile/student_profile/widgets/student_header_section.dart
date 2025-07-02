import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lms_user_app/data/model/student/student_profile.dart';
import 'package:lms_user_app/utils/images.dart';
import '../../../../utils/dimensions.dart';
import '../../../../utils/styles.dart';

class StudentHeaderSection extends StatelessWidget {
  final StudentProfile studentProfile;

  const StudentHeaderSection({Key? key, required this.studentProfile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260,
      // constraints: BoxConstraints(),
      child: Stack(
        children: [

          Container(
            width: double.infinity,
            height: 190,
            color: const Color(0xFF2357A4),
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 10),
                Text(
                  studentProfile.data?.name ?? 'Name',
                  style: poppinsRegular.copyWith(
                    fontSize: Dimensions.fontSizeLarge,
                    color: Theme.of(context).cardColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                const Gap(10),
                Text(
                  studentProfile.data?.email ??'email',
                  style: poppinsRegular.copyWith(
                    fontSize: Dimensions.fontSizeExtraSmall,
                    color: Theme.of(context).cardColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                const Gap(8),
                SizedBox(
                  width: 200,
                  child: Text(
                    studentProfile.data?.address ?? 'address',
                    style: poppinsRegular.copyWith(
                      fontSize: Dimensions.fontSizeExtraSmall,
                      color: Theme.of(context).cardColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),

          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Align(
              alignment: Alignment.center,
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,

                  border: Border.all(
                    width: 4,
                    color: Colors.white,
                    strokeAlign: BorderSide.strokeAlignOutside
                  )
                ),
                
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,

                        border: Border.all(
                            width: 6,
                            color: const Color(0xFF373E8C)
                        ),
                    ),
                  child: ClipOval(
                    child: Image.network(
                      studentProfile.data?.image ?? '',
                      fit: BoxFit.fill,
                      errorBuilder: (context, error, stackTrace) => Image.asset(
                        Images.placeholderSquare,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

