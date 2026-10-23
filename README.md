# Hybrasyl - Ceridwen World Data

[![Project website](https://img.shields.io/badge/-Project%20Website-blue?style=plastic)](http://hybrasyl.com/) 
[![Bug Tracker](https://img.shields.io/badge/-Bug%20Tracker-blue?style=plastic)](https://github.com/eriscorp/cernunnos/issues) 
[![Server](https://img.shields.io/badge/-Server-blue?style=plastic)](https://github.com/hybrasyl/server)
[![Public World Data](https://img.shields.io/badge/-Public%20World%20Data-blue?style=plastic)](https://github.com/hybrasyl/ceridwen/)
[![Road Map](https://img.shields.io/badge/-Road%20Map-blue?style=plastic)](https://hybrasyl.com/project)

## **Welcome to Ceridwen!**

Ceridwen will provide you with some basic world data to get your server up and running, as well as examples, templates and documentation for creating your own Hybrasyl server.

This repository is intended for those with some experience with lua and xml.  Hybrasyl has both an api and a schema:

[Scripting API](https://docs.hybrasyl.com/)  
[XML Schema](https://github.com/hybrasyl/xml)

For an overview of how to set up Hybrasyl for use, please visit the [server project](https://github.com/hybrasyl/server).

## Tools

Use these tools to create and manage an independent server:

- [Creidhne](https://github.com/hybrasyl/creidhne) - edit world data (maps, items, NPCs, and the other XML in this repository).
- [Taliesin](https://github.com/hybrasyl/taliesin) - manage and author client asset packs (`.datf`).
- [Epona](https://github.com/eriscorp/epona) - launch and manage clients and servers.

## Contributing

We welcome contributions to the project! We encourage new developers to visit us on Discord and get to know us first, especially if you plan on tackling a substantial feature or change.

If you would like to contribute content to the Ceridwen database, feel free to fork and submit a pull request.

File format rules:

- Use LF line endings in all text files. `.gitattributes` and `.editorconfig` set LF.
- Do not hard-wrap Markdown prose at a column. Write each paragraph or list item as one line.

## Tests

Run the tests from the repository root with any Lua 5.3 or later interpreter. They have no dependencies:

```sh
lua tests/run.lua
```

CI runs the tests for each push and pull request to `main`. The `formula_tokens` spec fails on each formula token in `xml/` that the server does not define, because the server evaluates such a formula to 0. `tests/formula_tokens.lua` holds the token list, copied from the server source. That file names the server commit. Update the list when the server adds or renames a `[FormulaVariable]` property.

