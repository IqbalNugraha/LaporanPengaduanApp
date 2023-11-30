import 'package:flutter/material.dart';
import 'package:skripsi_project/data/models/response/report/report_response_model.dart';
import 'package:skripsi_project/presentation/report/edit_report_page.dart';

import '../../../common/components/custom_container.dart';
import '../../../common/components/custom_font.dart';
import '../../../common/components/custom_seperator.dart';
import '../../../common/constans/api_services.dart';
import '../../../common/constans/colors.dart';
import '../../../common/constans/navigation.dart';
import '../../../common/constans/variables.dart';

class CardReport extends StatelessWidget {
  final ReportData data;
  const CardReport({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        Navigations.pushNavigation(
          context,
          EditReportPage(data: data),
        );
      },
      child: CustomContainer(
        borderRadius: BorderRadius.circular(10),
        boxShadow: Variables.shadowRadius1,
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.symmetric(horizontal: 16),
        widget: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _componentColumn(
                  Variables.name,
                  data.attributes!.name!,
                ),
                const Spacer(),
                CustomContainer(
                  bgColor: MyColors.brandColor,
                  borderRadius: BorderRadius.circular(10),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  widget: FontPoppins(
                    text: data.attributes!.noIdentity!,
                    size: 12,
                    fontWeight: FontWeight.w500,
                    color: MyColors.white,
                    alignment: TextAlign.center,
                    textOverflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            const CustomSeperator(),
            const SizedBox(height: 8),
            Row(
              children: [
                SizedBox(
                  width: 140,
                  child: _componentColumn(
                    Variables.city,
                    data.attributes!.city!,
                  ),
                ),
                const Spacer(),
                _componentColumn(
                  Variables.province,
                  data.attributes!.province!,
                ),
              ],
            ),
            _componentColumn(
              Variables.descReport,
              data.attributes!.descriptionReport!,
            ),
            data.attributes!.thumbnails!.data == null
                ? const SizedBox()
                : const SizedBox(height: 16),
            data.attributes!.thumbnails!.data == null
                ? const SizedBox()
                : SizedBox(
                    width: size.width,
                    height: 100,
                    child: Image.network(
                      "${ApiServices.baseUrl}${data.attributes!.thumbnails!.data!.first.attributes!.url!}",
                      fit: BoxFit.cover,
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  Widget _componentColumn(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FontPoppins(
          text: title,
          size: 12,
          fontWeight: FontWeight.w400,
          color: MyColors.blackFont,
          alignment: TextAlign.start,
        ),
        const SizedBox(height: 4),
        FontPoppins(
          text: value,
          size: 13,
          fontWeight: FontWeight.w500,
          color: MyColors.blackFont,
          alignment: TextAlign.start,
        ),
      ],
    );
  }
}
