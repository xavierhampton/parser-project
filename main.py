from antlr4 import *
from antlr4.tree.Tree import TerminalNode
from simple_pyLexer import simple_pyLexer
from simple_pyParser import simple_pyParser
from graphviz import Digraph

def parse_file(file_path, output_png="parse_tree.png"):
    # Read the input file
    with open(file_path, 'r') as file:
        input_data = file.read()

    input_stream = InputStream(input_data)
    lexer = simple_pyLexer(input_stream)
    stream = CommonTokenStream(lexer)
    parser = simple_pyParser(stream)

    # Parse the file
    tree = parser.start()

    # Optional: print parenthesized tree
    print(tree.toStringTree(recog=parser))

    # Create Graphviz Digraph
    dot = Digraph(comment="Parse Tree", format="png")

    node_id = 0

    def add_node(t, parent_id=None):
        nonlocal node_id
        current_id = str(node_id)
        node_id += 1

        # Label terminals with text, non-terminals with class name
        if isinstance(t, TerminalNode):
            label = t.getText().replace('"', '\\"')
        else:
            label = t.__class__.__name__.replace("Context", "")

        dot.node(current_id, label)

        if parent_id is not None:
            dot.edge(parent_id, current_id)

        if not isinstance(t, TerminalNode):
            for child in t.getChildren():
                add_node(child, current_id)

    add_node(tree)

    # Render the PNG directly using graphviz Python package
    dot.render(output_png, cleanup=True)
    print(f"Parse tree exported as '{output_png}'")

if __name__ == "__main__":
    target_file = "project_deliverable_1.py"  # replace with your file
    parse_file(target_file, output_png="parse_tree.png")
