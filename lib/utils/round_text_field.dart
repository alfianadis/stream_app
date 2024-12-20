import 'package:flutter/material.dart';
import 'package:test_bnetfit/utils/colors.dart';

class RoundTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String title;
  final TextInputType? keyboardType;
  final bool obscureText;
  final Widget? left;
  final Widget? right;

  const RoundTextField(
      {super.key,
      required this.title,
      this.controller,
      this.hintText,
      this.keyboardType,
      this.obscureText = false,
      this.left,
      this.right});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
              color: AppColors.text, fontSize: 13, fontWeight: FontWeight.w700),
        ),
        const SizedBox(
          height: 8,
        ),
        Container(
          decoration: BoxDecoration(
            color: AppColors.card,
            borderRadius: BorderRadius.circular(9),
            boxShadow: const [
              BoxShadow(
                  color: Colors.black12, blurRadius: 6, offset: Offset(0, 4))
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              left ?? const SizedBox(),
              Expanded(
                child: TextField(
                  controller: controller,
                  autocorrect: false,
                  obscureText: obscureText,
                  keyboardType: keyboardType,
                  decoration: InputDecoration(
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    hintText: hintText,
                    hintStyle: TextStyle(
                        color: AppColors.subtext,
                        fontSize: 17,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              right ?? const SizedBox()
            ],
          ),
        )
      ],
    );
  }
}
