

## Quill Markdown

This package converts quill delta to markdown (.md) and vice versa for the package [flutter_quill](https://pub.dev/packages/flutter_quill).

    String content = '[{"insert":"Heading"},{"insert":"\\n","attributes":{"header":1}},{"insert":"bold","attributes":{"bold":true}},{"insert":"\\n"},{"insert":"bold and italic","attributes":{"bold":true,"italic":true}},{"insert":"\\nsome code"},{"insert":"\\n","attributes":{"code-block":true}},{"insert":"A quote"},{"insert":"\\n","attributes":{"blockquote":true}},{"insert":"ordered list"},{"insert":"\\n","attributes":{"list":"ordered"}},{"insert":"unordered list"},{"insert":"\\n","attributes":{"list":"bullet"}},{"insert":"link","attributes":{"link":"pub.dev/packages/quill_markdown"}},{"insert":"\\n"}]';
    content = quillToMarkdown(content);
    print(content);
    content = markdownToQuill(content);
    print(content);


## Known Limitations:

[See why](https://github.com/singerdmx/flutter-quill/issues/15#issuecomment-775349564)

 - Doesn't convert image, leaves that attribute.
 - Doesn't convert strike, leaves that attribute.
 - Doesn't convert color, leaves that attribute.
 - Doesn't convert background, leaves that attribute.
 - Doesn't convert underline, leaves that attribute.
 - Doesn't convert indent, leaves that attribute.
 - Doesn't convert checkbox, leaves that attribute.
 - Markdown to quill converter is very buggy.