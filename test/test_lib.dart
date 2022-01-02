
import 'package:test/test.dart';

import 'profile_model.dart';




void main() {
  test('Counter value should be incremented', () {
    final ProfileModel profileModel = ProfileModel()..name = 'Sergio';

    final newProfileModel = profileModel.copyWith(name: 'Michael');

    expect(true, profileModel.name != newProfileModel.name);
    expect(true, profileModel.hashCode != newProfileModel.hashCode);
    expect(true, profileModel != newProfileModel);
  });
}