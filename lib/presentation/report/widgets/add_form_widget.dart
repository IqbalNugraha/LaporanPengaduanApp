import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:skripsi_project/bloc/raja_ongkir/get_province/get_province_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:skripsi_project/bloc/util/pick_report_image/pick_report_image_bloc.dart';
import 'package:skripsi_project/data/models/request/report/report_request_model.dart';

import '../../../bloc/raja_ongkir/get_city/get_city_bloc.dart';
import '../../../bloc/raja_ongkir/get_subdistrict/get_subdistrict_bloc.dart';
import '../../../bloc/report/add_report/add_report_bloc.dart';
import '../../../common/components/custom_button.dart';
import '../../../common/components/custom_circle_avatar.dart';
import '../../../common/components/custom_container.dart';
import '../../../common/components/custom_dropdown.dart';
import '../../../common/components/custom_font.dart';
import '../../../common/components/custom_listview.dart';
import '../../../common/components/custom_loading_state.dart';
import '../../../common/components/custom_text_field_no_border.dart';
import '../../../common/constans/colors.dart';
import '../../../common/constans/navigation.dart';
import '../../../common/constans/variables.dart';
import '../../../data/datasources/local_datasources.dart';
import '../../../data/models/response/raja_ongkir/city_response_model.dart';
import '../../../data/models/response/raja_ongkir/province_response_model.dart';
import '../../../data/models/response/raja_ongkir/subdistrict_response_model.dart';
import '../../../data/repositories/repo_bloc.dart';

class AddFormWidget extends StatefulWidget {
  const AddFormWidget({super.key});

  @override
  State<AddFormWidget> createState() => _AddFormWidgetState();
}

class _AddFormWidgetState extends State<AddFormWidget> {
  var nameController = TextEditingController();
  var noIdentityController = TextEditingController();
  var phoneController = TextEditingController();
  var addressController = TextEditingController();
  var descController = TextEditingController();
  var noKipController = TextEditingController();
  var noKksController = TextEditingController();
  var noBpjsController = TextEditingController();
  Province? _selectedProvince;
  City? _selectedCity;
  SubDistrict? _selectedSubdistrict;
  String? _province, _city, _subdistrict, _filePath;

  @override
  void initState() {
    context.read<GetProvinceBloc>().add(const GetProvinceEvent.getProvince());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return CustomListView(
      padding: const EdgeInsets.all(16),
      listWidget: [
        const FontPoppins(
          text: Variables.name,
          size: 14,
          fontWeight: FontWeight.w400,
          color: MyColors.blackFont,
          alignment: TextAlign.start,
        ),
        CustomTextFieldNoBorder(
          controller: nameController,
          hint: Variables.hintFullname,
        ),
        const SizedBox(height: 16),
        const FontPoppins(
          text: Variables.noIdentity,
          size: 14,
          fontWeight: FontWeight.w400,
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
          text: Variables.phoneNumber,
          size: 14,
          fontWeight: FontWeight.w400,
          color: MyColors.blackFont,
          alignment: TextAlign.start,
        ),
        CustomTextFieldNoBorder(
          controller: phoneController,
          hint: Variables.hintPhone,
          limit: 13,
          textInputType: TextInputType.phone,
        ),
        const SizedBox(height: 16),
        const FontPoppins(
          text: Variables.province,
          size: 14,
          fontWeight: FontWeight.w400,
          color: MyColors.blackFont,
          alignment: TextAlign.start,
        ),
        const SizedBox(height: 8),
        BlocBuilder<GetProvinceBloc, GetProvinceState>(
          builder: (context, state) {
            return state.maybeWhen(
              orElse: () {
                return const CustomLoadingState();
              },
              success: (response) {
                _selectedProvince = response.rajaongkir.results.first;
                return CustomDropdown(
                  borderColor: MyColors.blackFont,
                  textColor: MyColors.blackFont,
                  menuMaxHeight: 200,
                  items: response.rajaongkir.results,
                  value: _selectedProvince,
                  onChanged: (value) {
                    setState(() {
                      _selectedProvince = value;
                      _province = _selectedProvince!.province;
                      context.read<GetCityBloc>().add(GetCityEvent.getCity(
                            _selectedProvince!.provinceId,
                          ));
                    });
                  },
                );
              },
            );
          },
        ),
        _selectedProvince != null
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  const FontPoppins(
                    text: Variables.city,
                    size: 14,
                    fontWeight: FontWeight.w500,
                    color: MyColors.blackFont,
                    alignment: TextAlign.start,
                  ),
                  const SizedBox(height: 4),
                  BlocBuilder<GetCityBloc, GetCityState>(
                    builder: (context, state) {
                      return state.maybeWhen(
                        orElse: () {
                          return const CustomLoadingState();
                        },
                        success: (response) {
                          _selectedCity = response.rajaongkir.results.first;
                          return CustomDropdown(
                            borderColor: MyColors.blackFont,
                            textColor: MyColors.blackFont,
                            menuMaxHeight: 200,
                            items: response.rajaongkir.results,
                            value: _selectedCity,
                            onChanged: (value) {
                              setState(() {
                                _selectedCity = value;
                                _city = _selectedCity!.cityName;
                                context
                                    .read<GetSubdistrictBloc>()
                                    .add(GetSubdistrictEvent.getSubdistrict(
                                      _selectedCity!.cityId,
                                    ));
                              });
                            },
                          );
                        },
                      );
                    },
                  ),
                ],
              )
            : const SizedBox(),
        _selectedCity != null
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  const FontPoppins(
                    text: Variables.subdistrict,
                    size: 14,
                    fontWeight: FontWeight.w500,
                    color: MyColors.blackFont,
                    alignment: TextAlign.start,
                  ),
                  const SizedBox(height: 4),
                  BlocBuilder<GetSubdistrictBloc, GetSubdistrictState>(
                    builder: (context, state) {
                      return state.maybeWhen(
                        orElse: () {
                          return const CustomLoadingState();
                        },
                        success: (response) {
                          _selectedSubdistrict =
                              response.rajaongkir.results.first;
                          return CustomDropdown(
                            borderColor: MyColors.blackFont,
                            textColor: MyColors.blackFont,
                            menuMaxHeight: 200,
                            items: response.rajaongkir.results,
                            value: _selectedSubdistrict,
                            onChanged: (value) {
                              setState(() {
                                _selectedSubdistrict = value;
                                _subdistrict =
                                    _selectedSubdistrict!.subdistrictName;
                              });
                            },
                          );
                        },
                      );
                    },
                  ),
                ],
              )
            : const SizedBox(),
        const SizedBox(height: 16),
        const FontPoppins(
          text: Variables.address,
          size: 14,
          fontWeight: FontWeight.w400,
          color: MyColors.blackFont,
          alignment: TextAlign.start,
        ),
        CustomTextFieldNoBorder(
          controller: addressController,
          hint: Variables.hintAddress,
          limitLines: 4,
          textInputType: TextInputType.multiline,
        ),
        const SizedBox(height: 16),
        const FontPoppins(
          text: Variables.noKip,
          size: 14,
          fontWeight: FontWeight.w400,
          color: MyColors.blackFont,
          alignment: TextAlign.start,
        ),
        CustomTextFieldNoBorder(
          controller: noKipController,
          hint: Variables.hintIdIdentity,
          textInputType: TextInputType.number,
        ),
        const SizedBox(height: 16),
        const FontPoppins(
          text: Variables.noKks,
          size: 14,
          fontWeight: FontWeight.w400,
          color: MyColors.blackFont,
          alignment: TextAlign.start,
        ),
        CustomTextFieldNoBorder(
          controller: noKksController,
          hint: Variables.hintIdIdentity,
          textInputType: TextInputType.number,
        ),
        const SizedBox(height: 16),
        const FontPoppins(
          text: Variables.noBpjs,
          size: 14,
          fontWeight: FontWeight.w400,
          color: MyColors.blackFont,
          alignment: TextAlign.start,
        ),
        CustomTextFieldNoBorder(
          controller: noBpjsController,
          hint: Variables.hintIdIdentity,
          textInputType: TextInputType.number,
        ),
        const SizedBox(height: 16),
        const FontPoppins(
          text: Variables.additional,
          size: 14,
          fontWeight: FontWeight.w500,
          color: MyColors.brandColor,
          alignment: TextAlign.start,
        ),
        const SizedBox(height: 8),
        BlocBuilder<PickReportImageBloc, PickReportImageState>(
          builder: (context, state) {
            return state.maybeWhen(
              orElse: () {
                return GestureDetector(
                  onTap: () {
                    context
                        .read<PickReportImageBloc>()
                        .add(const PickReportImageEvent.pickImage());
                  },
                  child: const CustomContainer(
                    height: 90,
                    bgColor: MyColors.grey,
                    widget: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add,
                          color: MyColors.white,
                          size: 40,
                        ),
                        SizedBox(height: 8),
                        FontPoppins(
                          text: Variables.btnUpload,
                          size: 9,
                          fontWeight: FontWeight.w400,
                          color: MyColors.white,
                          alignment: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                );
              },
              success: (file) {
                _filePath = file.path;
                final fileImage = File(_filePath!);
                return SizedBox(
                  height: 180,
                  width: size.width,
                  child: Stack(
                    children: [
                      Image.file(
                        fileImage,
                        fit: BoxFit.cover,
                        width: size.width,
                      ),
                      Positioned(
                        top: 16,
                        right: 8,
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                context.read<PickReportImageBloc>().add(
                                    const PickReportImageEvent.pickImage());
                              },
                              child: const CustomCircleAvatar(
                                sizeRadius: 18,
                                widget: Icon(
                                  Icons.replay_outlined,
                                  color: MyColors.white,
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            GestureDetector(
                              onTap: () {
                                context
                                    .read<PickReportImageBloc>()
                                    .add(PickReportImageEvent.removeImage(
                                      _filePath!,
                                    ));
                              },
                              child: const CustomCircleAvatar(
                                bgColor: MyColors.red,
                                sizeRadius: 18,
                                widget: Icon(
                                  Icons.delete,
                                  color: MyColors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
              loading: () {
                return const CustomLoadingState();
              },
            );
          },
        ),
        const SizedBox(height: 28),
        BlocConsumer<AddReportBloc, AddReportState>(
          builder: (context, state) {
            return state.maybeWhen(
              orElse: () {
                return CustomButton(
                  function: () async {
                    final id = await LocalDatasource().getId();
                    final model = ReportRequestModel(
                      name: nameController.text,
                      noIdentity: noIdentityController.text,
                      phoneNumber: phoneController.text,
                      city: _city!,
                      province: _province!,
                      subdistrict: _subdistrict!,
                      address: addressController.text,
                      descriptionReport: descController.text,
                      noKip: noKipController.text,
                      noKks: noKksController.text,
                      noBpjs: noBpjsController.text,
                      account: id,
                    );
                    final files = _filePath != null
                        ? await http.MultipartFile.fromPath(
                            'file',
                            _filePath!,
                            contentType: MediaType('image', 'png'),
                          )
                        : null;
                    if (context.mounted) {
                      context
                          .read<AddReportBloc>()
                          .add(AddReportEvent.addReport(
                            model,
                            files,
                          ));
                    }
                  },
                  widget: const FontPoppins(
                    text: Variables.btnSubmit,
                    size: 16,
                    fontWeight: FontWeight.w500,
                    color: MyColors.white,
                    alignment: TextAlign.start,
                  ),
                );
              },
              loading: () {
                return const CustomLoadingState();
              },
            );
          },
          listener: (context, state) {
            state.maybeWhen(
              orElse: () {},
              success: (response) {
                Fluttertoast.showToast(msg: Variables.msgSuccess);
                Navigations.popNavigation(context);
                RepoBloc.initBloc(context);
              },
              error: (error) {
                Fluttertoast.showToast(msg: error);
              },
            );
          },
        ),
      ],
    );
  }
}
