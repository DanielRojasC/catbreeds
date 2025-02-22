import 'package:catbreeds/app/utils/constants/styles.dart';
import 'package:flutter/material.dart';

class SearchInputWidget extends StatelessWidget {
  final TextEditingController controller;
  const SearchInputWidget({required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: Styles.searchInputDecoration("Search..."),
    );
  }
}
