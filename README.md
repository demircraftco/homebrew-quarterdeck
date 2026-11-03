# Quarterdeck

<p align="center"><img src="media/icon.png" width="140" alt="Quarterdeck icon: a pixel helm"> &nbsp; <img src="media/captain.png" width="140" alt="The author as a pixel-art pirate captain"></p>

**Ahoooy, captain!** 🏴‍☠️

On a ship, the quarterdeck is where the captain stands: you see the whole deck from there
and step in only where you're needed. This app is that spot for your Claude Code sessions.

Run up to six sessions side by side in one window. Each pane's border tells you how its
session is doing, so you stop clicking through tabs to find the one that needs you.

<!-- Screenshots of the current interface go here. -->

## Why

I built it for the days when I'm not writing code myself but running several agents at once.
With one session that's easy. With four, I kept rotating through terminal tabs and editor
windows asking "is this one waiting for me?", and every rotation cost a bit of attention.
Quarterdeck answers that question with a color, so I switch context only when a session
actually needs me.

## Requirements

- A Mac with Apple Silicon, macOS 13 or later (talking to the chief needs macOS 26)
- [Claude Code](https://docs.anthropic.com/en/docs/claude-code), installed and signed in. Quarterdeck does not install it
  and needs no account of its own.

## Install

```bash
brew install --cask demircraftco/quarterdeck/quarterdeck
```

The app is signed with an Apple Developer ID and notarized by Apple. To update:

```bash
brew upgrade --cask quarterdeck
```

Quit and reopen the app to load the new version.

## First run

You get one empty pane, a terminal in `~/Quarterdeck`. Type `claude` and press Enter. To use another folder, click the
helm in the top-right corner (or press **⌘,**). A change affects new panes only.

## What it does

- **Live panes.** Up to six real terminals in one window, each running your own shell. Start `claude` in any of them.
- **State as color.** Each pane's border shows the session inside: running, waiting for input, needs permission, idle,
  done. Unknown stays unknown rather than being guessed.
- **Context weight.** The pane title shows where the session's context goes, so you can tell which kind of compaction
  helps.
- **Panes come back.** Quit and reopen: the panes return in order and Claude panes resume their session.
- **Bridge.** **⌘.** opens a Claude session of its own, the chief, with your panes as cards around it. Choose which panes
  it manages. It types to a pane only when that pane is idle; a message to a busy pane or one asking a permission waits up
  to 10 minutes, then is dropped and logged.
- **Questions as forms.** The chief's questions open as Kage-e forms over the Bridge, in the app's language.
- **Talk to the chief.** On macOS 26, press the parrot and talk. Nothing is sent until you press Send.
- **Priority marks, a note drawer, drag to rearrange.** **⌘1–4** mark a pane, **⌘J** opens a note with its own session,
  and a pane moves by its title bar.
- **English or Turkish.** The first launch follows your system; change it in settings or View → Language.

## Privacy

- **No telemetry.** There is no analytics or usage reporting in the app.
- **One request of its own.** Quarterdeck asks GitHub for the latest release's version, link and notes. GitHub sees a plain
  web request. **Update** runs `brew upgrade --cask quarterdeck`, and only when you click it.
- **Microphone.** Used only while you talk to the chief, after macOS asks your permission. Apple's on-device dictation turns
  speech into text (macOS may download its speech model first), and the audio is not saved.
- **Your sessions.** State comes from `~/.claude/sessions/<pid>.json`, and the context weight from the session's transcript,
  both read on your Mac. The visible terminal screen is read in one place: a menu on it holds the chief's messages. Only
  that yes or no is kept.
- **What Claude Code sees.** Claude Code talks to Anthropic as usual. The chief is a Claude session too: the panes you give
  it, with their last messages, are written to `~/.quarterdeck/kosk/durum.json` for it to read.

## Uninstall

```bash
brew uninstall --cask quarterdeck
```

This removes the app and keeps your settings. To remove `~/.quarterdeck` and the app's support folder too:

```bash
brew uninstall --zap --cask quarterdeck
```

Your work in `~/Quarterdeck` is never removed.

## License

Free to use. Quarterdeck is closed source; all rights reserved. See [`LICENSE`](LICENSE).
