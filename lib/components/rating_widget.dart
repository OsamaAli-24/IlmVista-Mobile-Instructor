import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:lms_user_app/utils/dimensions.dart';
import 'package:lms_user_app/utils/styles.dart';

class RatingWidget extends StatelessWidget {
  final int starCount;
  final int reviewCount;
  final int totalReview;
  const RatingWidget(
      {super.key, required this.starCount, required this.reviewCount, required this.totalReview});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          alignment: Alignment.center,
          height: 12,
          //width: 78,
          child: RatingBar.builder(
            initialRating: starCount.toDouble(),
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            ignoreGestures: true,
            itemCount: 5,
            itemSize: 12,
            itemBuilder: (context, _) =>
            const Icon(Icons.star, color: Colors.amber),
            onRatingUpdate: (rating) {
              //print(rating);
            },
          ),
        ),
        const SizedBox(width: Dimensions.paddingSizeSmall),
        Expanded(
          child: SizedBox(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: LinearProgressIndicator(
                borderRadius: BorderRadius.circular(10),

                minHeight: 8,
                value: calculatePercentage(reviewCount, totalReview),
                valueColor: AlwaysStoppedAnimation<Color>(
                    Theme.of(context).colorScheme.outline),
                backgroundColor: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .color!
                    .withOpacity(0.06),
              ),
            ),
          ),
        ),
        const SizedBox(width: Dimensions.paddingSizeSmall),
        SizedBox(
          child: Align(
            alignment: Alignment.centerRight,
            child: Text(reviewCount.toString(),
                style: poppinsMedium.copyWith(
                    fontSize: Dimensions.fontSizeSmall,
                    color: Theme.of(context).colorScheme.primary)),
          ),
        ),
      ],
    );
  }
}

double calculatePercentage(int reviewCount, int totalReview) {
  return reviewCount == 0 || totalReview == 0
      ? 0.0
      : (reviewCount * 100) / totalReview / 100;
      // : (reviewCount * 100) / 30 / 100;
}
