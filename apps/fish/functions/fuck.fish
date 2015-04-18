if test (thefuck) = "echo No fuck given"
  function fuck --description 'Tries to fix last command'
    thefuck $history[1] | source
  end
else
  function fuck --description 'Replays last command with sudo'
    sudo (echo $history[1])
  end
end
