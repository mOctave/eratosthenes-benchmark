# Styleguide

Since the goal of this repository is to contain the same benchmark code in as many programming languages as possible. This is bound to cause some difficulties in creating an overall stylguide, so I'm generally not going to bother trying.
Still, there's a few rules that should be obeyed if at all possible:

**Line Wrap**  
Lines should wrap at 80 characters if at all possible. If that's not possible, lines should wrap at 120 characters.

**Indentation**  
Languages which do not depend on specific indentation should be indented with tabs, where each tab is four spaces wide. Languages which *do* depend on specific indentation should be indented with two spaces.

**Operators**
If possible, all binary and ternary operators should be padded on each side with one space, and all unary operators should not be padded. If an expression is split across multiple lines, operators should be the first, rather than the last, item on a line.

**Trailing Whitespace**
Lines should not have any trailing whitespace. Each file should have one empty line at the end.

**Copyright Header**
Each file should be preceded by the following copyright notice on single-line comments:

```
Copyright (c) {{ year added }}  {{ first contributor to file }}

Eratosthenes Benchmark is free software: you can redistribute it and/or modify
it under the terms of the GNU Affero General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

Eratosthenes Benchmark is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Affero General Public License for more details.

You should have received a copy of the GNU Affero General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
```

If a language does not support single line comments, multi-line comments may be
used instead. If a language does not support multi-line comments, the copyright
notice may be omitted.

**Braces in C-like Languages**
If a language uses braces to distinguish sections of code, the opening brace should be on the same line as the expression that comes before it.

That is, this:
```
function someFunction() {

}
```

instead of this:
```
function someFunction()
{

}
```

**Use of Classes**
If possible, any language that is compiled before runtime should have its code defined in a class, with a class name matching that of the file. Scripting languages should not use classes.

If a language does not support classes, this can be ignored.

**Capitalization**
Wherever possible, classes should be capitalized in PascalCase, and variables in camelCase. If this is not possible, snake_case should be used instead for variables, and UPPERCASE_SNAKE_CASE for classes. UPPERCASE_SNAKE_CASE should also be used for any constants that need to be defined, with the exception of constant data structures whose contents are modified.

**Warnings**
Programs should always follow best practices for their programming languages if possible. Programs MUST NOT throw warnings or errors, as this will cause benchmarkbot to fail even if the warnings are not fatal.
