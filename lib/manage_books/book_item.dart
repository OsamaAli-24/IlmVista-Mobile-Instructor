import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lms_user_app/utils/images.dart';
import 'package:lms_user_app/utils/styles.dart';
import '../utils/dimensions.dart';

class BookItem extends StatelessWidget {
  const BookItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
      margin: const EdgeInsets.only(bottom: Dimensions.paddingSizeSmall),
      decoration: BoxDecoration(
        border: Border.all(
            color:
                Theme.of(context).textTheme.bodyLarge!.color!.withOpacity(0.06),
            width: 1),
        borderRadius:
            const BorderRadius.all(Radius.circular(Dimensions.radiusSmall)),
      ),
      child: Stack(
        children: [
          Positioned(
            child: Image.network(
              'Image',
              width: 50,
              height: 75,
              errorBuilder: (context, error, stackTrace) => Image.asset(
                Images.placeholderSquare,
                width: 50,
                height: 75,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          Positioned(
            left: 60,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "It’s time to go back to school",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: poppinsMedium.copyWith(
                      fontSize: Dimensions.fontSizeSemiSmall),
                ),
                const SizedBox(height: Dimensions.paddingSizeRadius),
                Text(
                  "by Alifa Jesion",
                  maxLines: 1,
                  style: poppinsMedium.copyWith(
                      color: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .color!
                          .withOpacity(0.6),
                      fontSize: Dimensions.fontSizeExtraSmall),
                )
              ],
            ),
          ),
          Positioned(
            left: 60,
            bottom: 0,
            child: Text(
              "\$180",
              overflow: TextOverflow.ellipsis,
              style: poppinsMedium.copyWith(fontSize: Dimensions.fontSizeSmall),
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: SvgPicture.asset(Images.moreVert, height: 10, width: 2),
          ),
          Positioned(
              right: 0,
              bottom: 0,
              child: Text(
                "Active",
                style: poppinsMedium.copyWith(
                    fontSize: Dimensions.fontSizeSmall,
                    color: Theme.of(context).colorScheme.primary),
              ))
        ],
      ),
    );
  }
}
