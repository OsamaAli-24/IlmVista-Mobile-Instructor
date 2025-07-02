import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lms_user_app/components/custom_button.dart';
import 'package:lms_user_app/manage_books/book_item.dart';
import 'package:lms_user_app/utils/dimensions.dart';
import 'package:lms_user_app/utils/images.dart';

import '../components/custom_app_bar.dart';
import '../utils/styles.dart';

class ManageBooksScreen extends StatefulWidget {
  const ManageBooksScreen({super.key});

  @override
  State<ManageBooksScreen> createState() => _ManageBooksScreenState();
}

class _ManageBooksScreenState extends State<ManageBooksScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'manage_books'.tr,
        bgColor: Theme.of(context).cardColor,
        centerTitle: false,
        titleColor: Theme.of(context).textTheme.bodyLarge!.color,
        actions: [
          IconButton(
            splashRadius: 20,
            onPressed: () => filterDialog(context),
            icon: SvgPicture.asset(Images.filter, width: 17, height: 12),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: 20,
          itemBuilder: (BuildContext context, int index) {
            return const BookItem();
          },
        ),
      ),
    );
  }

  void filterDialog(BuildContext context) => showModalBottomSheet(
      backgroundColor: Colors.transparent,
      //isScrollControlled: true,

      context: context,
      builder: (context) => SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.0),
                  topRight: Radius.circular(16.0),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'book_filter'.tr,
                        overflow: TextOverflow.ellipsis,
                        style: poppinsMedium.copyWith(
                            fontSize: Dimensions.fontSizeDefault,
                            fontWeight: FontWeight.w600),
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () => Get.back(),
                        icon: const Icon(Icons.close),
                        iconSize: 12,
                      )
                    ],
                  ),
                  Divider(
                    thickness: 1,
                    color: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .color!
                        .withOpacity(0.06),
                  ),
                  categoryItem(context, 'categories'.tr),
                  categoryItem(context, 'author'.tr),
                  categoryItem(context, 'book_status'.tr),
                  categoryItem(context, 'actively'.tr),
                  const SizedBox(height: Dimensions.paddingSizeDefault),
                  CustomButton(buttonText: 'filter'.tr),
                  const SizedBox(height: Dimensions.paddingSizeDefault * 2),
                ],
              ),
            ),
          ));

  Widget categoryItem(BuildContext context, String title) {
    const List<String> list = <String>['One', 'Two', 'Three', 'Four'];
    String dropdownValue = list.first;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          overflow: TextOverflow.ellipsis,
          style: poppinsMedium.copyWith(
              fontSize: Dimensions.fontSizeSemiSmall,
              fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: Dimensions.paddingSizeDefault),
        DropdownButtonHideUnderline(
          child: Container(
            height: 44,
            padding: const EdgeInsets.symmetric(
                horizontal: Dimensions.paddingSizeSmall),
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
                isExpanded: true,
                borderRadius: BorderRadius.circular(6),
                style: poppinsMedium.copyWith(
                    color: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .color!
                        .withOpacity(0.6),
                    fontSize: Dimensions.fontSizeExtraSmall),
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
        ),
        const SizedBox(height: Dimensions.paddingSizeDefault),
      ],
    );
  }
}
