import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:adhyan/core/constants/app_colors.dart';
import 'package:adhyan/core/constants/app_sizes.dart';

/// Custom text field widget for consistent styling across the app
class CustomTextField extends StatelessWidget {
  const CustomTextField({
    required this.controller,
    super.key,
    this.label,
    this.hint,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.keyboardType,
    this.validator,
    this.onChanged,
    this.maxLines = 1,
    this.enabled = true,
    this.readOnly = false,
    this.inputFormatters,
    this.onTap,
  });

  final TextEditingController controller;
  final String? label;
  final String? hint;
  final IconData? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final int maxLines;
  final bool enabled;
  final bool readOnly;
  final List<TextInputFormatter>? inputFormatters;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      validator: validator,
      onChanged: onChanged,
      maxLines: maxLines,
      enabled: enabled,
      readOnly: readOnly,
      inputFormatters: inputFormatters,
      onTap: onTap,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixIcon: prefixIcon != null
            ? Icon(
                prefixIcon,
                size: AppSizes.iconS,
                color: AppColors.textSecondary,
              )
            : null,
        suffixIcon: suffixIcon,
      ),
    );
  }
}

/// Password text field with visibility toggle
class PasswordTextField extends StatefulWidget {
  const PasswordTextField({
    required this.controller,
    super.key,
    this.label,
    this.hint,
    this.validator,
    this.onChanged,
  });

  final TextEditingController controller;
  final String? label;
  final String? hint;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller: widget.controller,
      label: widget.label,
      hint: widget.hint,
      obscureText: _obscureText,
      validator: widget.validator,
      onChanged: widget.onChanged,
      prefixIcon: Icons.lock_outline,
      suffixIcon: IconButton(
        icon: Icon(
          _obscureText
              ? Icons.visibility_outlined
              : Icons.visibility_off_outlined,
          size: AppSizes.iconS,
          color: AppColors.textSecondary,
        ),
        onPressed: () {
          setState(() {
            _obscureText = !_obscureText;
          });
        },
      ),
    );
  }
}
