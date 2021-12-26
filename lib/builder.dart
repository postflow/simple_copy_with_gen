// 1
import 'package:build/build.dart';
// 2
import 'package:source_gen/source_gen.dart';

// 3
import 'src/extension_generator.dart';
import 'src/subclass_generator.dart';

// 4
Builder generateExtension(BuilderOptions options) =>
    SharedPartBuilder([ExtensionGenerator()], 'extension_generator');
Builder generateSubclass(BuilderOptions options) =>
    SharedPartBuilder([SubclassGenerator()], 'subclass_generator');
