import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_android_ios/settings/settings_item.dart';
import 'package:web_android_ios/theme/theme_state.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({
    Key? key,
  }) : super(key: key);

  @override
  _SettingsViewState createState() {
    return _SettingsViewState();
  }
}

class _SettingsViewState extends State<SettingsView> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeState>(
      builder: (BuildContext context, ThemeState state, Widget? child) {
        return Padding(
          padding: const EdgeInsets.all(8),
          child: ListView(
            children: [
              SettingsItem(
                title: 'Dark mode',
                onPressed: state.toggleBrightness,
                trailing: CupertinoSwitch(onChanged: (_) {}, value: state.brightness == Brightness.dark),
              ),
              for (FlexScheme scheme in FlexScheme.values)
                SettingsItem(
                  title: FlexColor.schemes[scheme]?.name ?? scheme.toString(),
                  onPressed: () => state.setScheme(scheme),
                ),
            ],
          ),
        );
      },
    );
  }
}
