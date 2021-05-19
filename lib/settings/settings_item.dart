import 'package:flutter/material.dart';

class SettingsItem extends StatelessWidget {
  const SettingsItem({
    required this.title,
    required this.onPressed,
    this.trailing,
    Key? key,
  }) : super(key: key);

  final String title;
  final VoidCallback onPressed;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        title: Text(title),
        onTap: onPressed,
        trailing: trailing,
      ),
    );
  }
}
