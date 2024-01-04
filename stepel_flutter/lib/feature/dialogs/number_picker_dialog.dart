import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:stepel_flutter/core/utils/extensions/context_extension.dart';
import 'package:stepel_flutter/feature/app/themes.dart';

Future<int?> showNumberPickerDialog({
  required BuildContext context,
  required String title,
  required int currentValue,
  required int minValue,
  required int maxValue,
  required int step,
}) async {
  final Widget dialog = NumberPickerDialog(
    title: title,
    minValue: minValue,
    maxValue: maxValue,
    currentValue: currentValue,
    step: step,
  );

  return showDialog<int>(
    context: context,
    builder: (context) => dialog,
  );
}

class NumberPickerDialog extends StatefulWidget {
  final int minValue;
  final int maxValue;
  final int currentValue;
  final int step;
  final String title;

  const NumberPickerDialog({
    super.key,
    required this.minValue,
    required this.maxValue,
    required this.currentValue,
    required this.step,
    required this.title,
  });

  @override
  State<NumberPickerDialog> createState() => _NumberPickerDialogState();
}

class _NumberPickerDialogState extends State<NumberPickerDialog> {
  late int pickedValue;

  @override
  void initState() {
    pickedValue = widget.currentValue;
    super.initState();
  }

  void _handleCancel() {
    Navigator.pop(context, null);
  }

  void _handleOk() {
    Navigator.pop(context, pickedValue);
  }

  @override
  Widget build(BuildContext context) {
    final actions = Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ActionButton(
          onPressed: _handleCancel,
          text: context.localization.pickerCancelButtonText,
        ),
        ActionButton(
          onPressed: _handleOk,
          text: context.localization.pickerOkButton,
        ),
      ],
    );

    final title = Align(
      alignment: Alignment.centerLeft,
      child: Text(
        widget.title,
        style: const TextStyle(fontSize: 18),
      ),
    );

    final picker = NumberPicker(
      itemCount: 5,
      minValue: widget.minValue,
      maxValue: widget.maxValue,
      step: widget.step,
      value: pickedValue,
      haptics: true,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Themes.primaryBlueColorDark),
      ),
      selectedTextStyle: const TextStyle(color: Themes.primaryBlueColorDark, fontSize: 24),
      onChanged: (value) => setState(() => pickedValue = value),
    );

    return Dialog(
      child: SizedBox(
        width: 300,
        height: 340,
        child: Padding(
          padding: const EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 8),
          child: Column(
            children: [
              title,
              picker,
              actions,
            ],
          ),
        ),
      ),
    );
  }
}

class ActionButton extends StatelessWidget {
  final String text;
  final Function() onPressed;

  const ActionButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: Theme.of(context)
          .textButtonTheme
          .style!
          .copyWith(backgroundColor: const MaterialStatePropertyAll(Colors.transparent)),
      child: Text(text),
    );
  }
}
