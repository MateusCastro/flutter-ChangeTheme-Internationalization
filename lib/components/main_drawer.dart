import 'package:appbasepe/blocs/language.dart';
import 'package:appbasepe/blocs/theme.dart';
import 'package:appbasepe/components/radio_form.dart';
import 'package:appbasepe/core/internationalization/app_translate.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainDrawer extends StatefulWidget {
  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  @override
  Widget build(BuildContext context) {
    final strLight = AppTranslate(context).text("light");
    final strDark = AppTranslate(context).text("dark");

    final strSmall = AppTranslate(context).text("small");
    final strMedium = AppTranslate(context).text("medium");
    final strLarge = AppTranslate(context).text("large");
    final strExtraLarge = AppTranslate(context).text("extra_large");

    final strPortuguese = AppTranslate(context).text("portuguese");
    final strEnglish = AppTranslate(context).text("english");
    final strSpanish = AppTranslate(context).text("spanish");

    final themeProps = [
      {"label": strLight, "value": ThemeColorProps.light},
      {"label": strDark, "value": ThemeColorProps.dark}
    ];
    final fontProps = [
      {"label": strSmall, "value": ThemeTextProps.small},
      {"label": strMedium, "value": ThemeTextProps.medium},
      {"label": strLarge, "value": ThemeTextProps.large},
      {"label": strExtraLarge, "value": ThemeTextProps.extraLarge}
    ];
    final languageProps = [
      {"label": strPortuguese, "value": LanguageProps.pt},
      {"label": strEnglish, "value": LanguageProps.en},
      {"label": strSpanish, "value": LanguageProps.es},
    ];

    final theme = Provider.of<ThemeChanger>(context);
    final language = Provider.of<LanguageChanger>(context);

    ThemeColorProps _valueTheme = theme.getThemeColor();
    ThemeTextProps _valueThemeText = theme.getThemeText();
    LanguageProps _valueLanguage = language.getValueLanguage();

    void _selectTheme(Object item) {
      setState(() {
        _valueTheme = item;
      });
      theme.setTheme(item, _valueThemeText);
    }

    void _selectFont(Object item) {
      setState(() {
        _valueThemeText = item;
      });
      theme.setTheme(_valueTheme, item);
    }

    void _selectLanguage(Object item) {
      setState(() {
        _valueLanguage = item;
      });
      language.setLanguage(item);
    }

    return Drawer(
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppTranslate(context).text("menu")),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: Text(
                    AppTranslate(context).text("settings"),
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        AppTranslate(context).text("theme"),
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      RadioForm(
                        character: _valueTheme,
                        handleSelect: _selectTheme,
                        radioProps: themeProps,
                        orientation: OrientationProps.row,
                      ),
                      SizedBox(height: 10),
                      Text(
                        AppTranslate(context).text("font_size"),
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      RadioForm(
                        character: _valueThemeText,
                        handleSelect: _selectFont,
                        radioProps: fontProps,
                        orientation: OrientationProps.column,
                      ),
                      SizedBox(height: 10),
                      Text(
                        AppTranslate(context).text("language"),
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      RadioForm(
                        character: _valueLanguage,
                        handleSelect: _selectLanguage,
                        radioProps: languageProps,
                        orientation: OrientationProps.column,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
