import 'package:flutter/material.dart';

import '../../../common/components/custom_font.dart';
import '../../../common/constans/colors.dart';
import '../../../common/constans/variables.dart';

class ProfileFeatureWidget extends StatelessWidget {
  const ProfileFeatureWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          leading: const Icon(
            Icons.person,
            color: MyColors.brandColor,
            size: 32,
          ),
          title: const FontPoppins(
            text: Variables.profile,
            size: 16,
            fontWeight: FontWeight.w500,
            color: MyColors.blackFont,
            alignment: TextAlign.start,
          ),
          trailing: const Icon(
            Icons.arrow_forward_ios,
            color: MyColors.brandColor,
            size: 16,
          ),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(
            Icons.edit,
            color: MyColors.brandColor,
            size: 32,
          ),
          title: const FontPoppins(
            text: Variables.editProfile,
            size: 16,
            fontWeight: FontWeight.w500,
            color: MyColors.blackFont,
            alignment: TextAlign.start,
          ),
          trailing: const Icon(
            Icons.arrow_forward_ios,
            color: MyColors.brandColor,
            size: 16,
          ),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(
            Icons.info,
            color: MyColors.brandColor,
            size: 32,
          ),
          title: const FontPoppins(
            text: Variables.aboutUs,
            size: 16,
            fontWeight: FontWeight.w500,
            color: MyColors.blackFont,
            alignment: TextAlign.start,
          ),
          trailing: const Icon(
            Icons.arrow_forward_ios,
            color: MyColors.brandColor,
            size: 16,
          ),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(
            Icons.exit_to_app,
            color: MyColors.brandColor,
            size: 32,
          ),
          title: const FontPoppins(
            text: Variables.logout,
            size: 16,
            fontWeight: FontWeight.w500,
            color: MyColors.blackFont,
            alignment: TextAlign.start,
          ),
          trailing: const Icon(
            Icons.arrow_forward_ios,
            color: MyColors.brandColor,
            size: 16,
          ),
          onTap: () {},
        ),
      ],
    );
  }
}
