function git -w 'hub'
  set -g before_command
  set -l command ''
  set -l after_command

  for arg in $argv
    if test -n $command
      set -a after_command $arg
    else if string match -qr '^-' -- $arg
      set -a before_command $arg
    else
      set command $arg
    end
  end
  
  function _run
    command hub $before_command $argv
  end

  switch $command
    case 'init'
      _run init $after_command
      and _run commit --allow-empty --allow-empty-message -m ''

    case 'status' 'statu' 'stat' 'sta' 'st' 's'
      _run status --short $after_command

    case 'show' 'sho' 'sh'
      _run show --stat --oneline $after_command

    case 'diff' 'dif' 'di' 'd'
      _run diff $after_command
      
    case 'branch' 'branc' 'bran' 'bra' 'br' 'b'
      _run branch $after_command
      
    case 'checkout' 'co'
      _run checkout $after_command

    case 'track' 'trac' 'tra' 'tr' 't'
      _run add --intent-to-add $after_command

    case 'untrack' 'untrac' 'untra' 'untr' 'unt'
      if test (count $after_command) = 0
        set after_command '.'
      end

      _run rm --cached $after_command

    case 'add' 'ad' 'a'
      if test (count $after_command) = 0
        set after_command '.'
      end
      
      _run add $after_command

    case 'unadd' 'unad' 'una'
      _run reset HEAD -- $after_command > /dev/null
      and _run add --intent-to-add $after_command

    case 'commit' 'commi' 'comm' 'com' 'cm'
      _run commit $after_command
      
    case 'uncommit' 'uncommi' 'uncomm' 'uncom' 'uncm'
      _run reset --soft $after_command HEAD~

    case 'reword' 'rewor' 'rewo' 'rew' 're' 'r'
      set -l new (_run diff --name-only --diff-filter=A)
      and _run add $new > /dev/null
      and _run stash push --all > /dev/null
      and _run commit --amend $after_command
      and _run stash pop > /dev/null
      and _run reset HEAD -- $new > /dev/null
      and _run add --intent-to-add $new > /dev/null
      
    #             Nice 
    case 'amend' 'amen' 'amn'
      _run commit --amend -C $after_command HEAD
      
    #                 Sad
    case 'unamend' 'unamen' 'unamn'
      _run reset --soft $after_command HEAD@{1}

    case '*'
      _run $command $after_command
  end
  
  functions -e _run
  set -e before_command
end
