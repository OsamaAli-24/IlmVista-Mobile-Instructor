import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lms_user_app/components/custom_app_bar.dart';
import 'package:lms_user_app/feature/quiz/widget/custom_check_box.dart';
import 'package:lms_user_app/feature/quiz/widget/time_line.dart';
import 'package:lms_user_app/utils/dimensions.dart';
import 'package:lms_user_app/utils/images.dart';
import 'package:lms_user_app/utils/styles.dart';

class QuizStartPage extends StatefulWidget {
  const QuizStartPage({Key? key}) : super(key: key);

  @override
  QuizStartPageState createState() => QuizStartPageState();
}

class QuizStartPageState extends State<QuizStartPage> {
  bool value = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          title: "Quiz Test-1",
        centerTitle: false,
        actions: [
          Container(

            alignment: Alignment.center,
            child: Text("5 m : 00 s",
              style: poppinsSemiBold.copyWith(
                  color: Theme.of(context).primaryColorLight,
                fontSize: Dimensions.fontSizeDefault
              ),
            ),
          ),
          const SizedBox(width: Dimensions.paddingSizeDefault),
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 148,
            width: MediaQuery.of(context).size.width,
            color: Theme.of(context).colorScheme.primary.withOpacity(0.06),
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    textTitle(
                      title: "Minimum pass mark 60% correct answer",
                      style: poppinsRegular.copyWith(
                        color: Theme.of(context).textTheme.bodyLarge!.color!,
                        fontSize: Dimensions.fontSizeSmall,
                      ),
                    ),
                    const SizedBox(height: Dimensions.paddingSizeSmall),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        customContainer(
                          title: '5 minutes',
                          sunTitle: 'Your time',
                          style: poppinsSemiBold.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: Dimensions.fontSizeDefault,
                            fontWeight: FontWeight.w500,
                          ),
                          style2: poppinsRegular.copyWith(
                            color: Theme.of(context).textTheme.bodyLarge!.color!,
                            fontSize: Dimensions.fontSizeSmall,
                          ),
                        ),
                        const SizedBox(
                          width: Dimensions.paddingSizeSmall,
                        ),
                        customContainer(
                          title: '5',
                          sunTitle: 'Total Score',
                          style: poppinsRegular.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                          style2: poppinsRegular.copyWith(
                            color: Theme.of(context).textTheme.bodyLarge!.color,
                            fontSize: Dimensions.fontSizeSmall,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 148,
                  width: 100,
                  child: SvgPicture.asset(Images.quizBackRound),
                )
              ],
            ),
          ),
          Expanded(
            child: ListView(
              physics: const AlwaysScrollableScrollPhysics(),
              shrinkWrap: true,
              children: [
                const SizedBox(
                  height:  Dimensions.paddingSizeDefault,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeSmall),
                  child: Column(
                    children: [
                      Timeline(
                        lineColor: Theme.of(context).colorScheme.primary.withOpacity(0.06),

                        indicators: <Widget>[
                          CircleAvatar(
                              backgroundColor: Theme.of(context).colorScheme.primary,
                              child: SvgPicture.asset(
                                Images.successful,
                                height: 11,
                                color: Theme.of(context).primaryColorLight,
                              ),
                          ),
                          CircleAvatar(
                              backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.06),
                              child: Text("2",
                                style: poppinsRegular.copyWith(
                                color: Theme.of(context).colorScheme.primary
                                ),
                              ),
                          ),
                          CircleAvatar(
                             backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.06),
                              child: Text("3",style: poppinsRegular.copyWith(
                                color: Theme.of(context).colorScheme.primary
                              ),
                              ),
                          ),
                          CircleAvatar(
                            backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.06),
                              child: Text("4",style: poppinsRegular.copyWith(
                                color: Theme.of(context).colorScheme.primary
                              ),
                              ),
                          ),
                        ],
                        style: PaintingStyle.stroke,
                        children: [
                          timeLineContainerTwo(
                            title: 'গ্রাফিক্স ডিজাইন ব্যাবহৃত টুলস কোনটি',
                            subTitle1: 'ফটোশপ',
                            subTitle2: 'মাইক্রোসফট ওয়ার্ড',
                            subTitle3: 'পাওয়ার পয়েন্ট',
                            subTitle4: 'প্রিমিয়ার প্রো',
                            style: poppinsRegular.copyWith(
                              color: Theme.of(context).textTheme.bodyLarge!.color,
                              fontSize:  Dimensions.fontSizeDefault,
                              fontWeight: FontWeight.w500,
                            ),
                            style2: poppinsRegular.copyWith(
                              color: Theme.of(context).textTheme.bodyLarge!.color!.withOpacity(0.6),
                              fontSize: Dimensions.fontSizeSmall,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          timeLineContainer(
                            title: 'গ্রাফিক্স ডিজাইন ব্যাবহৃত টুলস কোনটি',
                            subTitle1: 'ফটোশপ',
                            subTitle2: 'মাইক্রোসফট ওয়ার্ড',
                            subTitle3: 'পাওয়ার পয়েন্ট',
                            subTitle4: 'প্রিমিয়ার প্রো',
                            style: poppinsRegular.copyWith(
                              color: Theme.of(context).textTheme.bodyLarge!.color,
                              fontSize:  Dimensions.fontSizeDefault,
                            ),
                            style2: poppinsRegular.copyWith(
                              color: Theme.of(context).textTheme.bodyLarge!.color!.withOpacity(0.6),
                              fontSize: Dimensions.fontSizeSmall,
                            ),
                          ),
                          timeLineContainerTwo(
                            title: 'গ্রাফিক্স ডিজাইন ব্যাবহৃত টুলস কোনটি',
                            subTitle1: 'ফটোশপ',
                            subTitle2: 'মাইক্রোসফট ওয়ার্ড',
                            subTitle3: 'পাওয়ার পয়েন্ট',
                            subTitle4: 'প্রিমিয়ার প্রো',
                            style: poppinsRegular.copyWith(
                              color: Theme.of(context).textTheme.bodyLarge!.color!.withOpacity(0.5),
                              fontSize:  Dimensions.fontSizeDefault,
                            ),
                            style2: poppinsRegular.copyWith(
                              color: Theme.of(context).textTheme.bodyLarge!.color!.withOpacity(0.6),
                              fontSize: Dimensions.fontSizeSmall,
                            ),
                          ),
                          timeLineContainerThree(
                            title: 'গ্রাফিক্স ডিজাইন ব্যাবহৃত টুলস কোনটি',
                            subTitle1: 'ফটোশপ',
                            subTitle2: 'মাইক্রোসফট ওয়ার্ড',
                            subTitle3: 'পাওয়ার পয়েন্ট',
                            subTitle4: 'প্রিমিয়ার প্রো',
                            style: poppinsRegular.copyWith(
                              color: Theme.of(context).textTheme.bodyLarge!.color!,
                              fontSize:  Dimensions.fontSizeDefault,
                              fontWeight: FontWeight.w500,
                            ),
                            style2: poppinsRegular.copyWith(
                              color: Theme.of(context).textTheme.bodyLarge!.color!.withOpacity(0.6),
                              fontSize: Dimensions.fontSizeSmall,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(7.0),
                        child: customButton(
                          title: 'submit'.tr,
                          color: Theme.of(context).colorScheme.primary,
                          color2: Theme.of(context).colorScheme.primary,
                          style: poppinsMedium.copyWith(
                            color: Theme.of(context).primaryColorLight,
                            fontSize: Dimensions.fontSizeDefault,

                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'সেভ',
                          style: poppinsMedium.copyWith(
                            color: Theme.of(context).textTheme.bodyLarge!.color!.withOpacity(0.5),
                            fontSize:  Dimensions.fontSizeDefault,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget timeLineContainer(
      {required String title,
      required String subTitle1,
      subTitle2,
      subTitle3,
      subTitle4,
      required TextStyle style,
      required TextStyle style2}) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: Container(
        width: 290,
        // height: 240.87,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
              color: Theme.of(context).textTheme.bodyLarge!.color!.withOpacity(0.06)
          ),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: style,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(children: [
                customCheckBox(value),
                const SizedBox(width: 10),
                Text(
                  subTitle1,
                  style: style2,
                )
              ]),
              const SizedBox(
                height: 10,
              ),
              Row(children: [
                customCheckBox(value),
                const SizedBox(width: 10),
                Text(
                  subTitle2,
                  style: style2,
                )
              ]),
              const SizedBox(
                height: 10,
              ),
              Row(children: [
                customCheckBox(value),
                const SizedBox(width: 10),
                Text(
                  subTitle3,
                  style: style2,
                )
              ]),
              const SizedBox(
                height: 10,
              ),
              Row(children: [
                customCheckBox(value),
                const SizedBox(width: 10),
                Text(
                  subTitle4,
                  style: style2,
                )
              ]),
            ],
          ),
        ),
      ),
    );
  }

  Widget timeLineContainerTwo(
      {required String title,
      required String subTitle1,
      subTitle2,
      subTitle3,
      subTitle4,
      required TextStyle style,
      required TextStyle style2}) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: Container(
        //width: 290,
        // height: 240.87,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
              color: Theme.of(context).textTheme.bodyLarge!.color!.withOpacity(0.06)
          ),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: style,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(children: [
                customCheckBoxCircle(value),
                const SizedBox(width: 10),
                Text(
                  subTitle1,
                  style: style2,
                )
              ]),
              const SizedBox(
                height: 10,
              ),
              Row(children: [
                customCheckBoxCircle(value),
                const SizedBox(width: 10),
                Text(
                  subTitle2,
                  style: style2,
                )
              ]),
              const SizedBox(
                height: 10,
              ),
              Row(children: [
                customCheckBoxCircle(value),
                const SizedBox(width: 10),
                Text(
                  subTitle3,
                  style: style2,
                )
              ]),
              const SizedBox(
                height: 10,
              ),
              Row(children: [
                customCheckBoxCircle(value),
                const SizedBox(width: 10),
                Text(
                  subTitle4,
                  style: style2,
                )
              ]),
            ],
          ),
        ),
      ),
    );
  }

  Widget timeLineContainerThree(
      {required String title,
      required String subTitle1,
      subTitle2,
      subTitle3,
      subTitle4,
      required TextStyle style,
      required TextStyle style2}) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: Container(
        width: 290,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
            color: Theme.of(context).textTheme.bodyLarge!.color!.withOpacity(0.06)
          ),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50.0, vertical: 3.0),
                child: SvgPicture.asset(
                  Images.message,
                  width: 173,
                  height: 179,
                ),
              ),
              Text(
                title,
                style: style,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(children: [
                customCheckBoxCircle(value),
                const SizedBox(width: 10),
                Text(
                  subTitle1,
                  style: style2,
                )
              ]),
              const SizedBox(
                height: 10,
              ),
              Row(children: [
                customCheckBoxCircle(value),
                const SizedBox(width: 10),
                Text(
                  subTitle2,
                  style: style2,
                )
              ]),
              const SizedBox(
                height: 10,
              ),
              Row(children: [
                customCheckBoxCircle(value),
                const SizedBox(width: 10),
                Text(
                  subTitle3,
                  style: style2,
                )
              ]),
              const SizedBox(
                height: 10,
              ),
              Row(
                  children: [
                customCheckBoxCircle(value),
                const SizedBox(width: 10),
                Text(
                  subTitle4,
                  style: style2,
                )
              ]),
            ],
          ),
        ),
      ),
    );
  }

  Widget customContainer(
      {required String title,
      required String sunTitle,
      required TextStyle style,
      required TextStyle style2}) {
    return Container(
      width: 100,
      height: 52,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: Theme.of(context).cardColor
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          textTitle(title: title, style: style),
          textTitle(title: sunTitle, style: style2),
        ],
      ),
    );
  }

  Widget customButton(
      {required String title,
      required Color color,
      required TextStyle style,
      required Color color2}) {
    return Container(
      width: 190.0,
      height: 44.0,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: color2),
      ),
      child: Center(
        child: textTitle(
          title: title,
          style: style,
        ),
      ),
    );
  }

  Widget textTitle({required String title, required TextStyle style}) {
    return Text(
      title,
      style: style,
    );
  }
}
