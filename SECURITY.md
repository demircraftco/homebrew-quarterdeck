# Security policy

Quarterdeck runs your terminals, so a security hole in it matters. Thank you for taking the time to report one.

## Supported versions

Only the latest release gets security fixes. Upgrade with:

```bash
brew upgrade --cask quarterdeck
```

The app also offers a new version in its top bar.

## Reporting a vulnerability

**Please do not open a public issue for a security problem.** Report it privately through GitHub instead:

1. Open the **Security** tab of this repository.
2. Choose **Report a vulnerability**
   ([direct link](https://github.com/demircraftco/homebrew-quarterdeck/security/advisories/new)).

Only the maintainer sees the report. Please include:

- the Quarterdeck version (*Quarterdeck → About Quarterdeck*) and your macOS version,
- what an attacker could do, and what they need for it (a crafted file, a link, a running process, ...),
- steps to reproduce, and a proof of concept if you have one.

## What happens next

- You get a reply within **1 week** saying the report has arrived.
- We check whether the release is affected and tell you what we found.
- A confirmed critical or high issue is fixed in a new release first, before any other work.
- When the fix is out, we publish the advisory and name you in the release notes, unless you would rather not be
  named. Please keep the details private until then.

## Scope

In scope: the Quarterdeck app as installed by this cask, and the cask itself.

Out of scope here:

- **Claude Code** itself: please report to Anthropic.
- **Electron or Chromium** themselves: please report to the Electron project. If Quarterdeck ships an Electron version
  with a known hole, that *is* in scope here.
