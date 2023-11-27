import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skripsi_project/presentation/detail_profile/detail_profile_page.dart';

import '../../../bloc/account/get_account/get_account_bloc.dart';
import '../../../common/components/custom_bottom_popup.dart';
import '../../../common/components/custom_font.dart';
import '../../../common/components/custom_loading_state.dart';
import '../../../common/constans/colors.dart';
import '../../../common/constans/navigation.dart';
import '../../../common/constans/variables.dart';
import 'component_logout.dart';

class ProfileFeatureWidget extends StatelessWidget {
  const ProfileFeatureWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAccountBloc, GetAccountState>(
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () {
            return const CustomLoadingState();
          },
          success: (response) {
            return ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                FontPoppins(
                  text: response.data!.attributes!.name!,
                  size: 18,
                  fontWeight: FontWeight.w500,
                  color: MyColors.blackFont,
                  alignment: TextAlign.center,
                ),
                const SizedBox(height: 28),
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
                  onTap: () {
                    Navigations.pushNavigation(
                      context,
                      DetailProfilePage(
                        data: response.data!,
                      ),
                    );
                  },
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
                  onTap: () {
                    CustomPopupBottom.showModalBottom(
                      context,
                      const ComponentLogout(),
                    );
                  },
                ),
              ],
            );
          },
          error: (error) {
            return Center(
              child: FontPoppins(
                text: error,
                size: 16,
                fontWeight: FontWeight.w600,
                color: MyColors.blackFont,
                alignment: TextAlign.center,
              ),
            );
          },
        );
      },
    );
  }
}
