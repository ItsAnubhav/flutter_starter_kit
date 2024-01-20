import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.light);

  void changeTheme(ThemeMode themeMode) {
    emit(themeMode);
  }
}

class LanguageCubit extends Cubit<Locale> {
  LanguageCubit() : super(const Locale('en', ''));

  static const _languageEn = Locale('en', '');
  static const _languageEs = Locale('es', '');
  static const _languageTr = Locale('tr', '');

  void changeLangEn(context) async {
    emit(_languageEn);
  }

  void changeLangEs(context) async {
    emit(_languageEs);
  }

  void changeLangTr(context) async {
    emit(_languageTr);
  }
}
