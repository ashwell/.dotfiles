#!/usr/bin/env bash
#
# ~/.claude/statusline-command.sh
#
# Claude Code statusLine command, derived from ~/.dotfiles/source/.bash_prompt PS1:
#   \n${PRMT_TIME} - \[\033[01;32m\]\u@\h\[\033[00m\]
#   \n$(__git_ps1 "[%s]\u2794 ")\[\033[01;34m\]\w\[\033[00m\]
#

input=$(cat)
cwd=$(echo "$input" | jq -r '.workspace.current_dir')
model_id=$(echo "$input" | jq -r '.model.id // empty')
context_pct=$(echo "$input" | jq -r '.context_window.used_percentage // empty')

# Time & date (mirrors set_time_date: date "+%A %B %d at %R")
time_date=$(date "+%A %B %d at %R")

# user@host in green
user_host="$(whoami)@$(hostname -s)"

# ---------------------------------------------------------------------------
# Claude model label
# ---------------------------------------------------------------------------
model_label=""
if [ -n "$model_id" ]; then
  case "$model_id" in
    *sonnet*) model_color="\033[01;36m"; model_short="Sonnet" ;;  # bold cyan
    *opus*)   model_color="\033[01;35m"; model_short="Opus"   ;;  # bold magenta
    *haiku*)  model_color="\033[01;33m"; model_short="Haiku"  ;;  # bold yellow
    *)        model_color="\033[01;37m"; model_short="$model_id" ;;  # bold white
  esac
  model_label="${model_color}[${model_short}]\033[00m"
fi

# ---------------------------------------------------------------------------
# Context usage progress bar
# ---------------------------------------------------------------------------
context_bar=""
if [ -n "$context_pct" ]; then
  pct="$context_pct"
  # Choose color based on usage percentage
  if [ "$pct" -ge 90 ] 2>/dev/null; then
    bar_color="\033[01;31m"   # bold red
  elif [ "$pct" -ge 51 ] 2>/dev/null; then
    bar_color="\033[01;33m"   # bold yellow
  else
    bar_color="\033[01;32m"   # bold green
  fi
  # Build a 16-cell bar
  filled=$(( pct * 16 / 100 ))
  empty=$(( 16 - filled ))
  bar=""
  for i in $(seq 1 "$filled"); do bar="${bar}█"; done
  for i in $(seq 1 "$empty");  do bar="${bar}░"; done
  context_bar=" ${bar_color}${bar} ${pct}%\033[00m"
fi

# ---------------------------------------------------------------------------
# Git info: branch + dirty state indicators, mirroring __git_ps1 with GIT_PS1_SHOW* options
# ---------------------------------------------------------------------------
git_info=""
if cd "$cwd" 2>/dev/null && git rev-parse --is-inside-work-tree --no-optional-locks &>/dev/null; then
  branch=$(git symbolic-ref --short HEAD 2>/dev/null || git rev-parse --short HEAD 2>/dev/null)
  suffix=""
  # Dirty working tree (*)
  git diff --quiet 2>/dev/null || suffix="${suffix}*"
  # Staged changes (+)
  git diff --cached --quiet 2>/dev/null || suffix="${suffix}+"
  # Stash ($)
  git rev-parse --verify --quiet refs/stash &>/dev/null && suffix="${suffix}\$"
  # Untracked (%)
  [ -n "$(git ls-files --others --exclude-standard 2>/dev/null)" ] && suffix="${suffix}%"
  # Upstream divergence (mirrors GIT_PS1_SHOWUPSTREAM=verbose)
  upstream=$(git rev-list --left-right --count HEAD...@{upstream} 2>/dev/null)
  if [ -n "$upstream" ]; then
    ahead=$(echo "$upstream" | awk '{print $1}')
    behind=$(echo "$upstream" | awk '{print $2}')
    [ "$ahead" -gt 0 ] && suffix="${suffix} u+${ahead}"
    [ "$behind" -gt 0 ] && suffix="${suffix} u-${behind}"
  fi

  # Open PR number + OSC 8 hyperlink (gh must be available; skip silently if not)
  pr_link=""
  ESC=$'\033'
  if command -v gh &>/dev/null; then
    pr_json=$(gh pr view --json number,url,state 2>/dev/null)
    if [ -n "$pr_json" ]; then
      pr_number=$(echo "$pr_json" | jq -r '.number')
      pr_url=$(echo "$pr_json" | jq -r '.url')
      pr_state=$(echo "$pr_json" | jq -r '.state')
      if [ -n "$pr_number" ] && [ "$pr_number" != "null" ] && [ "$pr_state" = "OPEN" ]; then
        # OSC 8 hyperlink: ESC]8;;URL ESC\\ TEXT ESC]8;; ESC\\
        pr_link="${ESC}]8;;${pr_url}${ESC}\\#${pr_number}${ESC}]8;;${ESC}\\ "
      fi
    fi
  fi

  git_info="[${branch}${suffix}]${pr_link}→ "
fi

# ---------------------------------------------------------------------------
# Output
# ---------------------------------------------------------------------------
# Line 1: time_date - user@host (green)  [Model] (colored)  progress_bar
printf "%s - \033[01;32m%s\033[00m" "$time_date" "$user_host"
[ -n "$model_label" ]  && printf " %b" "$model_label"
[ -n "$context_bar" ]  && printf "%b" "$context_bar"
printf "\n"
# Line 2: git info + cwd (blue)
printf "%b\033[01;34m%s\033[00m" "$git_info" "$cwd"
