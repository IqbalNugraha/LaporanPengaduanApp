// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomListView extends StatelessWidget {
  final List<Widget> listWidget;
  final EdgeInsetsGeometry padding;
  const CustomListView({
    Key? key,
    required this.listWidget,
    this.padding = EdgeInsets.zero,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(      
      padding: padding,
      physics: const BouncingScrollPhysics(),
      children: listWidget,
    );
  }
}
