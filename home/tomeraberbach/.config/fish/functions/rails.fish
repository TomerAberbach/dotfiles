function rails -w 'rails'
  command env RUBYOPT='-W:no-deprecated -W:no-experimental' rails $argv
end

