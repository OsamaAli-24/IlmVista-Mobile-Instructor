import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';

import '../../../utils/dimensions.dart';
import '../../../utils/images.dart';
import '../../../utils/styles.dart';

class ReviewItem extends StatelessWidget {
  const ReviewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(
              color: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .color!
                  .withOpacity(0.06),
              width: 1),
          borderRadius:
              const BorderRadius.all(Radius.circular(Dimensions.radiusSmall)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        right: Dimensions.paddingSizeSmall),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: CachedNetworkImage(
                        imageUrl: '',
                        fit: BoxFit.cover,
                        width: 30,
                        height: 30,
                        placeholder: (context, url) =>
                            Image.asset(Images.placeholderSquare),
                        errorWidget: (context, url, error) => Image.asset(
                          Images.placeholderSquare,
                          width: 30,
                          height: 30,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'name',
                              style: poppinsMedium.copyWith(
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .color!,
                                  fontSize: Dimensions.fontSizeDefault),
                            ),
                            Container(
                              alignment: Alignment.center,
                              height: 12,
                              width: 77,
                              child: RatingBar.builder(
                                initialRating: double.parse("4.0"),
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
                          ],
                        ),
                        Text('Stident | 19 Jun, 2023',
                            style: poppinsRegular.copyWith(
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .color!
                                    .withOpacity(0.6),
                                fontSize: Dimensions.fontSizeExtraSmall)),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 13),
              Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged",
                maxLines: 2,
                textAlign: TextAlign.start,
                overflow: TextOverflow.ellipsis,
                style: poppinsMedium.copyWith(
                    color: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .color!
                        .withOpacity(0.6),
                    fontSize: Dimensions.fontSizeSmall),
              ),
              const SizedBox(height: 20),
              //status section
              const Divider(color: Color(0xFFF6F6F6),),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'status'.tr,
                    style: poppinsMedium.copyWith(
                        color: Theme.of(context).textTheme.bodyLarge!.color!,
                        fontSize: Dimensions.fontSizeDefault),
                  ),
                  FlutterSwitch(
                    width: 30,
                    height: 18,
                    valueFontSize: 20,
                    toggleSize: 16,
                    borderRadius: 30,
                    padding: 1.0,
                    showOnOff: false,
                    toggleColor: Colors.white,
                    activeColor: Theme.of(context).primaryColor,
                    inactiveColor: Colors.grey,
                    value: true,
                    onToggle: (value) {},
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
