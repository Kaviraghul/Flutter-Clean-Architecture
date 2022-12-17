// ignore_for_file: import_of_legacy_library_into_null_safe, prefer_final_fields, constant_identifier_names, unnecessary_null_comparison

import 'package:flutter_clean_architecture/presentation/resources/language_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';


const String PREFS_KEY_LANG = "PREFS_KEY_LANG ";
class AppPreferences{
  SharedPreferences _sharedPreferences;
  AppPreferences(this._sharedPreferences);

  Future<String> getAppLanguage() async{
    String? language = _sharedPreferences.getString(PREFS_KEY_LANG);
    if(language != null && language.isNotEmpty){
      return language;
    }else{
      return LanguageType.ENGLISH.getValue();
    }
  }


}