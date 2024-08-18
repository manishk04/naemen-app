import 'package:flutter/material.dart';

class LanguagePickerDialog extends StatefulWidget {
  const LanguagePickerDialog({super.key});

  @override
  State<LanguagePickerDialog> createState() => _LanguagePickerDialogState();
}

class _LanguagePickerDialogState extends State<LanguagePickerDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Pick a language'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            title: Text('English'),
            onTap: () {
              Navigator.pop(context, 'English');
            },
          ),
          ListTile(
            title: Text('Spanish'),
            onTap: () {
              Navigator.pop(context, 'Spanish');
            },
          ),
          ListTile(
            title: Text('French'),
            onTap: () {
              Navigator.pop(context, 'French');
            },
          ),
        ],
      ),
    );
  }
}
