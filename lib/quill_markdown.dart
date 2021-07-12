library quill_to_markdown;

import 'dart:convert';
import 'package:quill_markdown/notus/convert.dart';
import 'notus/notus.dart';

String? quillToMarkdown(String content) {
  try {
    return notusMarkdown.encode(NotusDocument.fromJson(jsonDecode(content
        .replaceAll('"header":1', '"heading":1')
        .replaceAll('"header":2', '"heading":2')
        .replaceAll('"header":3', '"heading":3')
        .replaceAll('"bold":true', '"b":true')
        .replaceAll('"italic":true', '"i":true')
        .replaceAll('"blockquote":"true"', '"block":"quote"')
        .replaceAll('"blockquote":"quote"', '"block":"quote"')
        .replaceAll('"code-block":true', '"block":"code"')
        .replaceAllMapped(RegExp(r',"attributes":{(.*?)"link":"(.+?)"(.*?)}'),
            (Match m) => ',"attributes":{${m[1]}"a":"${m[2]}"${m[3]}}')
        .replaceAll('{"insert":"​","attributes":{"embed":{"type":"hr"}}},', '')
        .replaceAll('{"insert":"​","attributes":{"embed":{"type":"hr"}}}', '')
        .replaceAll('"underline":true,', '')
        .replaceAll('"underline":true', '')
        .replaceAll('"strike":true,', '')
        .replaceAll('"strike":true', '')
        .replaceAll('"list":"ordered"', '"block":"ol"')
        .replaceAll('"list":"bullet"', '"block":"ul"')
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
              r'"indent":[A-Za-z0-9]{0,100},',
            ),
            (match) => '')
        .replaceAllMapped(
            RegExp(
              r'"indent":[A-Za-z0-9]{0,100}',
            ),
            (match) => '')
        .replaceAllMapped(
            RegExp(
              r'"list":"[A-Za-z0-9]{0,100}"',
            ),
            (match) => '"block":"ul"')
        .replaceAllMapped(
            RegExp(
              r'"color":"#[A-Fa-f0-9]{6}",',
            ),
            (match) => '')
        .replaceAllMapped(
            RegExp(
              r'"color":"#[A-Fa-f0-9]{6}"',
            ),
            (match) => '')
        .replaceAllMapped(
            RegExp(
              r'"background":"#[A-Fa-f0-9]{6}",',
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

String? markdownToQuill(String? content) {
  try {
    return jsonEncode(notusMarkdown.decode(content))
        .toString()
        .replaceAll('"heading":1', '"header":1')
        .replaceAll('"heading":2', '"header":2')
        .replaceAll('"heading":3', '"header":3')
        .replaceAll('"b":true', '"bold":true')
        .replaceAll('"i":true', '"italic":true')
        .replaceAll('"block":"quote"', '"blockquote":"true"')
        .replaceAll('"block":"ul"', '"list":"bullet"')
        .replaceAll('"block":"ol"', '"list":"ordered"')
        .replaceAll('"block":"code"', '"code-block":true')
        .replaceAllMapped(RegExp(r',"attributes":{(.*?)"a":"(.+?)"(.*?)}'),
            (Match m) => ',"attributes":{${m[1]}"link":"${m[2]}"${m[3]}}')
        .replaceAll('{"insert":"​","attributes":{"embed":{"type":"hr"}}},', '')
        .replaceAll('{"insert":"​","attributes":{"embed":{"type":"hr"}}}', '');
  } catch (error) {
    print(error);
    return null;
  }
}
