import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:lms_user_app/utils/dimensions.dart';
import 'package:lms_user_app/utils/images.dart';
import 'package:lms_user_app/utils/styles.dart';
// Add your imports for 'dimensions.dart', 'images.dart', and 'styles.dart' here

class OrganizationHeaderSection extends StatelessWidget {
  const OrganizationHeaderSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.blue,
      child: Stack(
        alignment: Alignment.bottomCenter,
        clipBehavior: Clip.none,
        children: [
          Positioned(
            bottom: -40,
            child: Container(
              width: 90.0,
              height: 90.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue,
                border: Border.all(
                  color: Colors.transparent,
                  width: 1.0,
                ),
              ),
              child: Center(
                child: Container(
                  width: 78.0,
                  height: 78.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage("https://upload.wikimedia.org/wikipedia/commons/d/da/Purple_flower_(4764445139).jpghttps://upload.wikimedia.org/wikipedia/commons/d/da/Purple_flower_(4764445139).jpg"), // Provide your URL here
                      fit: BoxFit.cover,
                      // onError will display a placeholder image if loading fails
                      onError: (exception, stackTrace) =>
                          Image.asset(Images.placeholderSquare),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).viewPadding.top +
                    MediaQuery.of(context).viewPadding.top -
                    10,
              ),
              Text(
                "Name", // Use actual data here
                style: poppinsRegular.copyWith(
                  fontSize: Dimensions.fontSizeLarge,
                  color: Theme.of(context).cardColor,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                width: 200,
                child: Text(
                  "Address", // Use actual data here
                  style: poppinsRegular.copyWith(
                    fontSize: Dimensions.fontSizeExtraSmall,
                    color: Theme.of(context).cardColor,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: Dimensions.paddingSizeRadius,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 12,
                    width: 72,
                    child: RatingBar.builder(
                      initialRating: 5.0, // Use actual rating here
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      ignoreGestures: true,
                      itemCount: 5,
                      itemSize: 12,
                      itemBuilder: (context, _) =>
                      const Icon(Icons.star, color: Colors.amber),
                      onRatingUpdate: (rating) {
                        // Handle rating update if needed
                      },
                    ),
                  ),
                  const SizedBox(width: Dimensions.paddingSizeSmall),
                  Text(
                    "420 ratings", // Use actual total rating count here
                    style: poppinsRegular.copyWith(
                      fontSize: Dimensions.fontSizeExtraSmall,
                      color: Theme.of(context).cardColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 60)
            ],
          ),
        ],
      ),
    );
  }
}
