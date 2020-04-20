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
    # Start
    case 'clone' 'clon' 'clo' 'cl'
      _run clone $after_command

    case 'init'
      _run init $after_command
      and _run commit --allow-empty --allow-empty-message -m ''

    # Inspect
    case 'diff' 'dif' 'di' 'd'
      _run diff $after_command
    
    case 'grep' 'gre' 'gr' 'g'
      _run grep $after_command

    case 'log' 'lo' 'l'
      _run log $after_command

    case 'show' 'sho' 'sh'
      _run show --stat --oneline $after_command

    case 'status' 'statu' 'stat' 'sta' 'st' 's'
      _run status --short $after_command

    # Work
    case 'add' 'ad' 'a'
      if test (count $after_command) = 0
        set after_command '--all'
      end
      
      _run add $after_command

    case 'unadd' 'unad' 'una'
      _run reset HEAD -- $after_command > /dev/null
      and _run add --intent-to-add $after_command

    #             Nice 
    case 'amend' 'amen' 'amn'
      _run commit --amend -C $after_command HEAD

    #                 Sad
    case 'unamend' 'unamen' 'unamn'
      _run reset --soft $after_command HEAD@{1}

    case 'branch' 'branc' 'bran' 'bra' 'br' 'b'
      _run branch $after_command
      
    case 'checkout' 'checkou' 'checko' 'check' 'chec' 'che' 'ch' 'co'
      _run checkout $after_command

    case 'commit' 'commi' 'comm' 'com' 'cm'
      _run commit $after_command
      
    case 'uncommit' 'uncommi' 'uncomm' 'uncom' 'uncm'
      _run reset --soft $after_command HEAD~

    case 'merge' 'merg' 'mer' 'me' 'm'
      _run merge $after_command

    case 'mv'
      _run mv $after_command
      
    case 'rebase' 'rebas' 'reba' 'reb' 're' 'r'
      _run rebase $after_command
    
    case 'reset' 'rese' 'res'
      _run reset $after_command

    case 'restore' 'restor' 'resto' 'rest'
      _run restore $after_command

    case 'revise' 'revis' 'revi' 'rev'
      set -l new (_run diff --name-only --diff-filter=A)
      and _run add $new > /dev/null
      and _run stash push --all > /dev/null
      and _run commit --amend $after_command
      and _run stash pop > /dev/null
      and _run reset HEAD -- $new > /dev/null
      and _run add --intent-to-add $new > /dev/null
      
    case 'rm'
      _run rm $after_command
      
    case 'switch' 'switc' 'swit' 'swi' 'sw'
      _run switch $after_command
      
    case 'tag' 'ta'
      _run tag $after_command

    case 'track' 'trac' 'tra' 'tr' 't'
      _run add --intent-to-add $after_command

    case 'untrack' 'untrac' 'untra' 'untr' 'unt'
      if test (count $after_command) = 0
        set after_command '.'
      end

      _run rm --cached $after_command

    # Collaborate
    case 'fetch' 'fetc' 'fet' 'fe' 'f'
      _run fetch $after_command
    
    case 'pull' 'pul' 'pl'
      _run pull $after_command
      
    case 'push' 'pus' 'ps'
      _run push $after_command

    # Other
    case '*'
      _run $command $after_command
  end
  
  functions -e _run
  set -e before_command
end
