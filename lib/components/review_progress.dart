import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ReviewProgress extends StatelessWidget {
  final double initialRating;
  final String trailingText;
  final double progress;

  const ReviewProgress(
      {super.key,
      this.initialRating = 0.0,
      this.trailingText = '0',
      this.progress = 0.0});

  @override
  Widget build(BuildContext context) {

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        RatingBar.builder(
          initialRating: initialRating,
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: true,
          ignoreGestures: true,
          itemCount: 5,
          itemSize: 10,
          itemBuilder: (context, _) =>
              const Icon(Icons.star, color: Colors.amber),
          onRatingUpdate: (rating) {
            //print(rating);
          },
        ),
        Expanded(
          flex: 3,
          child: Stack(
            children: [
              Container(
                margin: const EdgeInsets.only(right: 5, left: 5),
                height: 10,
                decoration: BoxDecoration(
                    color: const Color(0xFFEEEEEE),
                    borderRadius: BorderRadius.circular(12)),
              ),
              LayoutBuilder(builder: (context, constraint)=> Container(
                width: constraint.minWidth+progress,
                height: 10,
                margin: const EdgeInsets.only(right: 5, left: 5),
                decoration: BoxDecoration(
                    color: Colors.amberAccent,
                    borderRadius: BorderRadius.circular(12)),
              ))
            ],
          ),
        ),
        Text(trailingText)
      ],
    );
  }
}
