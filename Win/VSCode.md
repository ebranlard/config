

# Syntax Hilighting

in settings.json

    "editor.tokenColorCustomizations": {
      "[*Light*]": {
        "textMateRules": [
          {
            "scope": "comment", // Comment
            "settings": {
              "foreground": "#218a21"
            }
          },

To find the name and scope:
    - Open a file
    - Ctrl-Shift-P  Developer Inspect Editor Tokens and Scope
