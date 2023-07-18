import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../action/app_action.dart';
import '../../styles/colors.dart';
import 'input_label.dart';


class PrimaryInput extends StatefulWidget {
  final TextEditingController textEditingController;
  final String label;
  final String hintText;
  final TextInputType inputType;
  final String id;

  const PrimaryInput({
    Key? key,
    required this.textEditingController,
    this.label = "",
    this.hintText = "",
    this.inputType = TextInputType.text,
    this.id = "",
  }) : super(key: key);

  @override
  State<PrimaryInput> createState() => _PrimaryInputState();
}

class _PrimaryInputState extends State<PrimaryInput> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label.isNotEmpty)
          InputLabel(
            label: widget.label,
          ),
        TextFormField(
          onChanged: (value) {
            context.read<AppAction>().clearError(widget.id);
          },
          decoration: InputDecoration(
            constraints: const BoxConstraints(minHeight: 55),
            hintText: widget.hintText,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: AppColors.primaryColor, width: 2.5),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: AppColors.primaryColor, width: 2.5),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: AppColors.primaryColor, width: 2.5),
            ),
          ),
          controller: widget.textEditingController,
          obscureText: widget.inputType == TextInputType.visiblePassword,
          inputFormatters: [
            if (widget.inputType == TextInputType.number ||
                widget.inputType ==
                    const TextInputType.numberWithOptions(
                        signed: false, decimal: false))
              FilteringTextInputFormatter.digitsOnly,
            if (widget.inputType ==
                const TextInputType.numberWithOptions(
                    signed: false, decimal: true))
              FilteringTextInputFormatter.allow(
                RegExp(r'^\d*\.?\d{0,2}'),
              ),
            if (widget.inputType == TextInputType.text)
              FilteringTextInputFormatter.allow(RegExp("[0-9a-zA-Zأ-ي]")),
          ],
        ),
        if (context.watch<AppAction>().errors[widget.id] != null)
          Container(
            margin: const EdgeInsets.only(
              top: 3,
            ),
            child: Text(
              context.watch<AppAction>().errors[widget.id]!,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
          ),
      ],
    );
  }
}
