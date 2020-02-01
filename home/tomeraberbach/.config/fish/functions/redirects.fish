function redirects
  if test "$argv" = 'edit'
    cd (dirname (redirects))
    
    vim _redirects
    
    if test -n (git status --porcelain)
      git commit -am 'feat: edit _redirects'
      and git push
    end

    cdb
  else
    unit ~/Documents/Tomer/work/avocational/code/inactive/complete/tomer.link/_redirects
  end
end

