import 'package:flutter/material.dart';
import 'package:shop/core/constants/dimensions.dart';

import '../../../../core/constants/colors.dart';

class TextFieldOfAddressDetail extends StatefulWidget {
  const TextFieldOfAddressDetail(
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
      this.suffixIcon,
      this.isFilled = true,
      this.maxLines = 1,
      this.prefixIconColor = Colors.black38,
      this.onChanged,
      this.onSearch,
      this.isPrefix = true});
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
  final IconData? suffixIcon;
  final bool? isFilled;
  final bool? isPrefix;
  final int? maxLines;
  final Color? prefixIconColor;
  final Function(String)? onChanged;
  final Function()? onSearch;

  @override
  State<TextFieldOfAddressDetail> createState() =>
      _TextFieldOfAddressDetailState();
}

class _TextFieldOfAddressDetailState extends State<TextFieldOfAddressDetail> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width20),
      child: TextFormField(
        key: widget.fieldkey,
        controller: widget.controller,
        keyboardType: TextInputType.text,
        cursorColor: AppColors.primaryColor,
        obscureText: widget.isPasswordField == true ? _obscureText : false,
        onSaved: widget.onSaved,
        validator: widget.validator,
        onFieldSubmitted: widget.onFieldSubmitted,
        onChanged: widget.onChanged,
        maxLines: widget.maxLines,
        style: TextStyle(
            fontSize: font16,
            fontFamily: "Poppins",
            color: Colors.black45,
            fontWeight: FontWeight.w500),
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: const TextStyle(
              fontFamily: "Poppins", color: Colors.black26, fontSize: 14),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          contentPadding: const EdgeInsets.only(top: 20, left: 20),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(width: 1.5, color: Colors.black12),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(width: 1.5, color: Colors.black38),
          ),
          suffixIcon: InkWell(
            onTap: widget.onSearch,
            child: Icon(
              widget.suffixIcon,
              color: Colors.black38,
              size: font22,
            ),
          ),
        ),
      ),
    );
  }
}
