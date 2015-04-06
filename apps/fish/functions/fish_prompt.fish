# fish git prompt
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'yes'
set __fish_git_prompt_showupstream 'yes'
set __fish_git_prompt_color_branch yellow

# Status Chars
set __fish_git_prompt_char_dirtystate '⚡'
set __fish_git_prompt_char_stagedstate '→'
set __fish_git_prompt_char_stashstate '↩'
set __fish_git_prompt_char_upstream_ahead '↑'
set __fish_git_prompt_char_upstream_behind '↓'


function fish_prompt --description 'Write out the prompt'

  set -l battery_raw (pmset -g batt)
  set -l curr_time (date "+%A %B %d at %R")
  set -l battery_info (pmset -g batt | awk 'gsub(/;/,"") {if ($1 ~ /Battery/) print $2", "$4" remaining"}')
  set -l last_status $status

	if not set -q __fish_prompt_normal
		set -g __fish_prompt_normal (set_color normal)
	end

  # Start Prompt
  echo ""

  # Time
  printf '%s' $curr_time
  set_color blue
  echo -n " -- "

  # Battery
  if test (pmset -g batt | grep "AC Power")
    set_color green
  else
    set_color blue
  end
  printf '%s\n' $battery_info
  set_color normal

  # HOST USER
  set_color 199696
  printf '%s@%s ' $USER (hostname -s)

	# PWD
	set_color $fish_color_cwd
  printf '%s' (prompt_pwd)
	set_color normal

  # GIT
	printf '%s ' (__fish_git_prompt)

	if not test $last_status -eq 0
    set_color $fish_color_error
	end

	echo -n "[$last_status]"
  set_color normal

  # Prompt Symbol
  switch $USER
     case root; set prompt_symbol '#'
     case '*';  set prompt_symbol '$'
  end

  echo -n "$prompt_symbol "
end
