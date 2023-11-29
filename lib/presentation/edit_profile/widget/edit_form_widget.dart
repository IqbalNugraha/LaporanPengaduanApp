import 'package:flutter/material.dart';
import 'package:skripsi_project/common/extensions/date_format_ext.dart';
import 'package:skripsi_project/data/models/response/account/account_detail_response.dart';

import '../../../common/components/custom_button.dart';
import '../../../common/components/custom_dropdown.dart';
import '../../../common/components/custom_font.dart';
import '../../../common/components/custom_listview.dart';
import '../../../common/components/custom_seperator.dart';
import '../../../common/components/custom_text_field_no_border.dart';
import '../../../common/constans/colors.dart';
import '../../../common/constans/variables.dart';

class EditFormWidget extends StatefulWidget {
  final AccountDetailData data;
  const EditFormWidget({
    super.key,
    required this.data,
  });

  @override
  State<EditFormWidget> createState() => _EditFormWidgetState();
}

class _EditFormWidgetState extends State<EditFormWidget> {
  DateTime _now = DateTime.now();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var noIdentityController = TextEditingController();
  var phoneController = TextEditingController();
  var addressController = TextEditingController();
  String _selectedGender = "male";
  final List<String> _listGender = [
    "male",
    "female",
  ];
  DateTime? _pickMonth;

  @override
  void initState() {
    nameController.text = widget.data.attributes!.name!;
    emailController.text = widget.data.attributes!.email!;
    noIdentityController.text = widget.data.attributes!.noIdentity ?? "";
    phoneController.text = widget.data.attributes!.phoneNumber ?? "";
    addressController.text = widget.data.attributes!.address ?? "";
    _now = widget.data.attributes!.birthDate ?? DateTime.now();
    _selectedGender = widget.data.attributes!.gender ?? "Male";
    super.initState();
  }

  Future<DateTime> _showBirthdatePick() async {
    _pickMonth = await showDatePicker(
      context: context,
      firstDate: DateTime(1945),
      lastDate: DateTime.now(),
      initialDate: _now,
    );
    if (_pickMonth == null) {
      return _pickMonth = DateTime.now();
    } else {
      setState(() {
        _now = _pickMonth!;
      });
      return _pickMonth!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomListView(
      padding: const EdgeInsets.all(16),
      listWidget: [
        const FontPoppins(
          text: Variables.name,
          size: 14,
          fontWeight: FontWeight.w500,
          color: MyColors.blackFont,
          alignment: TextAlign.start,
        ),
        CustomTextFieldNoBorder(
          controller: nameController,
          hint: Variables.hintFullname,
        ),
        const SizedBox(height: 16),
        const FontPoppins(
          text: Variables.email,
          size: 14,
          fontWeight: FontWeight.w500,
          color: MyColors.blackFont,
          alignment: TextAlign.start,
        ),
        CustomTextFieldNoBorder(
          controller: emailController,
          hint: Variables.hintEmail,
          textInputType: TextInputType.emailAddress,
        ),
        const SizedBox(height: 16),
        const FontPoppins(
          text: Variables.noIdentity,
          size: 14,
          fontWeight: FontWeight.w500,
          color: MyColors.blackFont,
          alignment: TextAlign.start,
        ),
        CustomTextFieldNoBorder(
          controller: noIdentityController,
          hint: Variables.hintIdIdentity,
          textInputType: TextInputType.number,
        ),
        const SizedBox(height: 16),
        const FontPoppins(
          text: Variables.birthDate,
          size: 14,
          fontWeight: FontWeight.w500,
          color: MyColors.brandColor,
          alignment: TextAlign.start,
        ),
        Row(
          children: [
            FontPoppins(
              text: (_now.toString()).toFormattedBirthDate,
              size: 14,
              fontWeight: FontWeight.w400,
              color: MyColors.blackFont,
              alignment: TextAlign.start,
            ),
            const Spacer(),
            CustomButton(
              width: 100,
              function: () {
                _showBirthdatePick();
              },
              widget: const FontPoppins(
                text: Variables.pickDate,
                size: 12,
                fontWeight: FontWeight.w400,
                color: MyColors.white,
                alignment: TextAlign.center,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        const CustomSeperator(
          colorSeperator: MyColors.brandColor,
        ),
        const SizedBox(height: 16),
        const FontPoppins(
          text: Variables.phoneNumber,
          size: 14,
          fontWeight: FontWeight.w500,
          color: MyColors.blackFont,
          alignment: TextAlign.start,
        ),
        CustomTextFieldNoBorder(
          controller: phoneController,
          hint: Variables.hintPhone,
          textInputType: TextInputType.phone,
          limit: 13,
        ),
        const SizedBox(height: 16),
        const FontPoppins(
          text: Variables.gender,
          size: 14,
          fontWeight: FontWeight.w500,
          color: MyColors.blackFont,
          alignment: TextAlign.start,
        ),
        CustomDropdown(
          value: _selectedGender,
          items: _listGender,
          onChanged: (value) {
            setState(() {
              _selectedGender = value!;
            });
          },
        ),
        const SizedBox(height: 16),
        const FontPoppins(
          text: Variables.address,
          size: 14,
          fontWeight: FontWeight.w500,
          color: MyColors.blackFont,
          alignment: TextAlign.start,
        ),
        CustomTextFieldNoBorder(
          controller: addressController,
          hint: Variables.hintAddress,
          textInputType: TextInputType.multiline,
          limitLines: 4,
        ),
        const SizedBox(height: 32),
        CustomButton(
          function: () {},
          widget: const FontPoppins(
            text: Variables.btnSubmit,
            size: 14,
            fontWeight: FontWeight.w500,
            color: MyColors.white,
            alignment: TextAlign.center,
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
