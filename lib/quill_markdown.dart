library quill_to_markdown;

import 'dart:convert';
import 'package:quill_markdown/notus/convert.dart';
import 'notus/notus.dart';

String quillToMarkdown(String content) {
  try {
    return notusMarkdown.encode(NotusDocument.fromJson(jsonDecode(content
        .replaceAll('"header":1', '"heading":1')
        .replaceAll('"bold":true', '"b":true')
        .replaceAll('"italic":true', '"i":true')
        .replaceAll('"blockquote":true', '"block":"quote"')
        .replaceAll('"blockquote":"quote"', '"block":"quote"')
        .replaceAll('"code-block":true', '"block":"code"')
        .replaceAll(',"attributes":{"link":"', ',"attributes":{"a":"')
        .replaceAll('{"insert":"​","attributes":{"embed":{"type":"hr"}}},', '')
        .replaceAll('"underline":true', '')
        .replaceAll('"strike":true', '')
        .replaceAllMapped(
            RegExp(
              r'{"insert":{"image":"[A-Za-z0-9:.,?\/\\!@_]{0,100}"}},',
            ),
            (match) => '')
        .replaceAllMapped(
            RegExp(
              r'{"insert":{"image":"[A-Za-z0-9:.,?\/\\!@_]{0,100}"}}',
            ),
            (match) => '')
        .replaceAllMapped(
            RegExp(
              r'"indent":[A-Za-z0-9]{0,100}',
            ),
            (match) => '')
        .replaceAll('"list":"ordered"', '"block":"ol"')
        .replaceAll('"list":"unordered"', '"block":"ul"')
        .replaceAllMapped(
            RegExp(
              r'"list":"[A-Za-z0-9]{0,100}"',
            ),
            (match) => '"block":"ul"')
        .replaceAllMapped(
            RegExp(
              r'"color":"#[A-Fa-f0-9]{6}"',
            ),
            (match) => '')
        .replaceAllMapped(
            RegExp(
              r'"background":"#[A-Fa-f0-9]{6}"',
            ),
            (match) => ''))).toDelta());
  } catch (error) {
    print(error);
    return null;
  }
}

String markdownToQuill(String content) {
  try {
    return jsonEncode(notusMarkdown.decode(content)).toString();
  } catch (error) {
    print(error);
    return null;
  }
}
