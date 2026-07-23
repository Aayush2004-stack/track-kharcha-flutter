import 'package:flutter/material.dart';
import 'package:track_kharcha/core/customs/custom_text.dart';

class CustomTextFormField extends StatefulWidget {
  final String label;
  final String hintText;
  final bool isPassword;
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;

  const CustomTextFormField({
    super.key,
    required this.label,
    required this.hintText,
    required this.controller,
    this.validator,
    this.isPassword = false,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
        ),

        const SizedBox(height: 10),
        TextFormField(
          controller: widget.controller,
          validator: widget.validator,
          obscureText: widget.isPassword ? obscure : false,
          decoration: InputDecoration(
            hintText: widget.hintText,
            filled: true,
            fillColor: Color(0xffF4F4F5),
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),

            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide.none,
            ),

            suffixIcon: widget.isPassword
                ? IconButton(
                    icon: Icon(
                      obscure
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                    ),
                    onPressed: () {
                      setState(() {
                        obscure = !obscure;
                      });
                    },
                  )
                : null,
          ),
        ),
      ],
    );
  }
}
