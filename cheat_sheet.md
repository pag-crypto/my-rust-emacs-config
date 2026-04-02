# Emacs Rust Config Cheat Sheet

## LSP (Eglot + rust-analyzer)

| Key | Command | Description |
|-----|---------|-------------|
| `M-.` | `xref-find-definitions` | Jump to definition |
| `M-,` | `xref-go-back` | Return from definition |
| `M-?` | `xref-find-references` | Find all references |
| `C-c C-r` | `eglot-rename` | Rename symbol project-wide |
| `C-c C-a` | `eglot-code-actions` | Show code actions (fixes, refactors) |
| `C-c C-d` | `eldoc` | Show documentation at point |
| `M-x eglot-format` | | Format buffer |
| `M-x eglot-code-action-organize-imports` | | Organize imports |
| `M-x flymake-show-buffer-diagnostics` | | Show all errors/warnings |
| `M-n` / `M-p` | `flymake-goto-next/prev-error` | Navigate errors |

**Tip:** Inlay hints are enabled - you'll see type annotations inline. rust-analyzer runs `clippy` on save for lints.

## Completion (Corfu)

Corfu auto-completes after typing 2 characters (0.2s delay).

| Key | Description |
|-----|-------------|
| `TAB` | Select next candidate |
| `S-TAB` | Select previous candidate |
| `RET` | Confirm selection |
| `C-g` | Cancel completion |
| `M-d` | Show documentation popup |

**Tip:** Completion cycles through candidates. Keep typing to narrow results.

## Minibuffer (Vertico + Marginalia + Orderless)

| Key | Description |
|-----|-------------|
| `C-n` / `C-p` | Navigate candidates |
| `RET` | Select candidate |
| `TAB` | Complete to common prefix |
| `C-g` | Cancel |

**Tip:** Type space-separated words in any order for fuzzy matching (orderless). E.g., `str vec` matches `StringVec`, `VecString`, etc.

## Search & Navigation (Consult)

| Key | Command | Description |
|-----|---------|-------------|
| `C-s` | `consult-line` | Search in current buffer |
| `C-c s` | `consult-ripgrep` | Search across project (requires ripgrep) |
| `M-g g` | `consult-goto-line` | Jump to line number |
| `M-x consult-buffer` | | Switch buffer with preview |
| `M-x consult-imenu` | | Jump to function/impl in buffer |
| `M-x consult-outline` | | Jump to heading |

**Tip:** In consult-ripgrep, use `#pattern` to search, then narrow with additional terms.

## Structural Editing (Smartparens)

Active in rust-ts-mode. Auto-pairs `()`, `[]`, `{}`, `""`, `''`.

| Key | Command | Description |
|-----|---------|-------------|
| `C-M-f` | `sp-forward-sexp` | Jump forward over sexp |
| `C-M-b` | `sp-backward-sexp` | Jump backward over sexp |
| `C-M-k` | `sp-kill-sexp` | Kill sexp forward |
| `C-M-u` | `sp-up-sexp` | Move up/out of sexp |
| `C-M-d` | `sp-down-sexp` | Move down/into sexp |

## Snippets (YASnippet)

| Key | Description |
|-----|-------------|
| `TAB` | Expand snippet / jump to next field |
| `S-TAB` | Jump to previous field |
| `C-c & C-n` | Create new snippet |
| `M-x yas-describe-tables` | List available snippets |

Common Rust snippets (from yasnippet-snippets): `fn`, `impl`, `struct`, `enum`, `match`, `if`, `for`, `while`, `test`, `mod`, etc.

## Git (Magit)

| Key | Command | Description |
|-----|---------|-------------|
| `C-x g` | `magit-status` | Open Magit status buffer |
| `s` | | Stage file/hunk |
| `u` | | Unstage |
| `c c` | | Commit |
| `P p` | | Push |
| `F p` | | Pull |
| `b b` | | Switch branch |
| `l l` | | View log |
| `d d` | | Diff |
| `?` | | Show all commands |

## Cargo Commands

| Command | Description |
|---------|-------------|
| `M-x cargo-process-build` | `cargo build` |
| `M-x cargo-process-run` | `cargo run` |
| `M-x cargo-process-test` | `cargo test` |
| `M-x cargo-process-clippy` | `cargo clippy` |
| `M-x cargo-process-fmt` | `cargo fmt` |
| `M-x rust-playground` | Open scratch Rust buffer |

## LLM / Claude Integration (gptel)

| Key / Command | Description |
|---------------|-------------|
| `M-x gptel` | Open a chat buffer with Claude |
| `M-x gptel-send` | Send region/buffer to Claude (use `C-u` prefix for options) |
| `M-x gptel-menu` | Transient menu for all gptel options |
| `C-c RET` | Send message (in gptel buffer) |

**In chat buffer:**
- Type your message, then `C-c RET` to send
- Response streams in real-time
- Use `C-u M-x gptel-send` in code buffers to select what to send

**Setup:** Add your API key to `~/.authinfo`:
```
machine api.anthropic.com login apikey password sk-ant-YOUR-KEY
```

## Keybinding Discovery (which-key)

After pressing any prefix key (like `C-x` or `C-c`), wait briefly and a popup shows all available continuations.

| Key | Description |
|-----|-------------|
| `C-h` | In the popup, show more help for a key |
| `n` / `p` | Next/previous page of bindings |

**Tip:** Press `C-x` and wait - you'll see all `C-x ...` commands. Great for learning.

## Context Actions (Embark)

Embark lets you act on the "target" at point (symbol, file, URL, etc.).

| Key | Command | Description |
|-----|---------|-------------|
| `C-.` | `embark-act` | Show actions for thing at point |
| `C-;` | `embark-dwim` | Do the default action immediately |

**Common uses:**
- On a symbol: find definition, references, rename, grep for it
- On a file in minibuffer: open, delete, copy, rename, open in other window
- On a URL: browse, download, eww
- In consult-ripgrep results: export to buffer for editing

**Tip:** `C-.` then `E` exports search results to a buffer you can edit (then save changes back).

## Debugging (dape)

Debug Adapter Protocol support. Works with `codelldb` for Rust.

| Command | Description |
|---------|-------------|
| `M-x dape` | Start debugging session |
| `M-x dape-breakpoint-toggle` | Toggle breakpoint at point |
| `M-x dape-breakpoint-remove-all` | Clear all breakpoints |

**In debug session:**

| Key | Description |
|-----|-------------|
| `n` | Step over (next) |
| `i` | Step into |
| `o` | Step out |
| `c` | Continue |
| `r` | Restart |
| `q` | Quit session |

**Setup for Rust:** Install codelldb:
```bash
# Download from https://github.com/vadimcn/codelldb/releases
# Or via VSCode: ext install vadimcn.vscode-lldb
```

When prompted by dape, use config like:
```
codelldb-rust :program "/path/to/target/debug/your_binary"
```

## Git Gutter (diff-hl)

Shows uncommitted changes in the left fringe. Enabled automatically in code buffers.

| Indicator | Meaning |
|-----------|---------|
| Green bar | Added lines |
| Orange bar | Modified lines |
| Red triangle | Deleted lines |

| Command | Description |
|---------|-------------|
| `M-x diff-hl-diff-goto-hunk` | Show diff for hunk at point |
| `M-x diff-hl-revert-hunk` | Revert hunk at point |
| `M-x diff-hl-next-hunk` | Jump to next change |
| `M-x diff-hl-previous-hunk` | Jump to previous change |

## Extra Completions (cape)

Cape adds additional completion sources to corfu:

- **File paths** - Type `~/` or `./` to complete file paths
- **Dabbrev** - Words from other buffers

These integrate automatically with corfu's popup.

## Tree-sitter (treesit-auto)

Automatically installs and uses tree-sitter grammars for syntax highlighting and code navigation.

**Tip:** If a grammar fails to install automatically, run:
```elisp
M-x treesit-install-language-grammar RET rust RET
```

## General Tips

1. **Use `M-x` liberally** - Vertico makes command discovery easy. Start typing what you want. which-key will show completions as you type prefixes.

2. **Project awareness** - Open a file in your Rust project, then `C-c s` searches the whole project.

3. **Documentation** - Hover or `C-c C-d` to see rust-analyzer docs. Corfu shows signature help automatically.

4. **Quick fixes** - When you see a squiggly underline, `C-c C-a` often has auto-fixes.

5. **Restart LSP** - If things get weird: `M-x eglot-shutdown` then `M-x eglot`.

6. **Ask Claude** - Select confusing code and `M-x gptel-send` to ask Claude to explain it.

7. **Act on anything** - `C-.` (embark-act) works almost everywhere: on symbols, files, buffers, search results.

8. **Export and edit** - In consult-ripgrep, press `C-.` then `E` to export results to an editable buffer.
