

// Disable Autoscrolling
if (IPython.CodeCell) {
  IPython.OutputArea.prototype._should_scroll = function(lines) {
    return false;
  }
}

// Disable Automatic closing brackets
if (IPython.CodeCell) {
  IPython.CodeCell.options_default.cm_config.autoCloseBrackets = false;
}

// Display all outputs
if (IPython.CodeCell) {
  //IPython.core.interactiveshell.ast_node_interactivity = "all";
}

//alert("new hello world from custom.js")

