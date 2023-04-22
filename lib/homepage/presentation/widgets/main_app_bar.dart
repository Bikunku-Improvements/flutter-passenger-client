import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:passenger_client/common/colors/colors.dart';

class MainAppBar extends StatelessWidget with PreferredSizeWidget {
  const MainAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: AppColors.primaryBlue,
        title: SvgPicture.asset('assets/icons/bikunku-logo.svg'),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(10))));
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
