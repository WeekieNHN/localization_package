# Godot Localization Package

A simple .csv file of translations and an autoload to add them to your Godot project automatically. The translation .csv is a modified version of [The Polyglot Game Dev Spreadsheet](https://docs.google.com/spreadsheets/d/17f0dQawb-s_Fd7DHgmVvJoEGDMH_yoSd8EYigrb0zmM/edit?usp=sharing). Also, this has an optional integration with [My Debug/Developer Console](https://github.com/WeekieNHN/GodotDevConsole).

## Installation

### Where to put what files?
Add `addons/localization_package` to your addons folder, and then activate the plugin in `Project->Project Settings->Plugins`.  

### Confirm translations import correctly

Under `addons/localization_package/Translations` there should be a .csv file and a bunch of .translation files for different locales. If not, check the import settings for the .csv file.

### Enabling plugin/autoload

The Global Autoload localization_manager.gd should be enabled when the plugin is activated but confirm that it is in `Project->Project Settings->Globals`.

### Commands

If you **do not** want to integrate with the [The Debug/Developer Console](https://github.com/WeekieNHN/GodotDevConsole), just delete `addons/localization_package/commands`. It will throw a compilation error on import if you do not have the console plugin installed.

If **do** want to integrate with the console. You'll need to add the scenes from the command folder under the console scene's `Commands` node. See the README for the console for more information on adding commands.

## Demo

Included is a demo scene with examples of Labels, Buttons, and script-set text with translations.

## Caveats

- Only en_US, no en_GB
- Default Godot Font seems to break on mac with some languages

## Commands

I included some commands to help test localization.

### `set_lang <locale_code>`

Sets the locale on the TranslationServer. If you don't know what locales are available, just type `set_lang`.

### `shuffle_lang`

Shuffles through languages quickly to test string lengths. The command is a toggle, so using it once will enabled, and again will disable it. When disabled the locale is set to the OS's locale.

## Sources
Polyglot Game Dev Spreadsheet: https://docs.google.com/spreadsheets/d/17f0dQawb-s_Fd7DHgmVvJoEGDMH_yoSd8EYigrb0zmM/edit?usp=sharing
Country Codes (Top Row of .csv): https://docs.godotengine.org/en/stable/tutorials/i18n/locales.html#doc-locales
Microsoft Language Resources: https://learn.microsoft.com/en-us/globalization/reference/microsoft-language-resources
Internationalizng: https://docs.godotengine.org/en/stable/tutorials/i18n/internationalizing_games.html
More Translations (I didn't add): https://docs.google.com/spreadsheets/d/197GYEhPpk0DQTEO0r80v_k_bkGVtUgBB08PP--hqCIA/edit?usp=sharing