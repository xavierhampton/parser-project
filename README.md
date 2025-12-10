# Python Parser Project

A parser for a subset of Python 3.x implemented using ANTLR4. The parser generates a parse tree from Python source code and exports it as a PNG visualization.

## Team Members

- Xavier Hampton

## Features

The parser supports the following Python language features:

**Deliverable 1 - Arithmetic & Assignment**
- Arithmetic operators: `+`, `-`, `*`, `/`, `%`
- Assignment operators: `=`, `+=`, `-=`, `*=`, `/=`
- Literals: integers, floats, strings, booleans
- Arrays/lists

**Deliverable 2 - Conditionals**
- `if`/`elif`/`else` blocks
- Comparison operators: `<`, `<=`, `>`, `>=`, `==`, `!=`
- Logical operators: `and`, `or`, `not`

**Deliverable 3 - Loops & More**
- `while` loops
- `for` loops (with `in` and `range()`)
- Nested control structures
- Single-line comments (`#`)
- Multi-line comments (`'''...'''`)

## Requirements

- Python 3.x
- Java Runtime Environment (for ANTLR tool)
- ANTLR4 (4.13.0 or later), added to PATH
- Graphviz (system installation on PATH required for PNG export)

### Python Dependencies

```
antlr4-python3-runtime
graphviz
```

## Setup

1. Clone the repository:
   ```bash
   git clone git@github.com:xavierhampton/parser-project.git 
   cd parser-project
   ```

2. Install Python dependencies:
   ```bash
   pip install requirements.txt
   ```

3. Generate the lexer and parser from the grammar (requires Java):
   ```bash
   antlr4 -Dlanguage=Python3 simple_py.g4
   ```

## Usage

1. Edit `main.py` to specify the target file you want to parse:
   ```python
   target_file = "your_file.py"
   ```

2. Run the parser:
   ```bash
   python main.py
   ```

3. Output:
   - The parse tree is printed to the console in parenthesized form
   - A PNG visualization is exported as `parse_tree.png`

### Example

```bash
python main.py
```

Output:
```
(start (block (statement (simple_statement var1 = (expression ...) ...
Parse tree exported as 'parse_tree.png'
```

## Project Structure

```
parser-project/
├── simple_py.g4              # ANTLR grammar file
├── main.py                   # Main parser script
├── simple_pyLexer.py         # Generated lexer
├── simple_pyParser.py        # Generated parser
├── project_deliverable_1.py  # Test file for deliverable 1
├── project_deliverable_2.py  # Test file for deliverable 2
├── project_deliverable_3.py  # Test file for deliverable 3
└── README.md
```

## Demo

[Link to demo video]
