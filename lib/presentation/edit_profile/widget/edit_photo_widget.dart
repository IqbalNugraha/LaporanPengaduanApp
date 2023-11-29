import 'package:flutter/material.dart';

import '../../../common/components/custom_bottom_popup.dart';
import '../../../common/components/custom_circle_photo.dart';
import '../../../common/constans/colors.dart';
import 'component_change_photo_widget.dart';

class EditPhotoWidget extends StatelessWidget {
  const EditPhotoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: SizedBox(
        width: 140,
        height: 140,
        child: Stack(
          children: [
            const CustomCirclePhoto(
              height: 140,
              width: 140,
              imageProfile: "",
            ),
            Positioned(
              right: 0,
              top: 98,
              child: GestureDetector(
                onTap: () {
                  CustomPopupBottom.showModalBottom(
                    context,
                    const ComponentChangePhotoWidget(),
                  );
                },
                child: const CircleAvatar(
                  radius: 21,
                  backgroundColor: MyColors.bgWhite,
                  child: Icon(
                    Icons.photo_camera_outlined,
                    color: MyColors.iconColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
