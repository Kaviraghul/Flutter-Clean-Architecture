// ignore_for_file: constant_identifier_names

enum LanguageType{
  ENGLISH,
  HINDI
}


const String ENGLISH = "en";
const String HINDI = "hi";

extension LanguageTypeExtension on LanguageType{
  String getValue(){
    switch(this){
      
      case LanguageType.ENGLISH:
        return ENGLISH;
      case LanguageType.HINDI:
        return HINDI;
    }
  }
}