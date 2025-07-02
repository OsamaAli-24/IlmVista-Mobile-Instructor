import 'package:flutter/material.dart';
import 'package:lms_user_app/components/rating_widget.dart';
import 'package:lms_user_app/utils/dimensions.dart';
import 'package:lms_user_app/utils/styles.dart';

class RatingView extends StatelessWidget {
  const RatingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
      child: SizedBox(
        height: 128,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
                color: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .color!
                    .withOpacity(0.06),
                width: 1),
            borderRadius: const BorderRadius.all(
              Radius.circular(Dimensions.radiusSmall),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text(
                      '4.0',
                      style: poppinsBold.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: Dimensions.fontSizeDefault),
                    ),
                    const SizedBox(width: Dimensions.paddingSizeExtraSmall),
                    Text(
                      "Out of 5",
                      style: poppinsRegular.copyWith(
                          color: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .color!
                              .withOpacity(0.6),
                          fontSize: Dimensions.fontSizeExtraSmall),
                    ),
                  ],
                ),
                RotatedBox(
                  quarterTurns: 1,
                  child: Divider(
                    thickness: 1,
                    color: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .color!
                        .withOpacity(0.06),
                  ),
                ),
                const Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // ratingWidget(context, widget.rating.fiveStar ?? 0, 5),
                      // ratingWidget(context, widget.rating.fourStar ?? 0, 4),
                      // ratingWidget(context, widget.rating.threeStar ?? 0, 3),
                      // ratingWidget(context, widget.rating.twoStar ?? 0, 2),
                      // ratingWidget(context, widget.rating.oneStar ?? 0, 1),
                      RatingWidget(reviewCount:25, starCount: 5, totalReview: 100,),
                      RatingWidget(reviewCount:11, starCount: 4, totalReview: 100),
                      RatingWidget(reviewCount:4, starCount: 3, totalReview: 100),
                      RatingWidget(reviewCount:2, starCount: 2, totalReview: 100),
                      RatingWidget(reviewCount:0, starCount: 1, totalReview: 100),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
