import 'package:build/src/builder/build_step.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:simple_copy_with_annotations/simple_copy_with_annotations.dart';
import 'package:source_gen/source_gen.dart';

import 'model_visitor.dart';

class SubclassGenerator extends GeneratorForAnnotation<SubclassAnnotation> {
  @override
  String generateForAnnotatedElement(Element element, ConstantReader annotation, BuildStep buildStep) {
    final visitor = ModelVisitor();
    element.visitChildren(visitor);

    final className = '${visitor.className}Gen';

    final classBuffer = StringBuffer();

    classBuffer.writeln('class $className extends ${visitor.className} {');

    classBuffer.writeln('Map<String, dynamic> variables = {};');

    classBuffer.writeln('$className() {');

    for (final field in visitor.fields.keys) {
      final variable = field.startsWith('_') ? field.replaceFirst('_', '') : field;

      classBuffer.writeln("variables['${variable}'] = super.$field;");
    }

    classBuffer.writeln('}');

    generateGettersAndSetters(visitor, classBuffer);

    classBuffer.writeln('}');

    return classBuffer.toString();
  }

  void generateGettersAndSetters(ModelVisitor visitor, StringBuffer classBuffer) {
    for (final field in visitor.fields.keys) {
      final variable = field.startsWith('_') ? field.replaceFirst('_', '') : field;

      classBuffer.writeln("${visitor.fields[field]} get $variable => variables['$variable'];");

      classBuffer.writeln('set $variable(${visitor.fields[field]} $variable) {');
      classBuffer.writeln('super.$field = $variable;');
      classBuffer.writeln("variables['$variable'] = $variable;");
      classBuffer.writeln('}');
    }
  }
}
