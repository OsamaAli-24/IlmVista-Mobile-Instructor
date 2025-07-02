import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:lms_user_app/components/custom_image.dart';
import 'package:lms_user_app/components/title_view.dart';
import 'package:lms_user_app/utils/dimensions.dart';
import 'package:lms_user_app/utils/images.dart';
import 'package:lms_user_app/utils/styles.dart';

import '../../../core/helper/help_me.dart';
import '../../../data/model/common/book.dart';

class RecentPublished extends StatelessWidget {
  final List<BookModel> bookList;
  const RecentPublished({Key? key, required this.bookList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleView(title: 'recent_published'.tr),
        const SizedBox(
          height: Dimensions.paddingSizeDefault,
        ),
        SizedBox(
          height: 110,
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: bookList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return bookItem(index, bookList[index], context);
              }),
        ),
      ],
    );
  }

  Widget bookItem(int index, BookModel book, BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          right: Dimensions.paddingSizeDefault,
          left: index == 0 ? Dimensions.paddingSizeDefault : 0),
      child: Container(
        width: 255,
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
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    //borderRadius: BorderRadius.all(Radius.circular(Dimensions.radiusSmall)),
                    child: CustomImage(
                      width: 50,
                      height: 75,
                      image: book.thumbnail ?? '',
                      placeholder: Images.placeholderSquare,
                    ),
                  ),
                  const SizedBox(
                    width: Dimensions.paddingSizeSmall,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          book.title ?? '',
                          style: poppinsMedium.copyWith(
                              fontSize: Dimensions.fontSizeSemiSmall),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        // const SizedBox(height: Dimensions.paddingSizeSmall,),
                        Text(
                          "By ${book.publishedBy}",
                          style: poppinsRegular.copyWith(
                            fontSize: Dimensions.fontSizeSmall,
                            color: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .color!
                                .withOpacity(0.5),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              calculateBookPrice(book),
                              style: poppinsRegular.copyWith(
                                  fontSize: Dimensions.fontSizeSmall,
                                  color: Theme.of(context).colorScheme.primary),
                            ),
                            Container(
                              alignment: Alignment.center,
                              height: 12,
                              width: 72,
                              child: RatingBar.builder(
                                initialRating:
                                    double.parse(book.totalRating.toString()),
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
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
