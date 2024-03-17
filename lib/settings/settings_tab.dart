import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/my_theme.dart';
import 'package:islami_app/settings/language_bottom_sheet.dart';
import 'package:islami_app/settings/theme_bottom_sheet.dart';
import 'package:provider/provider.dart';

import '../providers/app_config_provider.dart';

class SettingsTab extends StatefulWidget {
  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  late String _selectedLanguage;

  @override
  void initState() {
    super.initState();
    _selectedLanguage = Provider.of<AppConfigProvider>(context, listen: false).appLanguage;
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    Color radioActiveColor = provider.isDarkMode() ? Colors.yellow : Theme.of(context).primaryColor;

    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 20),
          Text(
            AppLocalizations.of(context)!.language,
            style: Theme.of(context).textTheme.headline6,
          ),
          SizedBox(height: 10),
          ListTile(
            title: Text(
              _selectedLanguage == 'ar' ? 'عربي' : 'English',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            trailing: Switch(
              value: _selectedLanguage == 'ar',
              onChanged: (value) {
                setState(() {
                  _selectedLanguage = value ? 'ar' : 'en';
                  provider.changeLanguage(_selectedLanguage);
                });
              },
              activeColor: MyTheme.yellowColor,
            ),
          ),
          SizedBox(height: 30),
          Text(
            AppLocalizations.of(context)!.theme,
            style: Theme.of(context).textTheme.headline6,
          ),
          SizedBox(height: 10),
          ListTile(
            title: Text(
              provider.isDarkMode()
                  ? AppLocalizations.of(context)!.dark
                  : AppLocalizations.of(context)!.light,
            ),
            leading: Icon(
              provider.isDarkMode() ? Icons.nightlight_round : Icons.wb_sunny,
              color: provider.isDarkMode() ? Colors.yellow : Colors.orange,
            ),
            trailing: Switch(
              value: provider.isDarkMode(),
              onChanged: (value) {
                provider.toggleDarkMode(value);
              },
              activeColor: MyTheme.yellowColor,
            ),
          ),
        ],
      ),
    );
  }

  void showLanguageBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => LanguageBottomSheet(),
    );
  }

  void showThemeBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) => ThemeBottomSheet(),
    );
  }
}
