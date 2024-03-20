import 'package:flutter/material.dart';
import 'package:shop/core/constants/dimensions.dart';

import '../../../../core/constants/colors.dart';

class FormContainerHome extends StatefulWidget {
  const FormContainerHome(
      {super.key,
      this.controller,
      this.fieldkey,
      this.isPasswordField,
      this.hintText,
      this.labelText,
      this.helperText,
      this.onSaved,
      this.validator,
      this.onFieldSubmitted,
      this.type,
      this.prefixIcon,
      this.isFilled = true,
      this.maxLines = 1,
      this.fillColor = Colors.white60,
      this.prefixIconColor = Colors.black38,
      this.onChanged,
      this.onSearch,
      this.isPrefix = true,
      this.isSuffix = true,
      this.suffixIcon = Icons.search});
  final TextEditingController? controller;
  final Key? fieldkey;
  final bool? isPasswordField;
  final String? hintText;
  final String? labelText;
  final String? helperText;
  final FormFieldSetter<String>? onSaved;
  final String? Function(String?)? validator;
  final ValueChanged<String>? onFieldSubmitted;
  final TextInputType? type;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final bool? isFilled;
  final bool? isPrefix;
  final bool? isSuffix;
  final int? maxLines;
  final Color? fillColor;
  final Color? prefixIconColor;
  final Function(String)? onChanged;
  final Function()? onSearch;

  @override
  State<FormContainerHome> createState() => _FormContainerHomeState();
}

class _FormContainerHomeState extends State<FormContainerHome> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: widget.fieldkey,
      controller: widget.controller,
      keyboardType: widget.type,
      cursorColor: AppColors.primaryColor,
      obscureText: widget.isPasswordField == true ? _obscureText : false,
      onSaved: widget.onSaved,
      validator: widget.validator,
      onFieldSubmitted: widget.onFieldSubmitted,
      onChanged: widget.onChanged,
      maxLines: widget.maxLines,
      style: TextStyle(
          fontSize: font16,
          fontFamily: "Nunito",
          color: Colors.black45,
          fontWeight: FontWeight.w500),
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: const TextStyle(
            fontFamily: "Nunito", color: Colors.black38, fontSize: 14),
        prefixIcon: widget.isPrefix == true
            ? Icon(
                widget.prefixIcon,
                size: 18,
              )
            : null,
        prefixIconColor:
            widget.isPrefix == true ? widget.prefixIconColor : Colors.white60,
        fillColor: widget.fillColor,
        filled: widget.isFilled,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        contentPadding: const EdgeInsets.only(top: 20, left: 20),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(width: 1.5, color: Colors.transparent),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(width: 1.5, color: Colors.transparent),
        ),
        suffixIcon: widget.isSuffix == true
            ? GestureDetector(
                onTap: widget.onSearch,
                child: Icon(
                  widget.suffixIcon,
                  color: Colors.black38,
                  size: font18,
                ),
              )
            : SizedBox(),
      ),
    );
  }
}
