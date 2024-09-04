import 'dart:io';

void main(List<String> args) {
  if (args.isEmpty) {
    print('Usage: dart remove_comments.dart <file>');
    exit(1);
  }

  final file = File(args[0]);
  final content = file.readAsStringSync();

  final newContent = removeComments(content);
  file.writeAsStringSync(newContent);

  print('Comments removed from ${args[0]}');
}

String removeComments(String content) {
  final singleLineCommentPattern = RegExp(r'^\s*//.*$', multiLine: true);
  final multiLineCommentPattern = RegExp(r'/\*.*?\*/', dotAll: true);

  var result = content.replaceAll(singleLineCommentPattern, '');
  result = result.replaceAll(multiLineCommentPattern, '');

  return result;
}
