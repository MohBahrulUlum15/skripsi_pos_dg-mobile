import 'package:flutter/material.dart';

Widget customPrimaryButton({
  required BuildContext context,
  required String text,
  required bool isEnabled,
  double? height,
  double? width,
  TextStyle? textStyle,
  required Function() onPressed,
}) {
  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    onPrimary: Theme.of(context).colorScheme.onPrimary,
    primary: isEnabled ? Theme.of(context).colorScheme.primary : Colors.grey,
    minimumSize: const Size(double.infinity, 50),
    padding: const EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(16)),
    ),
  );

  return Container(
    height: height,
    width: width,
    child: ElevatedButton(
      style: raisedButtonStyle,
      onPressed: isEnabled ? onPressed : (){},
      child: Text(
        text,
        style: textStyle,
      ),
    ),
  );
}

