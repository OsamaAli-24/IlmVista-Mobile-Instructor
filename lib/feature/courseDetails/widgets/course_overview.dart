import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms_user_app/utils/dev_util.dart';
import 'package:lms_user_app/utils/dimensions.dart';
import 'package:lms_user_app/utils/styles.dart';

import '../../../data/model/course_detail/data.dart';

class CourseOverView extends StatelessWidget {
  final CourseDetailData? data;
  const CourseOverView({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: Dimensions.paddingSizeDefault),
          child: Text(data?.title ?? "title",
              style: poppinsSemiBold.copyWith(
                  fontSize: Dimensions.fontSizeDefault)),
        ),
        const SizedBox(height: Dimensions.paddingSizeDefault),

        //-------------------------------------------------------- short description
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: Dimensions.paddingSizeDefault),
          child: ExpandableText(
            data?.shortDescription ?? "description",
            trimLines: 2,
          ),
        ),
      ],
    );
  }
}

class ExpandableText extends StatefulWidget {
  const ExpandableText(
    this.text, {
    Key? key,
    this.trimLines = 2,
  }) : super(key: key);

  final String text;
  final int trimLines;

  @override
  ExpandableTextState createState() => ExpandableTextState();
}

class ExpandableTextState extends State<ExpandableText> {
  bool _readMore = true;
  void _onTapLink() {
    setState(() => _readMore = !_readMore);
  }

  @override
  Widget build(BuildContext context) {
    appLog(tag: "Description : ", msg: widget.text);

    TextSpan link = TextSpan(
        text: _readMore ? 'see_more'.tr : 'read_less'.tr,
        style: TextStyle(
          color: Theme.of(context).textTheme.bodyMedium!.color!.withOpacity(0.4),
        ),
        recognizer: TapGestureRecognizer()..onTap = _onTapLink);
    Widget result = LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        assert(constraints.hasBoundedWidth);
        final double maxWidth = constraints.maxWidth;
        final text = TextSpan(
          text: widget.text,
          style: TextStyle(color: Color(0xFF666666))
        );

        TextPainter textPainter = TextPainter(
          text: link,
          textDirection: TextDirection
              .rtl, //better to pass this from master widget if ltr and rtl both supported
          maxLines: widget.trimLines,
          ellipsis: '...',
        );

        textPainter.layout(minWidth: constraints.minWidth, maxWidth: maxWidth);
        final linkSize = textPainter.size;
        textPainter.text = text;
        textPainter.layout(minWidth: constraints.minWidth, maxWidth: maxWidth);
        final textSize = textPainter.size;
        int endIndex;
        final pos = textPainter.getPositionForOffset(Offset(
          textSize.width - linkSize.width,
          textSize.height,
        ));

        endIndex = textPainter.getOffsetBefore(pos.offset) ?? 0;
        TextSpan textSpan;
        if (textPainter.didExceedMaxLines) {
          textSpan = TextSpan(
            text: _readMore ? widget.text.substring(0, endIndex) : widget.text,
            style: TextStyle(
              color: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .color!
                  .withOpacity(0.6),
            ),
            children: <TextSpan>[link],
          );
        } else {
          textSpan = TextSpan(
            text: widget.text,
            style: const TextStyle(color: Color(0xFF666666))
          );
        }

        return RichText(
          softWrap: true,
          overflow: TextOverflow.clip,
          text: textSpan,
        );
      },
    );
    return result;
  }
}
