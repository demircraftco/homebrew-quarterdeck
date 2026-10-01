# Quarterdeck

A productivity tool for running Claude Code sessions side by side — without keeping an editor
open. When you are not writing code yourself, the work is supervising several agents: who is
thinking, who is waiting for your answer, who is finished. Quarterdeck turns that into one
window and a color per session.

<!-- Demo GIF goes here: ![Quarterdeck](media/demo.gif) -->

## Why

Working with Claude Code is an operation, and you are its operator. With one session that is
easy. With four, you rotate through terminal tabs and editor windows asking "is this one
waiting for me?", and every rotation costs attention. Quarterdeck keeps the sessions in one
grid and answers that question with a color, so you switch context only when a session needs
you.

## Install

```bash
brew install --cask demircraftco/quarterdeck/quarterdeck
```

macOS on Apple Silicon. The app is signed with an Apple Developer ID.

**0.1.0 is waiting for Apple's notarization.** Until it lands, macOS may stop the first
launch: open **System Settings → Privacy & Security** and click **Open Anyway** once.

## First run

Quarterdeck creates `~/Quarterdeck` and opens new panes there. To use another folder, click
the helm in the top-right corner (or press **⌘,**) and choose one. Changing it affects new
panes only; open panes stay where they are.

## What it does

- **Live panes.** Up to six real terminals in one window, each running your own shell.
  Start `claude` in any of them.
- **State as color.** Each pane's border shows the session inside: running, waiting for
  input, needs permission, idle, done — or unknown, which stays unknown rather than being
  guessed.
- **Context weight.** The pane title shows where the session's context goes: the fixed base,
  tool results, and the conversation itself, so you can tell which kind of compaction helps.
- **Priority marks.** **⌘1–4** mark the focused pane as *now*, *plan*, *delegate* or *drop*.
- **Quick note.** **⌘J** opens a note drawer running its own Claude session in
  `~/.quarterdeck/not`; it does not take a pane slot.
- **Drag to rearrange.** Grab a pane by its title bar. The terminal body belongs to the
  terminal.
- **Open in VS Code.** The `</>` button in a pane's title bar opens that pane's folder in VS Code:
  the folder of the Claude session last seen in it, otherwise the folder the shell started in.
- **Panes survive their shell.** When a shell exits the pane stays and can be restarted in place.
- **English or Turkish.** In settings or View → Language.

### How it knows the state

From `~/.claude/sessions/<pid>.json`, matched to the pane's shell by walking the process tree.
Nothing parses the terminal output, so a redesign of Claude Code's interface cannot break it.

## Requirements

- macOS on Apple Silicon
- [Claude Code](https://docs.anthropic.com/en/docs/claude-code) installed and on your `PATH`

## What's next

Two parts run today on the author's machine and are being generalized for everyone:

- **Captain's Deck** — a daily board inside Quarterdeck: your tasks, their state, and a
  button that resumes the right session in a pane.
- **Work surfaces** — tools that report on your working records (open worktrees, notes,
  what is ready to archive) get a region on the board.

<!-- Captain's Deck screenshot goes here: ![Captain's Deck](media/kosk.png) -->

## License

Free to use. Quarterdeck is closed source; all rights reserved — see [`LICENSE`](LICENSE).
