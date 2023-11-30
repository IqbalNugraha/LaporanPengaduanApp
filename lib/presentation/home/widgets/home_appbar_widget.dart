import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skripsi_project/common/components/custom_circle_photo.dart';
import 'package:skripsi_project/common/constans/api_services.dart';

import '../../../bloc/account/get_account/get_account_bloc.dart';
import '../../../common/components/custom_font.dart';
import '../../../common/components/custom_skelton.dart';
import '../../../common/constans/colors.dart';

class HomeAppbarWidget extends StatelessWidget {
  const HomeAppbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlocBuilder<GetAccountBloc, GetAccountState>(
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () {
            return Row(
              children: [
                const CustomSkelton(
                  height: 35,
                  width: 35,
                  boxShape: BoxShape.circle,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomSkelton(
                        height: 30,
                        width: size.width,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      const SizedBox(height: 8),
                      CustomSkelton(
                        height: 40,
                        width: size.width,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
          success: (response) {
            return Row(
              children: [
                CustomCirclePhoto(
                  imageProfile:
                      "${ApiServices.baseUrl}${response.data!.attributes!.thumbnails!.data!.attributes!.url!}",
                ),
                const SizedBox(width: 24),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FontPoppins(
                        text: response.data!.attributes!.name!,
                        size: 20,
                        fontWeight: FontWeight.w600,
                        color: MyColors.blackFont,
                        alignment: TextAlign.start,
                      ),
                      const SizedBox(height: 8),
                      const FontPoppins(
                        text: "Developer",
                        size: 14,
                        fontWeight: FontWeight.w400,
                        color: MyColors.blackFont,
                        alignment: TextAlign.start,
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
          error: (error) {
            return FontPoppins(
              text: error,
              size: 20,
              fontWeight: FontWeight.w600,
              color: MyColors.blackFont,
              alignment: TextAlign.start,
            );
          },
        );
      },
    );
  }
}
