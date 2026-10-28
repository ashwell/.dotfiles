# To Dos

- Get some project management going
  - ticket needed
- Get a proper install process setup
  - [#2](https://github.com/ashwell/.dotfiles/issues/2)
  - [#3](https://github.com/ashwell/.dotfiles/issues/3)
  - [#14](https://github.com/ashwell/.dotfiles/issues/14)
- Reorganize and restructure
  - [#11](https://github.com/ashwell/.dotfiles/issues/11)
  - [#4](https://github.com/ashwell/.dotfiles/issues/4)
  - [#1](https://github.com/ashwell/.dotfiles/issues/1)
- Build universal prompt with oh-my-posh
  - ticket needed

## Project Management

Just github issues and projects, but some standard labels and workflows would help.

## Install Process & Restructure

### Goals

- Install and setup from one command
- Setup should be repayable piecemeal for each tool/configuration/app.
- Works for any system type
- Allows for opt-in/opt-out of anything managed by the dotfiles

### Notes

#### Restructure Ideas

- by shell?
  - pwsh
  - bash
  - zsh
  - fish
- by type
  - init
  - source
  - link
  - copy
  - merge
  - copy+merge=upsert

#### Tools List

- npm (global)
  - npm (self update)
  - [http-server](https://github.com/http-party/http-server)
  - [trash-cli](https://github.com/sindresorhus/trash-cli)
  - [npm-check-updates](https://github.com/raineorshine/npm-check-updates)
  - [np](https://github.com/sindresorhus/np)
  - [fkill-cli](https://github.com/sindresorhus/fkill-cli#readme)
  - [shellcheck](https://www.shellcheck.net/)
  - [@dotenvx/dotenvx](https://dotenvx.com/)
  - [open-cli](https://github.com/sindresorhus/open-cli)
  - [cspell](https://npmx.dev/package/cspell)
  - [@google/zx](https://github.com/google/zx)
- from OS package manager
  - All Systems
    - git
      - git-lfs
    - GitHub CLI (+desktop)
      - gh cli extensions
        - github/gh-copilot
        - github/gh-stack
        - github/gh-actions-lock
    - neovim
    - node.js
    - OBS Studio
    - pnpm
    - jq
    - bat
    - Claude / Claude Code
    - Deno
    - Docker (CLI/Compose/Desktop)
    - RescueTime
    - RipGrep
    - Slack
    - Super Productivity
    - uv (python version manager)
    - VLC
  - windows only (winget)
    - PowerToys
    - AutoHotkey
    - Fast Node Manager
    - windows terminal
  - macos only
    - homebrew
    - SetApp
