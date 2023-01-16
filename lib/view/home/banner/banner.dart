import 'package:flutter/material.dart';
import 'package:ecommerce/res/app_url.dart';

class BannerSection extends StatelessWidget {
  const BannerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Image.asset(
          AppUrl.bannerUrl,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
