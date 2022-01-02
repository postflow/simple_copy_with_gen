import 'package:test/test.dart';
import 'profile_model.dart';

void main() {
  test('different field', () {
    final ProfileModel profileModel = ProfileModel()..name = 'Sergio';
    final newProfileModel = profileModel.copyWith(name: 'Michael');
    expect(true, profileModel.name != newProfileModel.name);
  });

  test('different hashCode', () {
    final ProfileModel profileModel = ProfileModel()..name = 'Sergio';
    final newProfileModel = profileModel.copyWith(name: 'Michael');
    expect(true, profileModel.hashCode != newProfileModel.hashCode);
  });

  test('different equals', () {
    final ProfileModel profileModel = ProfileModel()..name = 'Sergio';
    final newProfileModel = profileModel.copyWith(name: 'Michael');
    expect(true, profileModel != newProfileModel);
  });
}