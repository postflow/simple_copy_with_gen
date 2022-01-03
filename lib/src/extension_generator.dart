import 'package:build/src/builder/build_step.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:simple_copy_with_annotations/copy_with_annotations.dart';

import 'package:source_gen/source_gen.dart';

import 'model_visitor.dart';

class ExtensionGenerator extends GeneratorForAnnotation<ExtensionAnnotation> {
  @override
  String generateForAnnotatedElement(Element element, ConstantReader annotation, BuildStep buildStep) {
    final visitor = ModelVisitor();
    element.visitChildren(visitor);
    final classBuffer = StringBuffer();
    classBuffer.writeln('extension GeneratedModel on ${visitor.className} {');
    classBuffer.writeln('Map<String, dynamic> get variables => {');

    for (final field in visitor.fields.keys) {
      final variable = field.startsWith('_') ? field.replaceFirst('_', '') : field;

      classBuffer.writeln("'$variable': $field,");
    }

    classBuffer.writeln('};');

    generateGettersAndSetters(visitor, classBuffer);

    classBuffer.writeln('${visitor.className} copyWith({');

    for (final field in visitor.fields.keys) {
      final variable = field.startsWith('_') ? field.replaceFirst('_', '') : field;

      classBuffer.writeln("${visitor.fields[field]}?  $variable ,");
    }
    classBuffer.writeln('})');
    classBuffer.writeln('=> ${visitor.className}()');

    for (final field in visitor.fields.keys) {
      final variable = field.startsWith('_') ? field.replaceFirst('_', '') : field;

      classBuffer.writeln("..$field = $variable ?? this.$field");
    }
    classBuffer.writeln(';');
    classBuffer.writeln('}');

    return classBuffer.toString();
  }

  void generateGettersAndSetters(ModelVisitor visitor, StringBuffer classBuffer) {
    for (final field in visitor.fields.keys) {
      final variable = field.startsWith('_') ? field.replaceFirst('_', '') : field;

      classBuffer.writeln("${visitor.fields[field]} get $variable => variables['$variable'];");

      classBuffer.writeln('set $variable(${visitor.fields[field]} $variable)');
      classBuffer.writeln('=> $field = $variable;');
    }
  }
}
