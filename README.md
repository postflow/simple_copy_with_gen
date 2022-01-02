## This package contains annotations  for generate copywith method for any Dart classes
### Configure:
Add in you  pubspec.yaml to dependencies section:
```
dependencies:
  ...        
  copy_with_annotations:
  ...        
```   
and to dev_dependencies ( build_runner & copy_with_generators ):
```
dev_dependencies:
  ...
  build_runner:
  copy_with_generators:
  ...
```

### Use:
Annotate you class copywith annotation. Like this:
```dart
part 'profile_model.g.dart';
@copywith
class ProfileModel {
    String _name = 'Aachman';
    int _age = 20;
    bool _codes = true;
}
```
after in console run this command:
```
 flutter pub run build_runner build 
```
and use:
```dart
 final ProfileModel profile = ProfileModel()
  ..name = 'Sergio'
  ..age = 35
  ..codes = true;

final newProfile = profile.copyWith(name: 'Michael');
```