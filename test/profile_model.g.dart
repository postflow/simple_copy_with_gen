// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_model.dart';

// **************************************************************************
// ExtensionGenerator
// **************************************************************************

extension GeneratedModel on ProfileModel {
  Map<String, dynamic> get variables => {
        'name': _name,
        'age': _age,
        'codes': _codes,
      };
  String get name => variables['name'];
  set name(String name) => _name = name;
  int get age => variables['age'];
  set age(int age) => _age = age;
  bool get codes => variables['codes'];
  set codes(bool codes) => _codes = codes;
  ProfileModel copyWith({
    String? name,
    int? age,
    bool? codes,
  }) =>
      ProfileModel()
        .._name = name ?? this._name
        .._age = age ?? this._age
        .._codes = codes ?? this._codes;
}
