# Redmine PDF Documents

## Introduction

This plugin creates pdf documents containing selected wiki pages.

Redmine 2.x branch includes full rendering of macros, both in multiple-page documents and in wiki PDF exports.
Supports wiki_external_filter (except for svg outputs) and all other plugins whose implemented macros generate html.

## Compatibility

Tested on Redmine 2.3.
Should work on Redmine 2.0+.
Needs wkhtmltopdf 0.11.0 rc1 installed (wkhtmltopdf-binary gem is too old)

## License

This script is published under the GPLv2 licence.

## Credits

I am using code and ideas from the following people:

* Code to create PDF from wiki pages: http://www.redmine.org/issues/401
* Idea and portions of code from: http://www.redmine.org/plugins/redmine_doc_pu

## Screenshots

Listview showing all created documents.

[![Screenshot 01][screenshot_01_thumb]][screenshot_01_full]

Create a new document.

[![Screenshot 02][screenshot_02_thumb]][screenshot_02_full]

Edit a document.

[![Screenshot 03][screenshot_03_thumb]][screenshot_03_full]

Add a wiki page to an document.

[![Screenshot 04][screenshot_04_thumb]][screenshot_04_full]

A document with selected wiki pages.

[![Screenshot 05][screenshot_05_thumb]][screenshot_05_full]

[screenshot_01_thumb]: https://raw.github.com/klausmeyer/redmine_pdf_documents/master/_screenshots/thumbs/01_overview.png
[screenshot_02_thumb]: https://raw.github.com/klausmeyer/redmine_pdf_documents/master/_screenshots/thumbs/02_new_document.png
[screenshot_03_thumb]: https://raw.github.com/klausmeyer/redmine_pdf_documents/master/_screenshots/thumbs/03_edit_document.png
[screenshot_04_thumb]: https://raw.github.com/klausmeyer/redmine_pdf_documents/master/_screenshots/thumbs/04_add_wiki_page.png
[screenshot_05_thumb]: https://raw.github.com/klausmeyer/redmine_pdf_documents/master/_screenshots/thumbs/05_document_wiki_pages.png

[screenshot_01_full]: https://raw.github.com/klausmeyer/redmine_pdf_documents/master/_screenshots/full/01_overview.png
[screenshot_02_full]: https://raw.github.com/klausmeyer/redmine_pdf_documents/master/_screenshots/full/02_new_document.png
[screenshot_03_full]: https://raw.github.com/klausmeyer/redmine_pdf_documents/master/_screenshots/full/03_edit_document.png
[screenshot_04_full]: https://raw.github.com/klausmeyer/redmine_pdf_documents/master/_screenshots/full/04_add_wiki_page.png
[screenshot_05_full]: https://raw.github.com/klausmeyer/redmine_pdf_documents/master/_screenshots/full/05_document_wiki_pages.png
