import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class Language extends StatefulWidget {
  const Language({super.key});

  @override
  State<Language> createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  late String _selectedLanguage = 'ID';
  final List<String> _languages = ['ID', 'EN'];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {});
  }

  void _setLanguage(String? value) {
    if (value != null) {
      context.setLocale(Locale(value.toLowerCase()));
      setState(() {
        _selectedLanguage = value;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      style: const TextStyle(fontSize: 15),
      underline: const SizedBox(),
      value: _selectedLanguage,
      items: [
        for (final locale in _languages)
          DropdownMenuItem(
            value: locale.toString().toUpperCase(),
            child: Text(
              locale.toString().toUpperCase(),
              style: const TextStyle(
                color: Colors.black,
              ),
            ),
          )
      ],
      selectedItemBuilder: (context) {
        return _languages.map((l) {
          return DropdownMenuItem(
            child: Text(
              _selectedLanguage,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          );
        }).toList();
      },
      onChanged: _setLanguage,
    );
  }
}
