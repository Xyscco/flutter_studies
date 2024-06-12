import 'package:flutter/material.dart';
import 'package:flutter_design_system/flutter_design_system.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String title;
  final IconData? iconData;
  final Color? backgroundColor;

  const CustomButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.iconData,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = CustomTheme.of(context);
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        backgroundColor: backgroundColor ?? theme.colors.primary,
        padding: const EdgeInsets.all(12.0),
        alignment: Alignment.center,
      ),
      child: iconData == null
          ? Text(
              title,
              style: theme.fontStyle.bodyMedium.fs(16),
            )
          : Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(iconData, color: Colors.black87),
                const SizedBox(width: 16.0),
                Text(title, style: theme.fontStyle.bodyMedium.fs(16))
              ],
            ),
    );
  }
}
