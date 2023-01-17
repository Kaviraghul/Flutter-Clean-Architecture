
import 'package:freezed_annotation/freezed_annotation.dart';
part 'freezed_data_classes.freezed.dart';

@freezed
class LoginObject with _$LoginObject{
  factory LoginObject({required String username, required String password}) = _LoginObject;
}