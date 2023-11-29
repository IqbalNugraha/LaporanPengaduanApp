import 'package:flutter/material.dart';

import '../../../common/components/custom_bottom_popup.dart';
import '../../../common/components/custom_container.dart';
import '../../../common/components/custom_font.dart';
import '../../../common/components/custom_seperator.dart';
import '../../../common/constans/colors.dart';
import '../../../common/constans/variables.dart';
import 'component_validation.dart';

class ComponentChangePhotoWidget extends StatefulWidget {
  const ComponentChangePhotoWidget({super.key});

  @override
  State<ComponentChangePhotoWidget> createState() =>
      _ComponentChangePhotoWidgetState();
}

class _ComponentChangePhotoWidgetState
    extends State<ComponentChangePhotoWidget> {
  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      bgColor: MyColors.bgWhite,
      height: 315,
      padding: const EdgeInsets.all(16),
      widget: Column(
        children: [
          const CustomSeperator(
            height: 3,
            width: 100,
            colorSeperator: MyColors.bottomPopup,
          ),
          const SizedBox(height: 32),
          CustomContainer(
            borderRadius: BorderRadius.circular(20),
            height: 200,
            border: Border.all(color: MyColors.brandColor),
            widget: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: _rowComponent(
                    Variables.choosePhoto,
                    Icons.image,
                  ),
                ),
                const SizedBox(height: 16),
                const CustomSeperator(
                  colorSeperator: MyColors.brandColor,
                ),
                const SizedBox(height: 16),
                GestureDetector(
                  onTap: () {},
                  child: _rowComponent(
                    Variables.takePhoto,
                    Icons.camera_alt_outlined,
                  ),
                ),
                const SizedBox(height: 16),
                const CustomSeperator(
                  colorSeperator: MyColors.brandColor,
                ),
                const SizedBox(height: 16),
                GestureDetector(
                  onTap: () {
                    CustomPopupBottom.showModalBottom(
                      context,
                      const ComponentValidation(),
                    );
                  },
                  child: _rowComponent(
                    Variables.removePhoto,
                    Icons.delete_outline,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _rowComponent(String title, IconData icon) {
    return Container(
      width: double.infinity,
      color: Colors.transparent,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FontPoppins(
            text: title,
            size: 16,
            fontWeight: FontWeight.w500,
            color: MyColors.brandColor,
            alignment: TextAlign.start,
          ),
          Icon(
            icon,
            size: 30,
            color: MyColors.brandColor,
          ),
        ],
      ),
    );
  }
}
