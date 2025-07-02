import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lms_user_app/feature/book_statistics/widgets/chart_view.dart';
import 'package:lms_user_app/utils/dimensions.dart';
import 'package:lms_user_app/utils/images.dart';

import '../../components/custom_app_bar.dart';
import '../../utils/styles.dart';

class BookStatisticsScreen extends StatefulWidget {
  const BookStatisticsScreen({super.key});

  @override
  State<BookStatisticsScreen> createState() => _BookStatisticsScreenState();
}

class _BookStatisticsScreenState extends State<BookStatisticsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'book_statistics'.tr,
        bgColor: Theme.of(context).cardColor,
        centerTitle: false,
        titleColor: Theme.of(context).textTheme.bodyLarge!.color,
      ),
      body: mainUI(context),
    );
  }

  mainUI(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            headerView(size, context),
            Padding(
              padding: const EdgeInsets.only(
                  top: Dimensions.paddingSizeExtraMoreLarge),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "statistics_report".tr,
                    style: poppinsMedium.copyWith(
                        fontSize: Dimensions.fontSizeSemiSmall,
                        fontWeight: FontWeight.w600),
                  ),
                  filterView(context)
                ],
              ),
            ),
            const SizedBox(height: Dimensions.paddingSizeDefault),
            infoView(context),
            const SizedBox(height: Dimensions.paddingSizeExtraLarge),

            // line chart
            Container(
                padding: const EdgeInsets.all(Dimensions.paddingSizeExtraSmall),
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .color!
                          .withOpacity(0.06),
                      width: 1),
                  borderRadius: const BorderRadius.all(
                      Radius.circular(Dimensions.radiusSmall)),
                ),
                height: 220,
                width: MediaQuery.of(context).size.width,
                child: const ChartViewWidget()),
          ],
        ),
      ),
    );
  }

  Row infoView(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 10,
          width: 10,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Theme.of(context).colorScheme.primary),
        ),
        const SizedBox(width: Dimensions.paddingSizeExtraSmall),
        Text(
          "total_sale".tr,
          style: poppinsMedium.copyWith(
              fontSize: Dimensions.fontSizeExtraSmall,
              color: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.color!
                  .withOpacity(0.6)),
        ),
        const SizedBox(width: Dimensions.paddingSizeExtraLarge),
        Container(
          height: 10,
          width: 10,
          decoration:
              const BoxDecoration(shape: BoxShape.circle, color: Colors.red),
        ),
        const SizedBox(width: Dimensions.paddingSizeExtraSmall),
        Text(
          "total_profit".tr,
          style: poppinsMedium.copyWith(
              fontSize: Dimensions.fontSizeExtraSmall,
              color: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.color!
                  .withOpacity(0.6)),
        ),
      ],
    );
  }

  Widget filterView(BuildContext context) {
    const List<String> list = <String>['Yearly', 'Monthly', 'Today'];
    String dropdownValue = list.first;

    return DropdownButtonHideUnderline(
      child: Container(
        width: 70,
        height: 26,
        padding:
            const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeSmall),
        decoration: BoxDecoration(
            border: Border.all(
                color: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .color!
                    .withOpacity(0.06),
                width: 1)),
        child: Center(
          child: DropdownButtonFormField(
            decoration: const InputDecoration.collapsed(hintText: ""),
            isExpanded: false,
            iconSize: 15,
            borderRadius: BorderRadius.circular(6),
            style: poppinsMedium.copyWith(
              color: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .color!
                  .withOpacity(0.6),
              //fontSize: Dimensions.fontSizeExtraSmall,
              fontSize: 8,
            ),
            value: dropdownValue,
            hint: const Text("Select"),
            items: list.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? value) {
              setState(() {
                dropdownValue = value!;
              });
            },
          ),
        ),
      ),
    );
  }

  SizedBox headerView(Size size, BuildContext context) {
    return SizedBox(
      width: size.width,
      child: FittedBox(
        fit: BoxFit.fill,
        child: Row(
          children: [
            totalSaleWidget(context),
            const SizedBox(width: Dimensions.paddingSizeDefault),
            totalRevenueWidget(context),
          ],
        ),
      ),
    );
  }

  Container totalRevenueWidget(BuildContext context) {
    return Container(
      height: 80,
      width: 165,
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
            top: 20,
            left: 15,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'total_revenue'.tr,
                  style: poppinsMedium.copyWith(
                    fontSize: Dimensions.fontSizeSmall,
                    color: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .color!
                        .withOpacity(0.6),
                  ),
                ),
                Text(
                  '\$23454',
                  style: poppinsMedium.copyWith(
                      fontSize: Dimensions.fontSizeDefault,
                      color: Theme.of(context).colorScheme.primary),
                ),
              ],
            ),
          ),
          Positioned(
            top: 15,
            right: 15,
            child: SvgPicture.asset(
              Images.revenue,
              height: 16,
              width: 17,
            ),
          ),
        ],
      ),
    );
  }

  Container totalSaleWidget(BuildContext context) {
    return Container(
      height: 80,
      width: 165,
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
            top: 20,
            left: 15,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'total_sale'.tr,
                  style: poppinsMedium.copyWith(
                    fontSize: Dimensions.fontSizeSmall,
                    color: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .color!
                        .withOpacity(0.6),
                  ),
                ),
                Text(
                  '1000',
                  style: poppinsMedium.copyWith(
                      fontSize: Dimensions.fontSizeDefault,
                      color: Theme.of(context).colorScheme.primary),
                ),
              ],
            ),
          ),
          Positioned(
            top: 15,
            right: 15,
            child: SvgPicture.asset(
              Images.book,
              height: 16,
              width: 17,
            ),
          ),
        ],
      ),
    );
  }
}
