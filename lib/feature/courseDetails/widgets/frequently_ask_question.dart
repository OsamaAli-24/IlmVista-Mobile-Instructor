import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:lms_user_app/utils/dimensions.dart';
import 'package:lms_user_app/utils/styles.dart';

import '../../../data/model/course_detail/faq.dart';

class FrequentlyAskQuestion extends StatefulWidget {
  final List<Faq> faqList;
  const FrequentlyAskQuestion({Key? key, required this.faqList})
      : super(key: key);

  @override
  State<FrequentlyAskQuestion> createState() => _FrequentlyAskQuestionState();
}

class _FrequentlyAskQuestionState extends State<FrequentlyAskQuestion> {

  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
          child: Text('frequently_ask_question'.tr,
              style: poppinsSemiBold.copyWith(
                  fontSize: Dimensions.fontSizeDefault),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          controller: scrollController,
          itemCount: widget.faqList.length,
          itemBuilder: (BuildContext context, int index) {
            Faq faq = widget.faqList.elementAt(index);
            return  Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: Dimensions.paddingSizeExtraSmall,),
              child: frequentlyAskItem(context,faq.question ?? "",faq.answer ?? "")
            );
          },
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }

  Container frequentlyAskItem(BuildContext context,String question,String answer){
    return Container(
      alignment: Alignment.center,
      /*decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).textTheme.bodyLarge!.color!.withOpacity(0.06),
          width: 1,
        ),*/
       /* color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: const BorderRadius.all(Radius.circular(Dimensions.radiusSmall),),*/
      //),
      child: Padding(
        padding: const EdgeInsets.only(
            bottom: Dimensions.paddingSizeSmall),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).textTheme.bodyLarge!.color!.withOpacity(0.03),
              width: 1,
            ),
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: const BorderRadius.all(Radius.circular(Dimensions.radiusSmall),),
          ),
          child: ExpansionTile(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
            ),
            title: Text(
              question,
              style: poppinsMedium.copyWith(
                  color: Theme.of(context).textTheme.bodyLarge!.color!,
                  fontSize: Dimensions.fontSizeSmall),
            ),
            children: [
              Container(
                height: 1,
                width: MediaQuery.of(context).size.width,
                color: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .color!
                    .withOpacity(0.06),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: Dimensions.paddingSizeSmall,
                    horizontal: Dimensions.paddingSizeDefault),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                      const EdgeInsets.only(top: Dimensions.paddingSizeRadius),
                      child: Container(
                        height: Dimensions.paddingSizeExtraSmall,
                        width: Dimensions.paddingSizeExtraSmall,
                        decoration: BoxDecoration(
                          color: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .color!
                              .withOpacity(0.5),
                          borderRadius: const BorderRadius.all(
                              Radius.circular(Dimensions.radiusExtraLarge)),
                        ),
                      ),
                    ),
                    const SizedBox(width: Dimensions.paddingSizeSmall),
                    Expanded(
                      // child: Text(
                      //     answer,
                      //     style: poppinsRegular.copyWith(
                      //         color: Theme.of(context)
                      //             .textTheme
                      //             .bodyLarge!
                      //             .color!
                      //             .withOpacity(0.5),
                      //         fontSize: Dimensions.fontSizeSmall)
                      // ),
                      child: HtmlWidget(answer),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      )
    );
  }

  Container item(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius:
            const BorderRadius.all(Radius.circular(Dimensions.radiusSmall)),
      ),
      child: Column(
        children: [
          const SizedBox(height: Dimensions.paddingSizeSmall,),
          MySeparator(
            color:
                Theme.of(context).textTheme.bodyLarge!.color!.withOpacity(0.06),
          ),
          const SizedBox(height: Dimensions.paddingSizeSmall),
          InkWell(
            onTap: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('How can I buy a Course?',
                    style: poppinsMedium.copyWith(
                        color: Theme.of(context).textTheme.bodyLarge!.color!,
                        fontSize: Dimensions.fontSizeSmall)),
                Icon(Icons.keyboard_arrow_up_rounded,
                    color: Theme.of(context).textTheme.bodyLarge!.color!)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                vertical: Dimensions.paddingSizeDefault,
                horizontal: Dimensions.paddingSizeExtraSmall),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(top: Dimensions.paddingSizeRadius),
                  child: Container(
                    height: Dimensions.paddingSizeExtraSmall,
                    width: Dimensions.paddingSizeExtraSmall,
                    decoration: BoxDecoration(
                        color: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .color!
                            .withOpacity(0.5),
                        borderRadius: const BorderRadius.all(
                            Radius.circular(Dimensions.radiusExtraLarge))),
                  ),
                ),
                const SizedBox(width: Dimensions.paddingSizeSmall),
                Expanded(
                  child: Text(
                      'Those who are having trouble getting a job due to a lack of English speaking skills.',
                      style: poppinsRegular.copyWith(
                          color: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .color!
                              .withOpacity(0.5),
                          fontSize: Dimensions.fontSizeSmall)),
                ),
              ],
            ),
          ),
          MySeparator(
            color:
                Theme.of(context).textTheme.bodyLarge!.color!.withOpacity(0.06),
          ),
        ],
      ),
    );
  }
}

class MySeparator extends StatelessWidget {
  const MySeparator({Key? key, this.height = 1, this.color = Colors.black})
      : super(key: key);
  final double height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        const dashWidth = Dimensions.radiusSmall;
        final dashHeight = height;
        final dashCount = (boxWidth / (1.5 * dashWidth)).floor();
        return Flex(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidth,
              height: dashHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(color: color),
              ),
            );
          }),
        );
      },
    );
  }
}
