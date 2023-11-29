import 'package:flutter/material.dart';
import 'package:skripsi_project/common/extensions/date_format_ext.dart';
import 'package:skripsi_project/data/models/response/account/account_detail_response.dart';

import '../../../common/components/custom_font.dart';
import '../../../common/components/custom_listview.dart';
import '../../../common/constans/colors.dart';
import '../../../common/constans/variables.dart';

class DetailDataWidget extends StatelessWidget {
  final AccountDetailData data;
  const DetailDataWidget({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return CustomListView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      listWidget: [
        const SizedBox(height: 8),
        ListTile(
          leading: const Icon(
            Icons.person,
            color: MyColors.brandColor,
            size: 32,
          ),
          title: _componentColumn(
            Variables.name,
            data.attributes!.name!,
          ),
        ),
        const SizedBox(height: 16),
        ListTile(
          leading: const Icon(
            Icons.contacts_rounded,
            color: MyColors.brandColor,
            size: 32,
          ),
          title: _componentColumn(
            Variables.noIdentity,
            data.attributes!.noIdentity ?? "-",
          ),
        ),
        const SizedBox(height: 16),
        ListTile(
          leading: const Icon(
            Icons.email_outlined,
            color: MyColors.brandColor,
            size: 32,
          ),
          title: _componentColumn(
            Variables.email,
            data.attributes!.email!,
          ),
        ),
        const SizedBox(height: 16),
        ListTile(
          leading: const Icon(
            Icons.phone,
            color: MyColors.brandColor,
            size: 32,
          ),
          title: _componentColumn(
            Variables.phoneNumber,
            data.attributes!.phoneNumber ?? "-",
          ),
        ),
        const SizedBox(height: 16),
        ListTile(
          leading: const Icon(
            Icons.wifi_protected_setup_outlined,
            color: MyColors.brandColor,
            size: 32,
          ),
          title: _componentColumn(
            Variables.gender,
            data.attributes!.gender ?? "-",
          ),
        ),
        const SizedBox(height: 16),
        ListTile(
          leading: const Icon(
            Icons.date_range_outlined,
            color: MyColors.brandColor,
            size: 32,
          ),
          title: _componentColumn(
            Variables.birthDate,
            data.attributes!.birthDate.toString().toFormattedBirthDate,
          ),
        ),
        const SizedBox(height: 16),
        ListTile(
          leading: const Icon(
            Icons.location_city,
            color: MyColors.brandColor,
            size: 32,
          ),
          title: _componentColumn(
            Variables.address,
            data.attributes!.address ?? "-",
          ),
        ),
      ],
    );
  }

  Widget _componentColumn(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FontPoppins(
          text: title,
          size: 12,
          fontWeight: FontWeight.w500,
          color: MyColors.blackFont,
          alignment: TextAlign.start,
        ),
        const SizedBox(height: 4),
        FontPoppins(
          text: value,
          size: 15,
          fontWeight: FontWeight.w500,
          color: MyColors.blackFont,
          alignment: TextAlign.start,
        ),
      ],
    );
  }
}
