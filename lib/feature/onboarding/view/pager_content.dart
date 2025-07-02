import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PagerContent extends StatelessWidget {
  const PagerContent({Key? key, required this.image}) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Spacer(),
        SizedBox( child: SvgPicture.asset(image)),
        const SizedBox(height: 80),
      ],
    );
  }
}